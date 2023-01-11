//
//  MapViewActionButton.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var showLocationSearchView: Bool
    
    var body: some View{
        Button {
            withAnimation(.spring()){
                showLocationSearchView.toggle()
            }
            
        } label:{
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MapViewActionButton_Preview: PreviewProvider{
    static var previews: some View{
        MapViewActionButton(showLocationSearchView:
                .constant(true))
    }
}
