//
//  CGImagePropertyOrientation+UIImageOrientation.swift
//  GarbageClassification
//
//  Created by 胡方 on 2019/7/30.
//  Copyright © 2019 胡方. All rights reserved.
//

import UIKit
import ImageIO

extension CGImagePropertyOrientation {
    
    init(_ orientation: UIImage.Orientation) {
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}
