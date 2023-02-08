//
//  SearchView.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var query = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<5){_ in
                    CommentView()
                }
            }
            .navigationTitle("Comments Search")
            .searchable(text: $query)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
