//
//  Home.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-11.
//

import SwiftUI

struct HomeView: View{
    var body: some View{
        RideMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
