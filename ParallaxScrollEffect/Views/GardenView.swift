import SwiftUI

struct GardenView: View {
    @StateObject private var viewModel = GardenViewModel(model: GardenModel())
    @State private var showMyOrderView = false
    @State private var selectedTask: Task?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Gartenplanung Sektion
                    NavigationLink(destination: GardenPlanningShape()) {
                        Image("gardencenter")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()

                    // Pflanzaufgaben Sektion
                    Section(header: Text("Pflanzaufgaben").font(.title).foregroundColor(.blue)) {
                        // Carousel-Ansicht für Pflanzaufgaben
                        ImageCarouselView(tasks: $viewModel.model.plantingTasks, selectedTask: $selectedTask, isPlantingTask: true)

                        // Liste von Pflanzaufgaben
                        List(viewModel.model.plantingTasks) { plantingTask in
                            VStack(alignment: .leading) {
                                // Toggle zum Abschließen von Aufgaben
                                Toggle(isOn: $viewModel.model.plantingTasks[plantingTask.id].completed) {
                                    HStack {
                                        Text(plantingTask.name)
                                        Spacer()
                                    }
                                    .padding(.vertical, 8)
                                }
                                .onChange(of: viewModel.model.plantingTasks[plantingTask.id].completed) { newValue in
                                    viewModel.toggleTask(index: plantingTask.id, isPlantingTask: true)
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding()
                        }
                        .onAppear {
                            HapticEngine.trigger()
                        }
                    }
                }

                // Ergebnisse anzeigen Button
                Button(action: {
                    showMyOrderView = true
                }) {
                    Text("Ergebnisse anzeigen")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                }
                .sheet(isPresented: $showMyOrderView) {
                    MyOrdersView()
                }
            }
            .background(Color.green.opacity(0.1))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Gartenansicht", displayMode: .inline)
        }
    }
}

struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenView()
    }
}
