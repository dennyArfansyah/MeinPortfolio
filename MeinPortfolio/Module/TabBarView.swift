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
                    Label(TabbarLabel.home.rawValue, systemImage: TabbarSystemImage.home.rawValue)
                }
            SearchView()
                .tabItem {
                    Label(TabbarLabel.search.rawValue, systemImage: TabbarSystemImage.search.rawValue)
                }
            BookingView()
                .tabItem {
                    Label(TabbarLabel.bookings.rawValue, systemImage: TabbarSystemImage.bookings.rawValue)
                }
            MessageView()
                .tabItem {
                    Label(TabbarLabel.message.rawValue, systemImage: TabbarSystemImage.message.rawValue)
                }
            ProfileView()
                .tabItem {
                    Label(TabbarLabel.profile.rawValue, systemImage: TabbarSystemImage.profile.rawValue)
                }
        }
    }
}

#Preview {
    TabBarView()
}
