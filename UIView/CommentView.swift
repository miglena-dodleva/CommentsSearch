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
        VStack(alignment: .leading, spacing: 2.0)
        {
            HStack{
                
                Text("id= \(comment.id)")
                
                Spacer()
               
                Text("PostId= \(comment.post_id)")
                    .padding(.horizontal, 30)
                    .font(.headline)
    
            }
            VStack(alignment: .leading){
                Text("name: \(comment.name)")
            }
            VStack(alignment: .leading){
                Text("email: \(comment.email)")
            }
            VStack(alignment: .leading){
                Text("message: \(comment.comment_body)")
                    .multilineTextAlignment(.leading)
            }
            .background(.blue)
            .foregroundColor(.white)
            
        }.padding(.horizontal, 20)
        
        }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comments())
    }
}
