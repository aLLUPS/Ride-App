//
//  MapViewActionButton.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View{
        Button {
            withAnimation(.spring()){
                actionForSatate(mapState)
            }
            
        } label:{
            Image(systemName: imageNameforState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForSatate(_ state: MapViewState){
        switch state{
        case .noInput:
            print("DEBUG: No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedLocationCoordinate = nil
        }
    }
    
    func imageNameforState(_ state: MapViewState) -> String{
        switch state{
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    }
}

struct MapViewActionButton_Preview: PreviewProvider{
    static var previews: some View{
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
