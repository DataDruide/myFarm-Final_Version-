import SwiftUI

struct DateTimeSettingsView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            DatePicker("Datum und Uhrzeit", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()
                .frame(maxWidth: .infinity)
            
            Text("Ausgewähltes Datum und Uhrzeit: \(formattedDate)")
                .padding()
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .navigationBarTitle("Datum und Uhrzeit einstellen", displayMode: .inline)
        .padding()
        .background(Color(UIColor.systemBackground))
        .ignoresSafeArea()
    }
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: selectedDate)
    }
}
