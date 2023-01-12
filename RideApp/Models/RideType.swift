//
//  RideType.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case riderX
    case riderM
    case riderXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .riderX: return "Rider-X"
        case .riderM: return "Rider-M"
        case .riderXL: return "Rider-XL"
        
        }
    }
    
    var imageName: String {
        switch self {
        case .riderX: return "WhiteCar"
        case .riderM: return "BlackCar"
        case .riderXL: return "WhiteSUV"
        
        }
    }
}
