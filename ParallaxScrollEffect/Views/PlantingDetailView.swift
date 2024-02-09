import SwiftUI

struct PlantingDetailView: View {
    
    @ObservedObject var bookingViewModel: BookingViewModel
    
    @State private var renterName = ""
    @State private var duration = 1
    @State private var agreedToTerms = false
    @State private var sliderValue: Double = 0.0
    @State private var showAlert = false
    
    let crop: Crop
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text(crop.name)
                        .font(.custom("Chalkduster", size: 32))
                }
                
                // AsyncImage für das Anzeigen von Bildern mit asynchronem Laden
                AsyncImage(url: URL(string: crop.image)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    default:
                        ProgressView()
                    }
                }
                
                ScrollView {
                    // Kurzbeschreibung des Anbaus
                    Text("Kurzbeschreibung: \(crop.short_description)")
                        .foregroundColor(.gray)
                        .font(Font.custom("Helvetica", size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // HStack mit DetailBoxen für spezifische Informationen zum Anbau
                    HStack(spacing: 15) {
                        DetailBox(title: "Stufe", value: crop.level)
                        DetailBox(title: "Ertrag", value: crop.yield)
                        DetailBox(title: "Sonnenstunden", value: crop.hour_of_sunshine)
                    }
                    
                    // HStack mit Gartendaten und weiteren DetailBoxen
                    HStack {
                        VStack {
                            Text("Gartendaten:")
                                .foregroundColor(.gray)
                                .font(.custom("Chalkduster", size: 24))
                        }
                        
                        HStack {
                            VStack {
                                DetailBox(title: "Preis", value: crop.price)
                                DetailBox(title: "Feldgröße", value: crop.field_size)
                            }
                        }
                    }
                    .padding(15)
                    .background(Color(red: 0.29, green: 0.81, blue: 0.53).opacity(0.1))
                    .cornerRadius(17)
                    
                    // Beschreibung des Anbaus
                    Text("Beschreibung: \(crop.description)")
                        .font(Font.custom("Helvetica", size: 15.3243))
                        .foregroundColor(Color(red: 0.63, green: 0.63, blue: 0.63))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.horizontal)
                    
                    // Pachtinformationen mit Stepper und Toggle
                    Section(header: Text("Pacht Informationen")
                        .font(.custom("Chalkduster", size: 20))
                    ) {
                        Stepper(value: $duration, in: 1...12) {
                            Text("Dauer: \(duration) monat(e)")
                                .font(.custom("Helvetica", size: 14))
                        }
                        .padding(.horizontal)
                    }
                    
                    Section {
                        Toggle(isOn: $agreedToTerms) {
                            Text("Ich bestätige den allgemeinen AGB's")
                                .font(.custom("Helvetica", size: 14))
                        }
                        .padding(.horizontal)
                        
                        // Anzeige des Fortschrittsbalkens basierend auf dem Toggle
                        if agreedToTerms {
                            HStack {
                                Text("Fortschrittsbalken")
                                    .font(.custom("Helvetica", size: 14))
                                    .foregroundColor(.gray)
                                Spacer()
                                Slider(value: $sliderValue, in: 0...1)
                                    .accentColor(sliderValue >= 0.5 ? .green : .red)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .onAppear {
                    HapticEngine.trigger()
                }
            }
        }
        .navigationBarTitle("Garten Details")
    }
}
