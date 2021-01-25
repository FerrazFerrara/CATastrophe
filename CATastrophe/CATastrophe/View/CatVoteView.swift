//
//  CatVoteView.swift
//  CATastrophe
//
//  Created by Ferraz on 25/01/21.
//

import SwiftUI

struct CatVoteView: View {
    
    @StateObject var viewModel = CatVoteViewModel()
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            List(viewModel.categories, id: \.id) { category in
                Text(category.name)
            }
        }.onAppear(perform: {
            viewModel.getCategory()
        })
    }
}

struct CatVoteView_Previews: PreviewProvider {
    static var previews: some View {
        CatVoteView()
    }
}
