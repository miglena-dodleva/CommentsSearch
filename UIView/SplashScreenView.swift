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
    @State private var query = ""
    @State private var error: Error? = nil
    @State private var results: [CommentsDto] = []
    
    
    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
    }
    
    private func loadDataFromApi() {
        
        Task {
            do {
                let responce = try await commentsRepo.getAllComments()
                results.append(contentsOf: responce)
                
            } catch {
                //  TODO: Error handling
                self.error = error
            }
        }
    }
    
    private func saveDataToCoreData(comments:[Comments], context: NSManagedObjectContext) {
        context.perform {
            for comment in comments {
                let commentEntity = Comments(context: context)
                commentEntity.id = comment.id
                commentEntity.post_id = comment.post_id
                commentEntity.name = comment.name
                commentEntity.email = comment.email
                commentEntity.comment_body = comment.comment_body
                
            }
            do {
                try context.save()
            } catch {
                fatalError("message:Error")
            }
        }
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

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
