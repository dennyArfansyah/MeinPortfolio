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
                    Label("Search", systemImage: "magnifyingglass")
                }
            HomeView()
                .tabItem {
                    Label("Bookings", systemImage: "calendar")
                }
            HomeView()
                .tabItem {
                    Label("Message", systemImage: "message.badge")
                }
            HomeView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
