//
//  Page1View.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import SwiftUI

struct Page1View: View {
    
    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
    }
    
    var body: some View {
        HStack {
            Image("comment5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 4)
                    
                }
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                .animation(animation)
                .onAppear() {
                    self.isRotated = true }
            .shadow(radius: 27)
        }
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
