//
//  Comments.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import Foundation
import CoreData

public class Comments: NSManagedObject{
    
    @NSManaged public var id: NSNumber
    @NSManaged public var post_id: NSNumber
    @NSManaged public var name: String
    @NSManaged public var email: String
    @NSManaged public var comment_body: String
    
}

extension Comments: Identifiable {
    
    func map(from dto:CommentsDto){
        self.id = NSNumber(value: dto.id)
        self.post_id = NSNumber(value: dto.post_id)
        self.name = dto.name
        self.email = dto.email
        self.comment_body = dto.comment_body
        
    }
    
    
}
