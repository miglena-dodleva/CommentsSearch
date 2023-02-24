//
//  MyRouter.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation

class MyRouter: Router {
    
    private let base: String = "https://jsonplaceholder.typicode.com/"
    
    var searchEndpoint: URL {
        return URL(string: base + "comments")!
    }
}
