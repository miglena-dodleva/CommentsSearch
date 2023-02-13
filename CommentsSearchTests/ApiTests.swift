//
//  ApiTests.swift
//  CommentsSearchTests
//
//  Created by Jessica on 13.02.23.
//

import XCTest
import Foundation
@testable import CommentsSearch

final class ApiTests: XCTestCase {
        
        let comments = MyCommentsRepository.makeMoc()
        
        func testSearchRepos() async {
            
            let response = try! await comments.searchCommentsFromApi(query: "2")

            XCTAssertEqual(response.count, 5)
                           
//            let response = try! await comments.searchComments(query: "1")
//            XCTAssertEqual(response., <#T##expression2: Equatable##Equatable#>)
            
         
        }

}
