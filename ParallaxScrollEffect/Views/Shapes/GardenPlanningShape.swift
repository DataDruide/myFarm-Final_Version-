
import SwiftUI

struct GardenPlanningShape: View {
    @State private var pflanzeAusgewählt = false
    @State private var bewässerungsfrequenz = 1
    @State private var sonnenlichtPräferenz = 0
    @State private var ausgewähltesDatum = Date()
    
    var body: some View {
        
        NavigationView {
            VStack {
                    Section(header: Text("Pflanzeninformationen")) {

                        Toggle("Pflanze auswählen", isOn: $pflanzeAusgewählt)
                    }
                    
                    Section(header: Text("Bewässerungsplan")) {
                        Stepper("Bewässerungsfrequenz: \(bewässerungsfrequenz) Mal pro Woche", value: $bewässerungsfrequenz, in: 1...7)
                    }
                    
                    Section(header: Text("Sonnenlichtpräferenzen")) {
                        Picker("Sonnenlicht", selection: $sonnenlichtPräferenz) {
                            Text("Niedrig").tag(0)
                            Text("Mittel").tag(1)
                            Text("Hoch").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Pflanzdatum")) {
                        DatePicker("Pflanzdatum auswählen", selection: $ausgewähltesDatum, in: ...Date(), displayedComponents: .date)
                    }
                    
                    Section {
                        Button(action: {
                            // Speichern Sie die ausgewählten Optionen in Variablen oder führen Sie andere Aktionen durch
                            print("Pflanze ausgewählt: \(pflanzeAusgewählt)")
                            print("Bewässerungsfrequenz: \(bewässerungsfrequenz) Mal pro Woche")
                            print("Sonnenlichtpräferenz: \(sonnenlichtPräferenz)")
                            print("Ausgewähltes Datum: \(ausgewähltesDatum)")
                        }) {
                            Text("Speichern")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color(red: 0.15, green: 0.35, blue: 0.43))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }

struct GardenPlanningShape_Previews: PreviewProvider {
    static var previews: some View {
        GardenPlanningShape()
    }
}


