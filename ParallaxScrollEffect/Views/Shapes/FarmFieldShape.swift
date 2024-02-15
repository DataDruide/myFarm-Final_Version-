import SwiftUI

struct FarmFieldView: View {
    var body: some View {
        VStack {
            // Erste Reihe von Feldern (HStack mit drei Rechtecken)
            HStack {
                Rectangle()
                    .fill(Color("FieldBrown"))  // Farbe des Feldes
                    .frame(width: 100, height: 150)  // Größe des Rechtecks
                    .overlay(
                        Rectangle()
                            .stroke(Color("FieldBorder"), lineWidth: 2)  // Rand um das Rechteck
                    )

                Rectangle()
                    .fill(Color("FieldBrown"))
                    .frame(width: 100, height: 150)
                    .overlay(
                        Rectangle()
                            .stroke(Color("FieldBorder"), lineWidth: 2)
                    )

                Rectangle()
                    .fill(Color("FieldBrown"))
                    .frame(width: 100, height: 150)
                    .overlay(
                        Rectangle()
                            .stroke(Color("FieldBorder"), lineWidth: 2)
                    )
            }

            // Zweite Reihe von Feldern (HStack mit drei Rechtecken)
            HStack {
                Rectangle()
                    .fill(Color("FieldBrown"))
                    .frame(width: 100, height: 150)
                    .overlay(
                        Rectangle()
                            .stroke(Color("FieldBorder"), lineWidth: 2)
                    )

                Rectangle()
                    .fill(Color("FieldBrown"))
                    .frame(width: 100, height: 150)
                    .overlay(
                        Rectangle()
                            .stroke(Color("FieldBorder"), lineWidth: 2)
                    )

                Rectangle()
                    .fill(Color("FieldBrown"))
                    .frame(width: 100, height: 150)
                    .overlay(
                        Rectangle()
                            .stroke(Color("FieldBorder"), lineWidth: 2)
                    )
            }
        }
        .frame(width: 350, height: 450)  // Gesamtrahmen für das Farmfeld
        .cornerRadius(20)  // Abrundung der Ecken des Gesamtrahmens
    }
}

#Preview {
    FarmFieldView()
}
