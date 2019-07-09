//
//  SearchViewController.swift
//  GarbageClassification
//
//  Created by 胡方 on 2019/6/28.
//  Copyright © 2019 胡方. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [NSManagedObject?]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func textEditingDidExit(_ sender: Any) {
        searchBtnTapped(sender)
    }

    @IBAction func searchBtnTapped(_ sender: Any) {
        resetPage()
        guard let inputText = inputTextField.text else { return }
        var foundFlag = false
        
        for i in 0..<data.count {
            guard let name = data[i]?.value(forKey: "name") as? String else { return }
            if name.contains(inputText) {
                foundFlag = true
                tableView.selectRow(at: IndexPath.init(row: i, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
                break
            }
        }
        
        if !foundFlag {
            handleNoSearchResult()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = CoreDataHelper.retrieveDataFromDB()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = UIColor.init(red: 0.566, green: 0.898, blue: 0.527, alpha: 1)
        
        let nameLabel = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: view.frame.width - 40, height: view.frame.height))
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = UIColor.black
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.text = "物品名称"
        view.addSubview(nameLabel)
        
        let classLabel = UILabel.init(frame: CGRect.init(x: 20 , y: 0, width: view.frame.width - 40, height: view.frame.height))
        classLabel.textAlignment = .right
        classLabel.font = UIFont.systemFont(ofSize: 18)
        classLabel.textColor = UIColor.black
        nameLabel.backgroundColor = UIColor.clear
        classLabel.text = "类别"
        view.addSubview(classLabel)
        
        return view;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "garbageTableViewCell") as! GarbageTableViewCell
        cell.name.text = data[indexPath.row]?.value(forKey: "name") as? String
        cell.type.text = data[indexPath.row]?.value(forKey: "type") as? String
        cell.keywords.text = data[indexPath.row]?.value(forKey: "keywords") as? String
        cell.keywords.isHighlighted = true
        return cell
    }
    
    fileprivate func handleNoSearchResult() {
        let alertController = UIAlertController(title: "提示", message: "没有找到对应的类型，建议修改、缩短关键字，重新查询。", preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func resetPage() {
        guard let tableView = tableView,
            let indexPaths = tableView.indexPathsForSelectedRows else { return }
        for indexPath in indexPaths {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
