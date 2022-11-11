//
//  Item.swift
//  List
//
//  Created by Станислав Зверьков on 25.10.2022.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
