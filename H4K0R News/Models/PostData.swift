//
//  PostData.swift
//  H4K0R News
//
//  Created by Harry Wright on 28/10/2020.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
