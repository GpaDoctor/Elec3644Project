//import SwiftUI
//import MapKit
//import Contacts
//
//struct MapView: View {
//    @EnvironmentObject var locationManager: LocationManager
//    @State private var searchText = "SuperMarket"
//    @State private var showSearch: Bool = false
//    @State var showAlert = false
//    @State var errorTitle = ""
//    @State var errorMessage = ""
//    @State var result = ""
//    @State var mapItem: MKMapItem?
//    @State var placemark: CLPlacemark?
//    @State private var mapSelection: MKMapItem?
//    
//    @State private var destinationCoordinate: CLLocationCoordinate2D?
//    @State private var camera: MapCameraPosition = .automatic
//    @State private var showLookAroundScene: Bool = false
//    @State private var searchResults = [MKMapItem]()
//    @State private var showDirection = false
//    @State private var route: MKRoute?
//    @State private var showRoute = false
//    @State private var routeDestination: MKMapItem?
//    @State private var showResultsSheet = false
//    
//    var body: some View {
//        NavigationStack {
//            Map(position: $camera, selection: $mapSelection) {
//                UserAnnotation()
//
//                Marker(coordinate: locationManager.region.center) {
//                    Image(systemName: "person.crop.rectangle.fill")
//                        .foregroundColor(.red)
//                        .font(.title)
//                }
//                
//                ForEach(searchResults, id: \.self) { item in
//                    if showRoute {
//                        if item == routeDestination {
//                            Marker(item: item)
//                        }
//                    } else {
//                        Marker(item: item)
//                    }
//                }
//                
//                if let route {
//                    MapPolyline(route.polyline)
//                        .stroke(.blue, lineWidth: 6)
//                }
//            }
//            .mapStyle(.standard(elevation: .realistic))
//            .mapControls {
//                MapUserLocationButton()
//                MapCompass()
//                MapScaleView()
//            }
//            .navigationTitle("Map")
//            .navigationBarTitleDisplayMode(.inline)
//            .searchable(text: $searchText, isPresented: $showSearch)
//            .toolbarBackground(.visible, for: .navigationBar)
//            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
//            .sheet(isPresented: $showLookAroundScene) {
//                if let mapItem = mapSelection {
//                    GetLookAroundScene(mapItem: mapItem, showDirection: $showDirection)
//                        .presentationDetents([.height(300)])
//                        .presentationBackgroundInteraction(.enabled(upThrough: .height(300)))
//                        .presentationCornerRadius(25)
//                        .interactiveDismissDisabled(true)
//                }
//            }
//            .sheet(isPresented: $showResultsSheet) {
//                SearchResultsView(searchResults: searchResults, userLocation: locationManager.region.center, searchText: searchText, mapSelection: $mapSelection)
//                    .presentationDetents([.fraction(0.33)])
//            }
//            .safeAreaInset(edge: .bottom) {
//                Button(action: {
//                    showResultsSheet = true
//                }) {
//                    Image(systemName: "arrow.up.to.line")
//                        .padding()
//                        .foregroundColor(.gray)
//                }
//                .padding()
//            }
//        }
//        .onAppear {
//            Task {
//                await searchPlaces()
//                showResultsSheet = true
//            }
//        }
//        .onSubmit(of: .search) {
//            camera = .automatic
//            Task {
//                guard !searchText.isEmpty else { return }
//                await searchPlaces()
//                showResultsSheet = true
//            }
//        }
//        .onChange(of: showDirection) { oldValue, newValue in
//            if newValue {
//                fetchRoute()
//                showResultsSheet = false
//            }
//        }
//        .onChange(of: showSearch, initial: false) {
//            if !showSearch {
//                resetMap()
//            }
//        }
//        .onChange(of: mapSelection) { oldValue, newValue in
//            if newValue != nil {
//                showLookAroundScene = true
//                showResultsSheet = false
//            } else {
//                showLookAroundScene = false
//            }
//        }
//    }
//    
//    func searchPlaces() async {
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = searchText
//        request.region = MKCoordinateRegion.userRegion(center: locationManager.region.center)
//        let results = try? await MKLocalSearch(request: request).start()
//        self.searchResults = results?.mapItems ?? []
//    }
//
//    func fetchRoute() {
//        if let mapSelection {
//            let request = MKDirections.Request()
//            request.source = MKMapItem(placemark: .init(coordinate: locationManager.region.center))
//            request.destination = mapSelection
//            Task {
//                let result = try? await MKDirections(request: request).calculate()
//                route = result?.routes.first
//                routeDestination = mapSelection
//                withAnimation(.snappy) {
//                    showRoute = true
//                    showLookAroundScene = false
//                    if let rect = route?.polyline.boundingMapRect, showRoute {
//                        camera = .rect(rect)
//                    }
//                }
//            }
//        }
//    }
//    
//    func resetMap() {
//        mapSelection = nil
//        searchResults = []
//        mapItem = nil
//        showLookAroundScene = false
//        showDirection = false
//        route = nil
//        showRoute = false
//        routeDestination = nil
//        camera = .automatic
//    }
//}
//
//struct SearchResultsView: View {
//    var searchResults: [MKMapItem]
//    var userLocation: CLLocationCoordinate2D
//    var searchText: String
//    @Binding var mapSelection: MKMapItem?
//    
//    var body: some View {
//        NavigationView {
//            List {
//                Section(header: Text(searchText).font(.subheadline)) {
//                    ForEach(searchResults, id: \.self) { item in
//                        VStack(alignment: .leading) {
//                            Text(item.name ?? "Unknown")
//                                .font(.headline)
//                            if let distance = item.placemark.location?.distance(from: CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)) {
//                                Text(String(format: "%.2f meters away", distance))
//                                    .font(.subheadline)
//                            }
//                        }
//                        .contentShape(Rectangle())
//                        .onTapGesture {
//                            mapSelection = item
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//extension CLLocationCoordinate2D {
//    static let anyLocation = CLLocationCoordinate2D(
//        latitude: 22.284111074641533, longitude: 114.13785469832455)
//}
//
//extension MKCoordinateRegion {
//    static func userRegion(center: CLLocationCoordinate2D) -> MKCoordinateRegion {
//        return MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
//    }
//}


import SwiftUI
import MapKit
import Contacts

struct MapView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State private var searchText = "SuperMarket"
    @State private var showSearch: Bool = false
    @State var showAlert = false
    @State var errorTitle = ""
    @State var errorMessage = ""
    @State var result = ""
    @State var mapItem: MKMapItem?
    @State var placemark: CLPlacemark?
    @State private var mapSelection: MKMapItem?
    
    @State private var destinationCoordinate: CLLocationCoordinate2D?
    @State private var camera: MapCameraPosition = .automatic
    @State private var showLookAroundScene: Bool = false
    @State private var searchResults = [MKMapItem]()
    @State private var showDirection = false
    @State private var route: MKRoute?
    @State private var showRoute = false
    @State private var routeDestination: MKMapItem?
    @State private var showResultsSheet = false
    
    var body: some View {
        NavigationStack {
            Map(position: $camera, selection: $mapSelection) {
                UserAnnotation()

                Marker(coordinate: locationManager.region.center) {
                    Image(systemName: "person.crop.rectangle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                }
                
                ForEach(searchResults, id: \.self) { item in
                    if showRoute {
                        if item == routeDestination {
                            Marker(item: item)
                        }
                    } else {
                        Marker(item: item)
                    }
                }
                
                if let route {
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 6)
                }
            }
            .mapStyle(.standard(elevation: .realistic))
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, isPresented: $showSearch)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .sheet(isPresented: $showLookAroundScene) {
                if let mapItem = mapSelection {
                    GetLookAroundScene(mapItem: mapItem, showDirection: $showDirection)
                        .presentationDetents([.height(300)])
                        .presentationBackgroundInteraction(.enabled(upThrough: .height(300)))
                        .presentationCornerRadius(25)
                        .interactiveDismissDisabled(true)
                }
            }
            .sheet(isPresented: $showResultsSheet) {
                SearchResultsView(searchResults: searchResults, userLocation: locationManager.region.center, searchText: searchText, mapSelection: $mapSelection)
                    .presentationDetents([.fraction(0.33)])
            }
            .safeAreaInset(edge: .bottom) {
                Button(action: {
                    showResultsSheet = true
                }) {
                    Image(systemName: "arrow.up.to.line")
                        .padding()
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        .onAppear {
            Task {
                searchText = "SuperMarket"
                await searchPlaces()
                showResultsSheet = true
            }
        }
        .onSubmit(of: .search) {
            camera = .automatic
            Task {
                guard !searchText.isEmpty else { return }
                await searchPlaces()
                showResultsSheet = true
            }
        }
        .onChange(of: showDirection) { oldValue, newValue in
            if newValue {
                fetchRoute()
                showResultsSheet = false
            }
        }
        .onChange(of: showSearch, initial: false) {
            if !showSearch {
                resetMap()
            }
        }
        .onChange(of: mapSelection) { oldValue, newValue in
            if newValue != nil {
                showLookAroundScene = true
                showResultsSheet = false
            } else {
                showLookAroundScene = false
            }
        }
    }
    
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = MKCoordinateRegion.userRegion(center: locationManager.region.center)
        let results = try? await MKLocalSearch(request: request).start()
        self.searchResults = results?.mapItems ?? []
    }

    func fetchRoute() {
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: locationManager.region.center))
            request.destination = mapSelection
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                routeDestination = mapSelection
                withAnimation(.snappy) {
                    showRoute = true
                    showLookAroundScene = false
                    if let rect = route?.polyline.boundingMapRect, showRoute {
                        camera = .rect(rect)
                    }
                }
            }
        }
    }
    
    func resetMap() {
        mapSelection = nil
        searchResults = []
        mapItem = nil
        showLookAroundScene = false
        showDirection = false
        route = nil
        showRoute = false
        routeDestination = nil
        camera = .automatic
    }
}

struct SearchResultsView: View {
    var searchResults: [MKMapItem]
    var userLocation: CLLocationCoordinate2D
    var searchText: String
    @Binding var mapSelection: MKMapItem?
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(searchText).font(.subheadline)) {
                    ForEach(searchResults, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Text(item.name ?? "Unknown")
                                .font(.headline)
                            if let distance = item.placemark.location?.distance(from: CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)) {
                                Text(String(format: "%.2f meters away", distance))
                                    .font(.subheadline)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            mapSelection = item
                        }
                    }
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static let anyLocation = CLLocationCoordinate2D(
        latitude: 22.284111074641533, longitude: 114.13785469832455)
}

extension MKCoordinateRegion {
    static func userRegion(center: CLLocationCoordinate2D) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}
