//
//  ContentView.swift
//  CommentsSearch
//
//  Created by Jessica on 6.02.23.
//

import SwiftUI
import CoreData

struct RootView: View {
    
    @EnvironmentObject var commentsService: MyCommentsRepository
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var applicationState: AplicationState = AplicationState()

    var body: some View {
        
        switch applicationState.appState {
            case .splash:
                Page1View()
                    .environmentObject(applicationState)
                
            case .main:
                SearchView()
                    .environmentObject(applicationState)
            }
    }

    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
