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
}
