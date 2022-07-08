//
//  JogoDaForcaApp.swift
//  Shared
//
//  Created by Mvengeance on 08/07/22.
//

import SwiftUI

@main
struct JogoDaForcaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
