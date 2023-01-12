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
    
    var baseFare: Double {
        switch self {
        case .riderX: return 5
        case .riderM: return 20
        case .riderXL: return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInKm = distanceInMeters / 1000
        
        switch self{
        case .riderX: return distanceInKm * 1.5 + baseFare
        case .riderM: return distanceInKm * 2.0 + baseFare
        case .riderXL: return distanceInKm * 1.75 + baseFare
        }
    }
}
