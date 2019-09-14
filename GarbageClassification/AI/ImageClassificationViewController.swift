//
//  ImageClassificationViewController.swift
//  GarbageClassification
//
//  Created by 胡方 on 2019/7/30.
//  Copyright © 2019 胡方. All rights reserved.
//

import UIKit
import CoreML
import Vision
import ImageIO
import CoreData

class ImageClassificationViewController: UIViewController {
    var standardList = [NSManagedObject?]()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var classificationLabel: UILabel!
    
    override func viewDidLoad() {
        standardList = CoreDataHelper.retrieveDataFromDB()
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: MobileNet().model)
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in
                self?.processClassifications(for: request, error: error)
            })
            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    func updateClassifications(for image: UIImage) {
        classificationLabel.text = "识别中，请稍候..."
        
        let orientation = CGImagePropertyOrientation(image.imageOrientation)
        guard let ciImage = CIImage(image: image) else { fatalError("Unable to create \(CIImage.self) from \(image).") }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                self.classificationLabel.text = "图像无法识别，请换照片并重试。\n\(error!.localizedDescription)"
                return
            }
            let classifications = results as! [VNClassificationObservation]
            
            if classifications.isEmpty {
                self.classificationLabel.text = "未识别到有效物体。"
            } else {
                let topClassifications = classifications.prefix(2)
                let descriptions = topClassifications.map { classification in
                    return String(format: "  (%.2f) %@", classification.confidence, classification.identifier)
                }
                self.classificationLabel.text = "识别结果:\n" + descriptions.joined(separator: "\n")
                
                let standardList = self.standardList
                for descItem in descriptions {
                    let words = descItem.components(separatedBy: " ")
                    guard let recogItem = words.last else {continue}

                    for standardItem in standardList {
                        guard let standardItem = standardItem,
                            let keyword = standardItem.value(forKey: "keywords") as? String else {continue}
                        if keyword.contains(recogItem) {
                            guard let garbageType = standardItem.value(forKey: "type") as? String else {continue}
                            guard let itemName = standardItem.value(forKey: "name") as? String,
                                let str: String = "物品：" + itemName + "(" + recogItem + ")\n分类：" + garbageType else {continue}
                            self.classificationLabel.text = str
                            return
                        }
                    }
                }
                
                let phrase = descriptions.first?.components(separatedBy: ")").last
                guard let strDefault: String = "物品：" + (phrase ?? "未知" ) + "\n分类：未知" else {return}
                self.classificationLabel.text = strDefault
            }
        }
    }
    
    @IBAction func takePicture() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
        
        let photoSourcePicker = UIAlertController()
        let takePhoto = UIAlertAction(title: "拍照", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .camera)
        }
        let choosePhoto = UIAlertAction(title: "选取本地照片", style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        
        present(photoSourcePicker, animated: true)
    }
    
    func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
}

extension ImageClassificationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = image
        updateClassifications(for: image)
    }
}
