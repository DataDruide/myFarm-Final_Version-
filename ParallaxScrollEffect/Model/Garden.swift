
import Foundation

struct Garden: Decodable, Identifiable, Hashable {
    var id: String
    let name: String
    let description: String
    let imageURL: String
    let image: String

}
