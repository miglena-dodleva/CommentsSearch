//
//  Api.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation

protocol Api {
    
    func searchResult(query:String) async throws -> [CommentsDto]
    
    func getAllComments() async throws -> [CommentsDto]
}
   
class MyApi: Api {
    
    let networkClient: NetworkClient
    let router: Router
    
    init(networkClient: NetworkClient, router: Router){
        self.networkClient = networkClient
        self.router = router
    }
    
    func searchResult(query: String) async throws -> [CommentsDto] {
        
        var urlComponents = URLComponents(url: router.searchEndpoint, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            .init(name: "postId", value: query)
        ]
        
        guard let url = urlComponents?.url else {
            return []
        }
//        let requestUrl = URL(string: "\(router.searchEndpoint)?postId=\(query)")!
        
        let request = URLRequest(url: url, method: .get)
        
        return try await networkClient.perform(request)
        
    }
    
    func getAllComments() async throws -> [CommentsDto] {
        let requestUrl = URL(string: "\(router.searchEndpoint)")!
        
        let request = URLRequest(url: requestUrl, method: .get)
        
        return try await networkClient.perform(request)
        
    }
    
}
