//
//  LocationSearchView.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    // @Binding var showLocationSearchView: Bool
    // @StateObject var viewModel = LocationSearchViewModel() // intializing
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel   // instead of initilaizing, just casting
    
    var body: some View {
        VStack{
            // header view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width:6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width:1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width:6, height: 6)
                }
                
                VStack{
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
                
            }
            .padding(.horizontal)
            .padding(.top, 64)

            Divider()
                .padding(.vertical)
            
            // list view
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) {
                        result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(result)
                                mapState = .locationSelected
                            }
                    }
                }
            }
            
        }
        .background(.white)
    }
}

struct LocationSearchView_Preview: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
            .environmentObject(LocationSearchViewModel())
    }
}
