//
//  RideRequestView.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
            // trip info view
            HStack {
                
                // indicator view
                VStack {
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
                
                VStack (alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("1.30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Starbucks coffee")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Text("1.45 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            // ride type selection view
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal){
                HStack(spacing: 12) {
                    ForEach(RideType.allCases) { ridetype in
                        
                        VStack(alignment: .leading) {
                            Image(ridetype.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(spacing: 4) {
                                Text(ridetype.description)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("$19.99")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width:  112, height: 140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            // payment options
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("****845")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // request ride
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, 26)
        .background(.white)
        .cornerRadius(16)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
