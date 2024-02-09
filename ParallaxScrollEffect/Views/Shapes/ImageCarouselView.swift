import SwiftUI

struct ImageCarouselView: View {
    let images: [String] = ["plant1", "plant2", "plant3", "plant4"] // Ersetzen Sie dies durch die Namen Ihrer Bilder
    let tasks: Binding<[Task]>  // Binding für die Aufgabenliste
    @Binding var selectedTask: Task?  // Binding für die ausgewählte Aufgabe
    let isPlantingTask: Bool  // Boolescher Wert, der angibt, ob es sich um eine Pflanzenaufgabe handelt

    @State private var selectedImageIndex: Int = 0  // Zustandsvariable für den ausgewählten Bildindex

    var body: some View {
        VStack {
            // ZStack für das Bild und die Navigationspfeile
            ZStack {
                Image(images[selectedImageIndex])  // Anzeige des ausgewählten Bilds
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()

                HStack {
                    Spacer()

                    // Button für vorheriges Bild
                    Button(action: {
                        withAnimation {
                            selectedImageIndex = (selectedImageIndex - 1 + images.count) % images.count
                            selectedTask = nil // Zurücksetzen der ausgewählten Aufgabe beim Ändern des Bilds
                        }
                    }) {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 0.15, green: 0.35, blue: 0.43))
                    }
                    .padding()

                    Spacer()

                    // Button für nächstes Bild
                    Button(action: {
                        withAnimation {
                            selectedImageIndex = (selectedImageIndex + 1) % images.count
                            selectedTask = nil // Zurücksetzen der ausgewählten Aufgabe beim Ändern des Bilds
                        }
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color(red: 0.15, green: 0.35, blue: 0.43))
                    }
                    .padding()

                    Spacer()
                }
            }

            // Anzeige des PageControl für die Bildnavigation
            PageControl(numberOfPages: images.count, currentPage: selectedImageIndex)
                .padding()
        }
    }
}
