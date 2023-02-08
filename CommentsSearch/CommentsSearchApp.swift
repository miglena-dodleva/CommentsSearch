//
//  CommentsSearchApp.swift
//  CommentsSearch
//
//  Created by Jessica on 6.02.23.
//

import SwiftUI

@main
struct CommentsSearchApp: App {
    let persistenceController = PersistenceController.shared

    private var commentsService = MyCommentsRepository(commentsApi: MyApi(networkClient: MyNetworkClient(), router: MyRouter()))
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(commentsService)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
