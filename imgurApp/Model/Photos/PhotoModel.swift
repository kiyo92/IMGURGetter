//
//  PhotoModel.swift
//  imgurApp
//
//  Created by Joao Marcus Dionisio Araujo on 29/01/22.
//

import Foundation

struct PhotoData: Decodable {
    var data: [Photo]?
}

struct Photo: Decodable {
    var title: String?
    var link: String?
    var images: [PhotoImages]?
}

struct PhotoImages: Decodable {
    var link: String?
}

/**
 "data":[
       {
          "id":"MczEyQ5",
          "title":"This is so heartwarming, he is so happy now!",
          "description":null,
          "datetime":1643420013,
          "type":"image/gif",
          "animated":true,
          "width":728,
          "height":1292,
          "size":377142681,
          "views":7622949,
          "bandwidth":2874939422986269,
          "vote":null,
          "favorite":false,
          "nsfw":false,
          "section":"",
          "account_url":"GreenPinkBlueDead",
          "account_id":17232348,
          "is_ad":false,
          "in_most_viral":true,
          "has_sound":false,
          "tags":[
             {
                "name":"awesome",
                "display_name":"awesome",
                "followers":1503020,
                "total_items":751126,
                "following":false,
                "is_whitelisted":false,
                "background_hash":"4kmYoey",
                "thumbnail_hash":null,
                "accent":"8472BD",
                "background_is_animated":false,
                "thumbnail_is_animated":false,
                "is_promoted":false,
                "description":"neat and amazing",
                "logo_hash":null,
                "logo_destination_url":null,
                "description_annotations":{
                   
                }
             },
             {
                "name":"aww",
                "display_name":"aww",
                "followers":3387865,
                "total_items":763471,
                "following":false,
                "is_whitelisted":false,
                "background_hash":"avRBRpN",
                "thumbnail_hash":null,
                "accent":"60AEBB",
                "background_is_animated":false,
                "thumbnail_is_animated":false,
                "is_promoted":false,
                "description":"cute and adorable",
                "logo_hash":null,
                "logo_destination_url":null,
                "description_annotations":{
                   
                }
             },
             {
                "name":"storytime",
                "display_name":"storytime",
                "followers":37209,
                "total_items":107233,
                "following":false,
                "is_whitelisted":false,
                "background_hash":"pXmzlGx",
                "thumbnail_hash":null,
                "accent":"9748B6",
                "background_is_animated":false,
                "thumbnail_is_animated":false,
                "is_promoted":false,
                "description":"that one time...",
                "logo_hash":null,
                "logo_destination_url":null,
                "description_annotations":{
                   
                }
             }
          ],
          "ad_type":0,
          "ad_url":"",
          "edited":0,
          "in_gallery":true,
          "topic":null,
          "topic_id":0,
          "link":"http://i.imgur.com/MczEyQ5h.gif",
          "mp4":"https://i.imgur.com/MczEyQ5.mp4",
          "gifv":"https://i.imgur.com/MczEyQ5.gifv",
          "hls":"https://i.imgur.com/MczEyQ5.m3u8",
          "mp4_size":31267090,
          "looping":true,
          "processing":{
             "status":"completed"
          },
          "ad_config":{
             "safeFlags":[
                "in_gallery",
                "sixth_mod_safe",
                "gallery"
             ],
             "highRiskFlags":[
                
             ],
             "unsafeFlags":[
                
             ],
             "wallUnsafeFlags":[
                
             ],
             "showsAds":true
          },
          "comment_count":117,
          "favorite_count":694,
          "ups":3903,
          "downs":37,
          "points":3866,
          "score":7677,
          "is_album":false
       },
 */
