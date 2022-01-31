//
//  HomeCollectionViewCell.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 29/01/22.
//

import UIKit
import AVFoundation
class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(image: UIImage){
        imageView.image = image
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
