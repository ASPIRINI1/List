//
//  Item.swift
//  List
//
//  Created by Станислав Зверьков on 25.10.2022.
//

import Foundation

struct Post: Decodable {    
    var albumId: Int
    var id: Int
    var title: String
    var imageURL: String
    var thumbnailUrl: String
    var image: Data?
}
