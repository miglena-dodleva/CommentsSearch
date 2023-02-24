//
//  Page1View.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import SwiftUI
import CoreData

struct SplashScreenView: View {
    
    @EnvironmentObject var commentsRepo: MyCommentsRepository
    @EnvironmentObject var applicationState: AplicationState
    @Environment(\.managedObjectContext) var context
    
    @State private var error: Error? = nil
    @State private var hasError: Bool = false
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
                    self.isRotated = true
                    
                    Task {
                        do {
                            try await commentsRepo.getAllComments()
                            applicationState.updateState(state: .main)
                        }
                        catch{
                            self.error = error
                            self.hasError = true
                        }
                    }
                }
                .shadow(radius: 27)
                .alert(isPresented: $hasError) {
                    Alert(
                        title: Text("Something went wrong!"),
                        message: Text(error?.localizedDescription ?? "unknon error"),
                        dismissButton: .default(Text("OK!")) {applicationState.updateState(state: .main)} )
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
