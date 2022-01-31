//
//  HomePresenter.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 30/01/22.
//

import Foundation
import Alamofire

protocol HomePresenterDelegate: AnyObject {
    func didGetSuccess(photos: PhotoData)
    func didGetFailure(error: String)
}

class HomePresenter {

    weak var delegate: HomePresenterDelegate?
    var currentPage = 1
    
    func getPhotos() {
        
        let url = GalleryRoutes().build(section: "top",page: currentPage ,showViral: true, mature: true, albumPreviews: true)
        let encoding = JSONEncoding.default
        
        Network().request(data: RequestData(url: url, method: .get, encoding: encoding),
                          decoder: DefaultDecoder(expectation: PhotoData.self),
                          success: { response in
                            self.delegate?.didGetSuccess(photos: response ?? PhotoData())
                          },
                          failure: { error in
                            self.delegate?.didGetFailure(error: "Algo deu errado")
                          })
        
    }
}
