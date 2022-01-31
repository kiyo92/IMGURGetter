//
//  HomeViewController.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 29/01/22.
//

import UIKit
import AVFoundation
class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingView: UIView!
    
    var collectionViewLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width / 4) - 20, height: (view.bounds.width / 4) - 20)
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    let presenter: HomePresenter = HomePresenter()
    
    var photos: [Photo] = []
    var photosImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.delegate = self
        collectionView.dataSource = self
        presenter.delegate = self
        presenter.getPhotos()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return HomeCollectionViewCell()
        }
        cell.setup(image: self.photosImages[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.item == photos.count - 1 {
            if(loadingView.isHidden){
                presenter.currentPage += 1
                presenter.getPhotos()
                loadingView.isHidden = false
            }
        }
        
    }
    
}

extension HomeViewController: HomePresenterDelegate {
    func didGetSuccess(photos: PhotoData) {
        
        for photo in photos.data ?? []{
            if(photo.images != nil){
                guard let link = photo.images?[0].link else {
                    return
                }
                if (link.contains(".mp4")){
                    self.photosImages.append(UIImage().getVideoThumbFromWeb(from: link))
                } else {
                    self.photosImages.append(UIImage().getImageFromWeb(from: link))
                }
            } else {
                guard let link = photo.link else {
                    return
                }
                if(link.contains(".mp4")){
                    self.photosImages.append(UIImage().getVideoThumbFromWeb(from: link))
                } else {
                    self.photosImages.append(UIImage().getImageFromWeb(from: link))
                }
            }
        }
        
        if(presenter.currentPage > 1){
            self.photos += photos.data ?? []
            collectionView.reloadData()
            loadingView.isHidden = true
            return
        }
        
        self.photos = photos.data ?? []
        collectionView.reloadData()
        loadingView.isHidden = true
    }
    
    func didGetFailure(error: String) {
        loadingView.isHidden = true
        print(error)
    }
    
    private func createImage(url: String) -> UIImage{
        var image : UIImage?
        let url = URL(string: url)!
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)
        }
        return image ?? UIImage()
    }
    
    private func createImageFromVideo(url: String) -> UIImage {
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
