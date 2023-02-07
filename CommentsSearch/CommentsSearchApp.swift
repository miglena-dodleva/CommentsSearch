//
//  CommentsSearchApp.swift
//  CommentsSearch
//
//  Created by Jessica on 6.02.23.
//

import SwiftUI

//let persistenceController = PersistenceController.shared

@main
struct CommentsSearchApp: App {
    
    private var comments = MyCommentsRepository(commentsApi: MyApi(networkClient: MyNetworkClient(), router: MyRouter()))

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                 .environmentObject(comments)
//                 .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
