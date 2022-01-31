//
//  UIImage+Extensions.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 31/01/22.
//

import AVFoundation
import UIKit

extension UIImage {
    func getImageFromWeb (from url: String) -> UIImage {
        var image : UIImage?
        guard let url = URL(string: url) else { return UIImage() }
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)
        }
        return image ?? UIImage()
    }
    
    func getVideoThumbFromWeb(from url: String) -> UIImage {
        var image: UIImage?
        guard let url = URL(string: url) else { return UIImage() }
        let asset = AVURLAsset(url: url , options: nil)
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        guard let cgImage = try? imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil) else { return UIImage() }
        
        let uiImage = UIImage(cgImage: cgImage)
        image = uiImage
        
        return image ?? UIImage()
    }
}
