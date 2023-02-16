//
//  CoreDataTests.swift
//  CommentsSearchTests
//
//  Created by Jessica on 16.02.23.
//

import XCTest
import CoreData
@testable import CommentsSearch

final class CoreDataTests: XCTestCase {

    var persistentStoreCoordinator: NSPersistentStoreCoordinator!
    var managedObjectContext: NSManagedObjectContext!
    var model: NSManagedObjectModel!
        
    override func setUp() {
        super.setUp()
            
        model = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
            
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCommentsEntity() {
        let comments = NSEntityDescription.insertNewObject(forEntityName: "Comments", into: managedObjectContext) as! Comments
        
        comments.id = 2
        comments.post_id = 5
        comments.name = "John"
        comments.email = "john@gmail.com"
        comments.comment_body = "Kill it"
        
        XCTAssertEqual(comments.name, "John")
        XCTAssertEqual(comments.id, 2)
        XCTAssertEqual(comments.post_id, 5)
        XCTAssertEqual(comments.email, "john@gmail.com")
        XCTAssertEqual(comments.comment_body, "Kill it")
      
    }

}
