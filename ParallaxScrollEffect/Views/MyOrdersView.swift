import SwiftUI

struct MyOrdersView: View {
    @ObservedObject var bookingViewModel = BookingViewModel()
    
    var body: some View {
        VStack {
            // Überschrift für den Warenkorb
            Text("Warenkorb")
                .font(.title)
                .padding()
            
            // Überprüfung, ob der Warenkorb leer ist
            if $bookingViewModel.cartProducts.isEmpty {
                // Anzeige, wenn der Warenkorb leer ist
                Text("Keine Produkte im Warenkorb")
                    .padding()
            } else {
                // Anzeige der Produkte im Warenkorb
                ForEach(bookingViewModel.cartProducts, id: \.id) { product in
                    Text("Produkt: \(product.name)")
                        .padding()
                }
            }
            
            Spacer()
        }
    }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView()
    }
}
