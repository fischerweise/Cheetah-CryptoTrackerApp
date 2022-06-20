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
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]

    }
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
