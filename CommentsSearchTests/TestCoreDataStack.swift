//
//  TestCoreDataStack.swift
//  CommentsSearchTests
//
//  Created by Jessica on 13.02.23.
//

import XCTest
import CoreData
import CommentsSearch

class TestCoreDataStack: NSObject {
    
    var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        
        let container = NSPersistentContainer(name: "TestingDB")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        }
        
        return container
    }()
}


//
//class TestCoreDataStack: CoreDataStack {
//  override init() {
//    super.init()
//
//    // 1
//    let persistentStoreDescription = NSPersistentStoreDescription()
//    persistentStoreDescription.type = NSInMemoryStoreType
//
//    // 2
//    let container = NSPersistentContainer(
//      name: CoreDataStack.modelName,
//      managedObjectModel: CoreDataStack.model)
//
//    // 3
//    container.persistentStoreDescriptions = [persistentStoreDescription]
//
//    container.loadPersistentStores { _, error in
//      if let error = error as NSError? {
//        fatalError("Unresolved error \(error), \(error.userInfo)")
//      }
//    }
//
//    // 4
//    storeContainer = container
//  }
//}
//
