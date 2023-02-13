//
//  SearchView.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.

import SwiftUI
import CoreData

struct SearchView: View {
    
    @State private var query = ""
    @State private var results: [Comments] = []
    @State private var isLoading: Bool = false
    
    @EnvironmentObject var commentsRepo: MyCommentsRepository
    
//    @FetchRequest(entity: Comments.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Comments.id, ascending: true)]) var resultsDB: FetchedResults<Comments>
    
    var body: some View {
        
        NavigationStack{
            
            if results.isEmpty {
                if !isLoading {
                    Text("Has no results to show")
                }
            }
            else {
                List{
                    ForEach(0..<results.count) {index in
                            CommentView(comment: self.results[index])
                           
                    }
                }

            }
            if isLoading{
                ZStack{
                    Color(.white)
                        .opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView("Fetching Comments")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemBackground))
                        )
                        .frame(alignment: .center)
                        .shadow(radius: 10)
                }
            }
            
        }.onAppear {
            isLoading = true
            
            // get all from db
            Task {
                let a = try? await commentsRepo.getAllCommentsFromDB()
                results = a ?? []
                
                isLoading = false
            }
            
        }
        .navigationTitle("Comments Search")
        .searchable(text: $query )
        .onSubmit(of: .search){
            
            isLoading = true
            Task{
                results = []
                let b = try? await commentsRepo.searchComments(query: query)
                results = b ?? []
                
                isLoading = false
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
