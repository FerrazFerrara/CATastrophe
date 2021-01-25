//
//  CatVoteViewModel.swift
//  CATastrophe
//
//  Created by Ferraz on 25/01/21.
//

import Foundation
import SwiftUI

struct CatVoteViewModel {
    
    @Environment(\.managedObjectContext) var context
    
    var apiCall = APICall()
    
    public func getCat(category: Int){
        
    }
    
    public func getCategory(){
        
    }
    
//    vote(image_id: String, vote: Int, completion: @escaping(Bool) -> Void)
    public func vote(image_id: String, upvote: Bool){
        let voteInt = upvote ? 1 : 0
        
        if upvote {
            let catSave = CatUpvote
            
            apiCall.vote(image_id: image_id, vote: voteInt)
        }
    }
}
