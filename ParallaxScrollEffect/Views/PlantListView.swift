import SwiftUI

struct PlantListView: View {
    @StateObject var cropFetcher = CropFetchViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            // Liste der Anbaupflanzen
            List {
                if cropFetcher.crops.isEmpty {
                    // Meldung, wenn keine Daten vom Server abgerufen werden können
                    Text("Momentan empfange ich keine Daten. Starten Sie die App neu oder probieren Sie es später nochmal")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ForEach(cropFetcher.crops.filter {
                        // Filtert die Anbaupflanzen basierend auf dem Suchtext
                        searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                    }, id: \.id) { crop in
                        NavigationLink(destination: PlantingDetailView(bookingViewModel: BookingViewModel(), crop: crop)) {
                            // HStack mit Bild und Textinformationen für jede Anbaupflanze
                            HStack(spacing: 15) {
                                // AsyncImage für das asynchrone Laden von Bildern
                                AsyncImage(url: URL(string: crop.image)) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(8)
                                    default:
                                        // Placeholder für den Ladeindikator oder Fehleranzeige
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.green.opacity(0.35))
                                            .frame(width: 80, height: 80)
                                            .overlay(
                                                Image(systemName: "photo")
                                                    .foregroundColor(.black)
                                            )
                                    }
                                }
                                // VStack mit Textinformationen zur Anbaupflanze
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack {
                                        Text(crop.name)
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    Text(crop.short_description)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(8)
                        }
                    }
                }
            }
            .searchable(text: $searchText) // Fügt Suchbarkeit zur Liste hinzu
            .navigationBarItems(trailing: TextField("Suchen", text: $searchText)) // Fügt Suchfeld zur Navigationsleiste hinzu
            .onAppear {
                cropFetcher.loadData() // Lädt die Daten beim Erscheinen der Ansicht
                HapticEngine.trigger() // Triggert ein haptisches Feedback
            }
        }
    }
}

#Preview {
    PlantListView()
}
struct ReminderView: View {
  @State private var plants: [Plant] = []
  @State private var selectedPlant: Plant?
  @State private var alarmTime: Date = Date()
  @State private var isAnimating = false

  var body: some View {
    NavigationView {
      List(plants) { plant in
        Button(action: {
          selectedPlant = plant
          isAnimating = true
        }) {
          Text(plant.name)
        }
      }
      .toolbar {
        Button(action: addPlant) {
          Text("Pflanze hinzufügen")
        }
      }
    }
    .sheet(isPresented: $isAnimating) {
      ReminderDetailView(plant: $selectedPlant, alarmTime: $alarmTime, isAnimating: $isAnimating)
    }
  }

  func addPlant() {
    let plant = Plant(name: "Neue Pflanze")
    plants.append(plant)
  }
}

struct ReminderDetailView: View {
  @Binding var plant: Plant?
  @Binding var alarmTime: Date
  @Binding var isAnimating: Bool

  var body: some View {
    Form {
      Section(header: Text("Erinnerung für \(plant?.name ?? "")")) {
        DatePicker("Alarmzeit", selection: $alarmTime, displayedComponents: .date)
        Button(action: saveAlarm) {
          Text("Erinnerung speichern")
        }
      }
    }
    .onAppear {
      isAnimating = true
    }
    .background(Color.white)
    .transition(.scale)  // Verwenden Sie .scale als Übergangseffekt
  }

  func saveAlarm() {
    // Implementiere hier die Logik zum Speichern der Alarmzeit
    // (z.B. mit UserDefaults oder Core Data)

    isAnimating = false
  }
}

struct Plant: Identifiable {
  let id = UUID()
  let name: String
}
