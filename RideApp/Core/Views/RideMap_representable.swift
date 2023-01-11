//
//  RideMap_representable.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-11.
//

import SwiftUI
import MapKit

struct RideMapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension RideMapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate{
        let parent: RideMapViewRepresentable
        
        init(parent: RideMapViewRepresentable){
            self.parent = parent
            super.init()
        }
    }
}
