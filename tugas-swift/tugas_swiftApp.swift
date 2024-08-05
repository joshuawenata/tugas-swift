//
//  tugas_swiftApp.swift
//  tugas-swift
//
//  Created by Joshua Wenata Sunarto on 05/08/24.
//

import SwiftUI

@main
struct tugas_swiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: CardModel.self)
    }
}
