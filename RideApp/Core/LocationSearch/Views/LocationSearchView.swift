//
//  LocationSearchView.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import SwiftUI

struct LocationSearchView: View{
    @State private var startLocationText = ""
    @State private var destinationLocationText = ""
    
    var body: some View{
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
                    
                    TextField("Where to?", text: $destinationLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
                
            }
            .padding(.horizontal)

            Divider()
                .padding(.vertical)
            
            // list view
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(0 ..< 20, id: \.self){ _ in
                        LocationSearchResultCell()
                    }
                }
            }
            
        }
    }
}

struct LocationServiceView_Preview: PreviewProvider{
    static var previews: some View{
        LocationSearchView()
    }
}
