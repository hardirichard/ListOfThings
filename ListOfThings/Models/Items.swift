//
//  Items.swift
//  ListOfThings
//
//  Created by Richárd Hardi on 2021. 02. 09..
//

import Foundation
import UIKit


struct Items: Decodable {
    let all: [Item]
}


struct Item: Decodable {
    let albumId: Double
    let id: Double
    let thumbnailUrl: String
    let title: String
    let url: String
}
