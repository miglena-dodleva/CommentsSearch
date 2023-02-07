//
//  Api.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation

protocol Api {
    
    func searchResult(query:String) async throws -> Responce
    
}
