//
//  TabBarView.swift
//  MeinPortfolio
//
//  Created by Denny Arfansyah on 29/01/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            HomeView()
                .tabItem {
                    Label("Mall", systemImage: "cart.fill")
                }
            HomeView()
                .tabItem {
                    Label("Transaction", systemImage: "list.clipboard.fill")
                }
            HomeView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
