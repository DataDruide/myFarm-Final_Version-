

import Foundation

struct Product: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var title: String
    var price: Double
    var description: String
    var description2: String
    var imageName: String
    var isLiked: Bool = false // Productparameter mit einem Bool steht momentan auf (falsch)
    var rating : Int = 0

}
