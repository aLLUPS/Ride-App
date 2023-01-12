//
//  RideAppApp.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-11.
//

import SwiftUI

@main
struct RideAppApp: App {
    
    @StateObject var locationViewModel = LocationSearchViewModel()  // initilized the locationView model that can be used in everywhere in the app
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)   // can be used throughout the app
        }
    }
}
