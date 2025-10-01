//
//  MainView.swift
//  Thai.ID
//
//  Created by Pu on 1/10/2568 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
              HomeView()
                  .tabItem {
                      Image(systemName: "house.fill")
                      Text("Home")
                  }

            HistoryView()
                  .tabItem {
                      Image(systemName: "magnifyingglass")
                      Text("Search")
                  }

              ProfileView()
                  .tabItem {
                      Image(systemName: "person.fill")
                      Text("Profile")
                  }
          }
    }
}

#Preview {
    MainView()
}
