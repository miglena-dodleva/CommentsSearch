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

    var commentsService = MyCommentsRepository(commentsApi: MyApi(networkClient: MyNetworkClient(), router: MyRouter()), controller: PersistenceController.shared)
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(commentsService)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        if ProcessInfo.processInfo.arguments.contains("UNIT_TESTING") {
            
            self.window?.rootViewController = UIViewController()
            return false
        }
        
        return true
    }
}
