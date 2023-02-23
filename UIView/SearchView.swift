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
    
    @EnvironmentObject var commentsRepo: MyCommentsRepository
    
    @State var searchState: SearchState = SearchState()
//    @FetchRequest(entity: Comments.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Comments.id, ascending: true)]) var resultsDB: FetchedResults<Comments>
    
    var body: some View {
        
        NavigationStack{

            switch searchState.sState {
            case .displayDB:
                List{
                    ForEach(results) { item in
                        CommentView(comment: item)
                    }
                }
                
            case .hasNoRsults:
                Text("Has no results to show")
                
            case .loading:
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
            
        }
        .onAppear {
            searchState.updateSearchState(state: .loading)

            // get all from db
            Task {
                let basetData = try? await commentsRepo.getAllCommentsFromDB()
                results = basetData ?? []

                searchState.updateSearchState(state: results.isEmpty ? .hasNoRsults : .displayDB)
            }
            
        }
        .refreshable {
            let baseData = try? await commentsRepo.getAllCommentsFromDB()
            results = baseData ?? []

            searchState.updateSearchState(state: .displayDB)
            
        }
        .navigationTitle("Comments Search")
        .searchable(text: $query )
        .onSubmit(of: .search){
            
            searchState.updateSearchState(state: .loading)

            Task{

                do {

                    let commentswithquery = try await commentsRepo.searchComments(query: query)
                    results = commentswithquery
                }
                catch {
                    print("********** \(error)")
                }
                if results.count > 0 {
                    searchState.updateSearchState(state: .displayDB)
                }
                else{
                    searchState.updateSearchState(state: .hasNoRsults)
                }

                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

