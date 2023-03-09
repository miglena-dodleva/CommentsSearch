//
//  Mocks.swift
//  CommentsSearchTests
//
//  Created by Jessica on 9.02.23.
//
import SwiftUI
import Foundation
@testable import CommentsSearch

class MockRouter: Router {
    
    @State var baseEndPoint = false
    
    lazy var base = Bundle(url: Bundle(for: type(of: self)).url(forResource: "Mocks", withExtension: "bundle")!)!.bundleURL
    
    var searchEndpoint: URL {
        base.appending(path: "commentsrepos")
    }
}

extension MyCommentsRepository {
    static func makeMoc() -> CommentsRepository {
        
        let router = MockRouter()
        let networkClient = MyNetworkClient()
        let api = MyApi(networkClient: networkClient, router: router)
        let repo = MyCommentsRepository(commentsApi: api, controller: PersistenceController.preview)
        return repo
    }
    
}
