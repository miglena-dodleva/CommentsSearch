//
//  Responce.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation


struct Response: Codable {
    
    var items: [CommentsDto]
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
}

