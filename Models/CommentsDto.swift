//
//  CommentsDto.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation

struct CommentsDto: Codable, Identifiable {
    
    var id: Int
    var post_id: Int
    var name: String
    var email: String
    var comment_body: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case post_id = "postId"
        case name
        case email
        case comment_body = "body"
        
    }
}
