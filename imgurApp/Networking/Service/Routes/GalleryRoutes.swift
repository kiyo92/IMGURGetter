//
//  GalleryRoutes.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 30/01/22.
//

import Foundation

struct GalleryRoutes {
    
    var endpoint: Endpoint = .gallery
    let shared = APIConstants.shared


    func build(section: String, page: Int, showViral: Bool, mature: Bool, albumPreviews: Bool) -> String {
        return "\(shared.baseURL)\(shared.apiVersion)/\(endpoint.rawValue)/\(section)/\(page)/showViral=\(showViral)&mature=\(mature)&album_previews=\(albumPreviews)"
    }
}
