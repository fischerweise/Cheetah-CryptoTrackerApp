//
//  SettingsView.swift
//  Cheetah
//
//  Created by Mustafa Pekdemir on 23.06.2022.
//

import SwiftUI

struct SettingsView: View {
    
    let githubURL = URL(string: "https://github.com/fischerweise")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/fischerweise")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/mustafapekdemir/")!
    
    var body: some View {
        NavigationView {
            List {
                settingsPage
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var settingsPage: some View {
        Section(header: Text("Websites")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was created by fischerweise")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Follow me 🥳🥳", destination: githubURL)
            Link("May we drink a coffee together? 🤙🏻☕️", destination: coffeeURL)
            Link("My LinkedIn Profile 🌿💥", destination: linkedinURL)
        }
    }
}
