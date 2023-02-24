//
//  CommentView.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import SwiftUI

struct CommentView: View {
    
    let comment: Comments
    
    var body: some View {
        NavigationLink(destination: DetailView(comment: comment)){
            VStack(alignment: .leading, spacing: 3.0)
            {
                HStack{
                    Text("Id= \(comment.id)")
                    
                    Spacer()
                    
                    Text("PostId= \(comment.post_id)")
                        .padding(.horizontal, 30)
                        .font(.headline)
                }
                VStack(alignment: .leading){
                    Text("Name: \(comment.name)")
                }
                VStack(alignment: .leading){
                    Text("Email: \(comment.email)")
                }
            }.padding(.horizontal, 30)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comments())
    }
}
