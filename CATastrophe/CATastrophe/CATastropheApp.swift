//
//  CATastropheApp.swift
//  CATastrophe
//
//  Created by Ferraz on 21/01/21.
//

import SwiftUI

@main
struct CATastropheApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CatVoteView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
