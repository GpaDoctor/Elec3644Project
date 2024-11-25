import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 22.283, longitude: 114.137), latitudinalMeters: 100, longitudinalMeters: 100)
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        region.center = location.coordinate
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func search(for place: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = place
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response, let item = response.mapItems.first else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(item.placemark.coordinate)
            }
        }
    }
}
