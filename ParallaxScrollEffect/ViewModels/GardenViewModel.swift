import SwiftUI

// ViewModel-Klasse für den Garten
class GardenViewModel: ObservableObject {
    
    // Published-Variable für das Gartenmodell
    @Published var model: GardenModel

    // Initialisierer für das ViewModel
    init(model: GardenModel) {
        self.model = model
    }

    // Funktion zum Umschalten einer Aufgabe (Pflanz- oder andere Aufgabe)
    func toggleTask(index: Int, isPlantingTask: Bool) {
        if isPlantingTask {
            model.plantingTasks[index].completed.toggle()
        } else {
            model.otherTasks[index].completed.toggle()
        }
    }
}

// View für die Seitensteuerung (Page Control)
struct PageControl: View {
    
    // Anzahl der Seiten
    let numberOfPages: Int
    
    // Aktuelle Seite
    let currentPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(0..<numberOfPages), id: \.self) { page in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(page == currentPage ? .green.opacity(0.7) : .gray)
            }
        }
    }
}
