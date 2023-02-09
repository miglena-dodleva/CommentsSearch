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
    @Environment(\.managedObjectContext) var context
    
    @State private var query = ""
    @State private var error: Error? = nil
    @State private var results: [CommentsDto] = []
    @State private var isRotated = false
    
    var animation: Animation {
        Animation.easeOut
    }
    
    private func fetchData(context: NSManagedObjectContext) {
        
        Task {
            do {
                let responce = try await commentsRepo.getAllComments()
                results.append(contentsOf: responce)
                self.saveDataToCoreData(context: context)
                
            } catch {
                //  TODO: Error handling
                self.error = error
            }
        }
    }
    
    private func saveDataToCoreData(context: NSManagedObjectContext) {
        results.forEach { CommentsDto in
            let commentEntity = Comments(context: context)
                    commentEntity.id = NSNumber(value: CommentsDto.id)
                    commentEntity.post_id = NSNumber(value: CommentsDto.post_id)
                    commentEntity.name = CommentsDto.name
                    commentEntity.email = CommentsDto.email
                    commentEntity.comment_body = CommentsDto.comment_body
        }
                
            do {
                try context.save()
                print("success")
            } catch {
                fatalError("message:Error")
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
                    fetchData(context: context)
                    
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
