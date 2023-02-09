//
//  SearchView.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var query = ""
    @State private var results: [Comments] = []
    @State private var isLoading: Bool = false
    
    @EnvironmentObject var commentsRepo: MyCommentsRepository
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Comments.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Comments.id, ascending: true)]) var resultsDB: FetchedResults<Comments>
    
    
    var body: some View {
        NavigationStack{
            
            if resultsDB.isEmpty {
                if !isLoading {
                    Text("Has no results to show")
                }
            }
            else {
                List{
                    ForEach(0..<resultsDB.count) { comment in
                        CommentView()
                            }
                        }
                }
        }.navigationTitle("Comments Search")
            .searchable(text: $query)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
