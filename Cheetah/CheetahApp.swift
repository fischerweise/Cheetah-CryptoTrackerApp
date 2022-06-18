//
//  CheetahApp.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 18.06.2022.
//

import SwiftUI

@main
struct CheetahApp: App {
    @StateObject private var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
