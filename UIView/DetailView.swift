//
//  DetailView.swift
//  CommentsSearch
//
//  Created by Jessica on 10.02.23.
//

import SwiftUI

struct DetailView: View {
    
    let comment: Comments
    
    var body: some View {
        Text("Message: \(comment.comment_body)")
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .frame(width: 300)
            .background(.blue)
            .foregroundColor(.white)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(comment: Comments())
    }
}
