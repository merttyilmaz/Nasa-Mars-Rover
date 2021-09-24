//
//  PhotosCollectionViewCell.swift
//  MarsRover
//
//  Created by Mert Yılmaz on 20.09.2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setPhoto(url: String) {
        DispatchQueue.main.async {
            self.imageView.setPicture(pictureUrl: url)
        }
    }

}
