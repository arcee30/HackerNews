//
//  PostData.swift
//  HackerNews
//
//  Created by Arshaan Sayed on 6/25/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
    
}
