import SwiftUI

struct GardenPlannerView: View {
    @State private var fieldPosition: CGPoint = CGPoint(x: 55, y: 305)
    @State private var selectedPlantIndex: Int? = nil
    @State private var isPlantSelectionPresented: Bool = false

    let plantImages = ["plant1", "plant2", "plant3", "plant4", "plant5"]
    let gridSize = 5 // Anzahl der Spalten im Gitter

    var body: some View {
        ZStack {
            Image("garden")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .clipped()

            // Pflanzenbilder anzeigen
            if let index = selectedPlantIndex {
                Image(plantImages[index])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(fieldPosition)
                    .zIndex(1.0)
            }
          
            // Steuerung mit Buttons
            VStack {
                Spacer()
                GardenPlannerHeaderView()

                FarmFieldView()


                Spacer()
                // Toolbox mit Pflanzenbildern
                LazyVGrid(columns: Array(repeating: GridItem(), count: plantImages.count), spacing: 10) {
                    ForEach(plantImages.indices, id: \.self) { index in
                        Image(plantImages[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                selectedPlantIndex = index
                            }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(20)
                .padding([.leading, .bottom], 20) // Abstand zum linken und unteren Rand
            }
            .padding()
        }
    }

    private func moveBlock(direction: Direction) {
        let step: CGFloat = 30
        switch direction {
        case .up:
            fieldPosition.y -= step
        case .down:
            fieldPosition.y += step
        case .left:
            fieldPosition.x -= step
        case .right:
            fieldPosition.x += step
        }
    }
}

struct GardenPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GardenPlannerView()
        }
    }
}


