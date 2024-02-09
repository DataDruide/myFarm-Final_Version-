

import Foundation
import MapKit

struct IdentifiablePointAnnotation: Identifiable {
    let id = UUID().uuidString
    let annotation: MKPointAnnotation
}
