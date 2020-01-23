//
//  Comment.swift
//  Memeful
//
//  Created by Sunmoon on 24/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//

import Foundation

struct CommentsList: Codable {
    var data:[Comment]
}
struct Comment: Codable {
    var id: Int?
    var image_id: String?
    var comment:String?
    var author:String?
    var author_id:Int?
    var on_album:Bool?
    var album_cover:String?
    var ups:Int?
    var downs:Int?
    var points:Int?
    var datetime:Int?
    var parent_id:Int?
    var deleted:Bool?
    var platform:String?
    var children:[Comment]?
}
