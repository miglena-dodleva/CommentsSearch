//
//  CommentsRepository.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation

protocol CommentsRepository {

    func searchComments(query: String) async throws -> [CommentsDto]
    
    func getAllComments() async throws -> [CommentsDto]
}

class MyCommentsRepository: CommentsRepository, ObservableObject {
    
    let commentsApi: Api
    init(commentsApi: Api) {
        self.commentsApi = commentsApi
    }
    
    func searchComments(query: String) async throws -> [CommentsDto] {
        
        return try await commentsApi.searchResult(query: query)
    }
    
    func getAllComments() async throws -> [CommentsDto] {
        return try await commentsApi.getAllComments()
    }
    
}

