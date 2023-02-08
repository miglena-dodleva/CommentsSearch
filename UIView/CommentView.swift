//
//  CommentView.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2.0)
        {
            HStack{
                
                Text("id=")
                
                Spacer()
               
                Text("PostId=")
                    .padding(.horizontal, 30)
                    .font(.headline)
    
            }
            VStack(alignment: .leading){
                Text("name")
            }
            VStack(alignment: .leading){
                Text("email")
            }
            VStack(alignment: .leading){
                Text("message")
                    .multilineTextAlignment(.leading)
                    
                
            }
            .background(.blue)
            .foregroundColor(.white)
            
        }.padding(.horizontal, 20)
        
        }
        
    
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
