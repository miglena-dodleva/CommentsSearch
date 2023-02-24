//
//  ApiTests.swift
//  CommentsSearchTests
//
//  Created by Jessica on 13.02.23.
//

import SwiftUI
import XCTest
import Foundation
@testable import CommentsSearch

class Tests: XCTestCase {
        
        let repo = MyCommentsRepository.makeMoc()

        func testSearchRepos() async {
            
            // assert data in db is empty
            let commentsFromDBFirstTime = try? await repo.getAllCommentsFromDB()
            
            XCTAssertEqual(commentsFromDBFirstTime?.count, 0)
            
            // get all comments from api
            try? await repo.getAllComments()
            
            // assert that data in db is equal to data from api
            let commentsFromDB = try? await repo.getAllCommentsFromDB()
               
            XCTAssertNotNil(commentsFromDB)
            XCTAssertEqual(commentsFromDB?[0].email, "Eliseo@gardner.biz")
            
            XCTAssertEqual(commentsFromDB?[1].post_id, 1)
            
            XCTAssertEqual(commentsFromDB?[4].name, "vero eaque aliquid doloribus et culpa")
            
            XCTAssertEqual(commentsFromDB?[2].id, 3)
            
            // here we tests search with query + update
            
            let searchComments = try? await repo.searchComments(query: "2")
            XCTAssertEqual(searchComments?[1].email, "Dall@gmail.com")


//        }
//    func testSearchReposQuery() async {
//
//        // assert data in db is empty
//        let commentsFromDBFirstTime = try? await repo.getAllCommentsFromDB()
//
//        XCTAssertEqual(commentsFromDBFirstTime?.count, 0)
//
//        // get all comments from api
//        try! await repo.getAllComments()
//
//        // assert that data in db is equal to data from api
//        let commentsFromDB = try? await repo.getAllCommentsFromDB()
//
//        XCTAssertNotNil(commentsFromDB)
//        XCTAssertEqual(commentsFromDB?[0].email, "Eliseo@gardner.biz")
//
//        XCTAssertEqual(commentsFromDB?[1].post_id, 1)
//
//        XCTAssertEqual(commentsFromDB?[4].name, "vero eaque aliquid doloribus et culpa")
//
//        XCTAssertEqual(commentsFromDB?[2].id, 3)
//
//        // here we tests search with query + update
//        let searchComments = try? await repo.searchComments(query: "2")
//        XCTAssertEqual(searchComments?[1].email, "Dall@gmail.com")


    }
    

}
