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
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            BookingView()
                .tabItem {
                    Label("Bookings", systemImage: "calendar")
                }
            MessageView()
                .tabItem {
                    Label("Message", systemImage: "message.badge")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
