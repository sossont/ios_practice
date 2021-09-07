//
//  PostData.swift
//  news swiftUI
//
//  Created by 정환우 on 2021/08/19.
//

import Foundation

struct Results : Decodable {
    let hits:[Post]
}

struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
