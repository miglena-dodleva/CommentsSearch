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
    @EnvironmentObject var mainstate: MainState
    
    
//    @FetchRequest(entity: Comments.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Comments.id, ascending: true)]) var resultsDB: FetchedResults<Comments>
    
    var body: some View {
       
        switch mainstate.mainState {
         case .displayBaseDB:
            // get all from db
            
                let baseData = try? await commentsRepo.getAllCommentsFromDB()
                results = baseData ?? []

                isLoading = false
           
         
        case .displayResults:
           
                do {

                    let commentswithquery = try await commentsRepo.searchComments(query: query)
                    results = commentswithquery
                }
            catch {
                print("********** \(error)")
                
                
                isLoading = false
            }
        case .hasNoRsults:
            if !isLoading {
                Text("Has no results to show")
            }
            
        }
       
        NavigationStack{

            
//            case .displayBaseDB:
//                 isLoading = true
//
//                // get all from db
//                Task {
//                        let basetData = try? await commentsRepo.getAllCommentsFromDB()
//                        results = basetData ?? []
//
//                        isLoading = false
//                }
//            case .displayResults:
//                isLoading = true
//                Task{
//
//                    do {
//
//                        let commentswithquery = try await commentsRepo.searchComments(query: query)
//                        results = commentswithquery
//                    }
//                    catch {
//                        print("********** \(error)")
//                    }
//
//                    isLoading = false
//                }
//            case .hasNoRsults:
//                Text("Has no results to show")
            
                       // .environmentObject(mainState)
                    
            


            if results.isEmpty {
                if !isLoading {
                    Text("Has no results to show")
                }
            }
            else {
                List{
                    ForEach(results) {item in
                            CommentView(comment: item)

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
            
            mainstate.updateMainState(state: .displayBaseDB)
            
        }
        .refreshable {
            mainstate.updateMainState(state: .displayBaseDB)
        }
        .navigationTitle("Comments Search")
        .searchable(text: $query )
        .onSubmit(of: .search){
            isLoading = true

            mainstate.updateMainState(state: .displayResults)

            }
        }
    }


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
