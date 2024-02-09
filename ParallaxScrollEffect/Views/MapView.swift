import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    // Array von Städten mit ihren Koordinaten
    private let cities: [(name: String, latitude: Double, longitude: Double)] = [
        ("Geislingen", 48.6249, 9.8282),
        ("Stuttgart", 48.7758, 9.1829),
        ("Ulm", 48.4011, 9.9876),
        // Füge hier weitere Städte hinzu...
    ]

    @Environment(\.presentationMode) var presentationMode
    @State private var annotations = [IdentifiablePointAnnotation]()
    @State private var selectedCity: String = "Geislingen"
    @State private var zipCode: String = ""
    @State private var tappedCoordinate: CLLocationCoordinate2D?
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.6249, longitude: 9.8282),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    @State private var isLoading = false

    var body: some View {
            VStack {
                if isLoading {
                    ProgressView("Lade Karte...")
                } else {
                    Map(
                        coordinateRegion: $mapRegion,
                        interactionModes: .all,
                        showsUserLocation: true,
                        userTrackingMode: .constant(.follow),
                        annotationItems: annotations
                    ) { annotation in
                        MapMarker(coordinate: annotation.annotation.coordinate, tint: .red)
                    }
                    .onTapGesture {
                        if let tappedCoordinate = tappedCoordinate {
                            viewModel.handleTapOnMap(coordinate: tappedCoordinate) { result in
                                switch result {
                                case .success(let annotation):
                                    print("Tap on map successful. Annotation: \(annotation)")
                                case .failure(let error):
                                    print("Failed to handle tap on map. Error: \(error)")
                                }
                            }
                        }
                    }

                    .onAppear {
                        let cities: [(String, Double, Double)] = [
                            ("Geislingen", 48.6249, 9.8282),
                            ("Stuttgart", 48.7758, 9.1829),
                            ("Ulm", 48.4011, 9.9876)
                        ]

                        var customAnnotations: [IdentifiablePointAnnotation] = []

                        for city in cities {
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = CLLocationCoordinate2D(latitude: city.1, longitude: city.2)
                            annotation.title = city.0
                            customAnnotations.append(IdentifiablePointAnnotation(annotation: annotation))
                        }

                        viewModel.addAnnotations(annotations: customAnnotations) { result in
                            switch result {
                            case .success:
                                print("Annotations added successfully.")
                            case .failure(let error):
                                print("Failed to add annotations. Error: \(error)")
                            }
                        }
                    }
                    .ignoresSafeArea()


                    Picker("Wähle eine Stadt aus !!", selection: $selectedCity) {
                        ForEach(cities, id: \.name) { city in
                            Text(city.name).tag(city.name)
                                .foregroundColor(.black)
                        }
                    }
                    .foregroundColor(.black)
                    .onChange(of: selectedCity) { _ in
                        viewModel.updateMapRegion(newCity: selectedCity, region: $mapRegion)
                    }
                    .padding()

                    TextField("Plz eingeben", text: $zipCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.black)
                        .padding()

                    Button("Suchen") {
                        viewModel.searchByZIP(zipCode: "12345", region: $mapRegion) { result in
                            switch result {
                            case .success(let annotation):
                                print("Search by ZIP successful. Annotation: \(annotation)")
                            case .failure(let error):
                                print("Failed to search by ZIP. Error: \(error)")
                            }
                        }

                    }
                    .padding()
                    .foregroundColor(.black)

                    Spacer()
                }

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                }
                .padding()
            }
            .background(Color(red: 0.96, green: 0.94, blue: 0.84))
            .onAppear {
                viewModel.checkLocationAuthorization()
            }
        }
    }

    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }
    }
