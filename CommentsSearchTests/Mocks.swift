//
//  Mocks.swift
//  CommentsSearchTests
//
//  Created by Jessica on 9.02.23.
//

import Foundation


@testable import CommentsSearch

class MockRouter: Router {
    
    lazy var base = Bundle(url: Bundle(for: type(of: self)).url(forResource: "Mocks", withExtension: "bundle")!)!.bundleURL
    
    var searchEndpoint: URL {
        base.appending(path: "mycommments")
    }
}

extension MyCommentsRepository {
    static func makeMoc() -> CommentsRepository {
        
        let router = MockRouter()
        let networkClient = MyNetworkClient()
        let api = MyApi(networkClient: networkClient, router: router)
        let repo = MyCommentsRepository(commentsApi: api)
        return repo
    }
}
