//
//  CommentsRepository.swift
//  CommentsSearch
//
//  Created by Jessica on 7.02.23.
//

import Foundation
import CoreData

protocol CommentsRepository {

    func searchComments(query: String) async throws -> [Comments]
    
    func getAllComments() async throws
    
    func getAllCommentsFromDB() async throws -> [Comments]
}

class MyCommentsRepository: CommentsRepository, ObservableObject {
    
    let commentsApi: Api
    let controller: PersistenceController
    
    init(commentsApi: Api, controller: PersistenceController) {
        self.commentsApi = commentsApi
        self.controller = controller
    }
    
    func searchComments(query: String) async throws -> [Comments] {
        
        let dtos = try await commentsApi.searchResult(query: query)
        let fetchRequest = NSFetchRequest<Comments>(entityName: "Comments")
        
        for dto in dtos {
        
            fetchRequest.predicate = NSPredicate(format: "id == %@", dto.id)
            let commentExitings = try controller.container.viewContext.fetch(fetchRequest).first ?? Comments(context: controller.container.viewContext)
            commentExitings.map(from: dto)

        }
        try controller.container.viewContext.save()
        
        let fetchRequest2 = NSFetchRequest<Comments>(entityName: "Comments")
        fetchRequest2.predicate = NSPredicate(format: "post_id == %@", query)
        return try controller.container.viewContext.fetch(fetchRequest2)
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
    
    func getAllCommentsFromDB() async throws -> [Comments] {
        let fetchRequest = NSFetchRequest<Comments>(entityName: "Comments")
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Comments.id, ascending: true)]
        
        return try controller.container.viewContext.fetch(fetchRequest)
    }
    
}
