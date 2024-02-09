
import Foundation
class GardenModel: ObservableObject {
    @Published var plantingTasks: [Task] = []
    @Published var otherTasks: [Task] = []
}

struct Task: Identifiable, Equatable {
    var id: Int
    var name: String
    var completed: Bool
}
