//
//  CommentsRepository.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation
import CoreData

protocol CommentsRepository {

    func searchComments(query: String) async throws -> [CommentsDto]
    
    func getAllComments() async throws
}

class MyCommentsRepository: CommentsRepository, ObservableObject {
    
    
    
    let commentsApi: Api
    let controller: PersistenceController
    
    init(commentsApi: Api, controller: PersistenceController) {
        self.commentsApi = commentsApi
        self.controller = controller
    }
    
    func searchComments(query: String) async throws -> [CommentsDto] {
        
        return try await commentsApi.searchResult(query: query)
    }
    
    func getAllComments() async throws {
        
        // delete all from db
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Comments")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        try controller.container.persistentStoreCoordinator.execute(deleteRequest, with: controller.container.viewContext)
       
        let commentDtos = try await commentsApi.getAllComments()
        commentDtos.forEach { dto in
            let comment = Comments(context: controller.container.viewContext)
            comment.map(from: dto)
        }
        
        try controller.container.viewContext.save()
    }
    
}
