//
//  CatVoteViewModel.swift
//  CATastrophe
//
//  Created by Ferraz on 25/01/21.
//

import Foundation
import SwiftUI
import CoreData

class CatVoteViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var context
//    @Published var cat
    @Published var categories: [Category]
    
    var apiCall = APICall()
    
    init() {
        self.categories = []
    }
    
    // default category 1 (hats)
    public func getCat(category: Int){
        
    }
    
    public func getCategory(){
        apiCall.getCategories { (categories) in
            guard let categories = categories else { return }
            self.categories += categories
            print(self.categories)
        }
    }
    
    public func vote(cat: CatImage, upvote: Bool){
        let voteInt = upvote ? 1 : 0
        
        if upvote {
            let catSave = CatUpvote(context: context)
            catSave.id = cat.id
            catSave.url = cat.url
            catSave.height = Int32(cat.height)
            catSave.width = Int32(cat.width)
            
            self.apiCall.vote(image_id: cat.id, vote: voteInt) { (success) in
                if success {
                    do {
                        try self.context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Error to post vote")
                }
            }
        }
    }
}
