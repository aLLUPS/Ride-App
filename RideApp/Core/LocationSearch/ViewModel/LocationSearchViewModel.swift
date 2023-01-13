//
//  LocationSearchViewModel.swift
//  RideApp
//
//  Created by Pawara Siriwardhane on 2023-01-12.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    // MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion()]
    // @Published var selectedLocation: String?    // initialized as a nullable string
    @Published var selectedLocationCoordinate: RideLocation?
    
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment: String = "" {
        didSet {
            // print("DEBUG: Query fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    // MARK: Lifecycle
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    // MARK: Helpers
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = RideLocation(title: localSearch.title, coordinate: coordinate)
            
            print("DEBUG: Location coordinate \(coordinate)")
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion,
                        completion: @escaping MKLocalSearch.CompletionHandler){
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let coordinate = selectedLocationCoordinate?.coordinate else { return 0.0 }
        guard let userLocation = self.userLocation else { return 0.0 }
        
        let usersLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        let tripDistanceInMeters = usersLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeters)
    }
}

// MARK: MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter){
        self.results = completer.results
    }
}
