//
//  UIImageViewExtension.swift
//  MarsRover
//
//  Created by Mert Yılmaz on 19.09.2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setPicture(pictureUrl: String) {
        self.kf.setImage(with: URL(string: pictureUrl))
    }
    
}
