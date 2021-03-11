//
//  Item.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import Foundation

struct DataItem: Codable {
    var data: Items?
    enum Codingkeys: String, CodingKey {
        case data
    }
}

struct Items: Codable {
    var content: [Item] = []
    enum CodingKeys: String, CodingKey {
        case content
    }
    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self){
                content = try container.decode(Array.self, forKey: .content)
        }
    }
    
}
struct Item: Codable {
    var name: String = ""
    var image: String = ""
    var price: Int = 0
    var descrip: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case image
        case descrip = "description"
        case price
    }
    
    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self){
                name = try container.decode(String.self, forKey: .name)
                image = try container.decode(String.self, forKey: .image)
                descrip = try container.decode(String.self, forKey: .descrip)
                price = try container.decode(Int.self, forKey: .price)
        }
    }
}
