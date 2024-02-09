//
//import Foundation
//
//import SwiftUI
//import PDFKit
//
//struct PdfView: UIViewRepresentable {
// let pdfDoc: PDFDocument
// init(pdfData pdfDoc: PDFDocument) {
//  self.pdfDoc = pdfDoc
// }
// func makeUIView(context: Context) -> PDFView {
//  let pdfView = PDFView()
//  pdfView.document = pdfDoc
//  pdfView.autoScales = true
//  return pdfView
// }
// func updateUIView(_ uiView: PDFView, context: Context) {
//  uiView.document = pdfDoc
// }
//}
//
//
//
//import SwiftUI
//import PDFKit
//
//// PdfView bleibt gleich
//
//struct PachtPdfView: View {
//    // Deine Bindings hier
//    @Binding var showFilePicker: Bool
//    @Binding var temporaryPDFURL: URL?
//    @Binding var documentURL: URL?
//    
//    // Hier könnten deine anderen Funktionen und Eigenschaften sein
//    
//    var body: some View {
//        VStack {
//            PdfView(pdfData: PDFDocument(data: generatePdf())!)
//                .padding()
//            Button(action: { savePdf() }) {
//                Text("PDF Speichern")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 200, height: 50)
//                    .background(Color(red: 0.15, green: 0.35, blue: 0.43))
//                    .cornerRadius(10)
//            }
//            .padding()
//        }
//        .sheet(isPresented: $showFilePicker) {
//            if let tempPDFURL = temporaryPDFURL {
//                FilePicker(callback: { selectedURL in
//                    Task {
//                        do {
//                            let destinationURL = selectedURL.appendingPathComponent(tempPDFURL.lastPathComponent)
//                            try FileManager.default.copyItem(at: tempPDFURL, to: destinationURL)
//                            self.documentURL = destinationURL // Aktualisiere documentURL nach dem Kopieren
//                            // Weitere Aktionen nach dem Speichern
//                        } catch {
//                            // Fehler beim Kopieren oder anderen Vorgängen
//                        }
//                    }
//                }, existingFileURL: tempPDFURL)
//            } else {
//                Text("No PDF URL available")
//                // oder eine andere Aktion, falls temporaryPDFURL nil ist
//            }
//        }
//        // ... Rest deines Codes ...
//    }
//    
//    // Funktion zum Generieren des PDFs
//    func generatePdf() -> Data {
//        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 595, height: 842))
//        let data = pdfRenderer.pdfData { context in
//            context.beginPage()
//            alignText(value: """
//                Vermieter:
//                
//                myFarm GmbH und Co.KG,
//                Musterstr. 4,
//                PLZ 89150 Laichingen
//                
//                Mieter:
//                
//                Name__________________,
//                Adresse_______________,
//                PLZ___________________
//                
//                Gegenstand:
//                
//                Vermietung des Gartengrundstücks genaue Adresse:
//                _________________________
//                
//                Vertragsdauer:
//                
//                Vom ___________ bis ___________, mit Option zur Verlängerung.
//                Mietzahlung:
//                
//                Summe _______/________ , fällig zum Datum ________.
//                
//                Nutzung: Ausschließlich für
//                spezifische Nutzung:________________________________.
//                
//                Unterschriften:
//                Vermieter: _______________
//                Mieter: __________________
//                """, x: 0, y: 100, width: 595, height: 760, alignment: .left, textFont: UIFont.systemFont(ofSize: 20))
//            
//            alignText(value: "Pachtvertrag", x: 0, y: 30, width: 595, height: 100, alignment: .center, textFont: UIFont.systemFont(ofSize: 50, weight: .bold))
//            
//            let globalIcon = UIImage(named: "splashimg")
//            let globalIconRect = CGRect(x: 400, y: 180, width: 150, height: 150)
//            globalIcon!.draw(in: globalIconRect)
//        }
//        return data
//    }
//    
//    func alignText(value: String, x: Int, y: Int, width: Int, height: Int, alignment: NSTextAlignment, textFont: UIFont) {
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = alignment
//        let attributes = [
//            NSAttributedString.Key.font : textFont,
//            NSAttributedString.Key.paragraphStyle: paragraphStyle
//        ]
//        let textRect = CGRect(x: x, y: y, width: width, height: height)
//        value.draw(in: textRect, withAttributes: attributes)
//    }
//    
//    
//    // Funktion zum Speichern des PDFs
//    func savePdf() {
//        let filename = "GeneratedPDF.pdf"
//        let pdfData = generatePdf()
//        if let documentDirect = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let documentURL = documentDirect.appendingPathComponent(filename)
//            do {
//                try pdfData.write(to: documentURL)
//                temporaryPDFURL = documentURL // Speichere den temporären URL für das PDF
//                print("Your PDF is Saved \(documentURL)")
//                openFilePicker(documentURL) // Öffne den FilePicker mit dem gespeicherten Dokumentpfad
//            } catch {
//                print("Error saving PDF")
//            }
//        }
//    }
//    
//    // Funktion zum Öffnen des FilePickers
//    func openFilePicker(_ documentURL: URL) {
//        self.showFilePicker = true
//        // Hier könntest du weitere Aktionen nach dem Speichern ausführen
//    }
//
//    struct FilePicker: UIViewControllerRepresentable {
//        var callback: (URL) -> Void
//        var existingFileURL: URL
//        func makeUIViewController(context: UIViewControllerRepresentableContext<FilePicker>) -> UIDocumentPickerViewController {
//            let documentPicker = UIDocumentPickerViewController(forExporting: [existingFileURL])
//            documentPicker.delegate = context.coordinator
//            return documentPicker
//        }
//        func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<FilePicker>) {
//        }
//        func makeCoordinator() -> Coordinator {
//            Coordinator(self)
//        }
//        class Coordinator: NSObject, UIDocumentPickerDelegate {
//            var parent: FilePicker
//            init(_ parent: FilePicker) {
//                self.parent = parent
//            }
//            func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//                guard let selectedFolderURL = urls.first else {
//                    return
//                }
//                let destinationURL = selectedFolderURL.appendingPathComponent(parent.existingFileURL.lastPathComponent)
//                do {
//                    try FileManager.default.copyItem(at: parent.existingFileURL, to: destinationURL)
//                    parent.callback(destinationURL)
//                } catch {
//                    print("Error copying file")
//                }
//            }
//        }
//    }
//
//}
//struct FooterView: View {
//    @State private var newsletterText = ""
//    
//    var body: some View {
//        HStack(alignment: .top) {
//            leftFooterShape()
//            Spacer()
//            rightFooterShape(newsletterText: $newsletterText)
//        }
//        .frame(width: 400, height: 150)
//        .background(Color(red: 0.02, green: 0.23, blue: 0.23))
//    }
//}
//
//struct FooterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FooterView()
//    }
//}
//
//struct leftFooterShape: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("myFArm")
//                .font(.system(size: 24))
//                .foregroundColor(.white)
//                .padding(.bottom, 4)
//            
//            Text("Bestellen Sie ihren Newsletter noch heute")
//                .font(.system(size: 12))
//                .foregroundColor(.white)
//                .padding(.bottom, 8)
//            
//            HStack(spacing: 8) {
//                Link(destination: URL(string: "https://twitter.com")!) {
//                    Image(systemName: "bolt.fill")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                }
//                Link(destination: URL(string: "https://instagram.com")!) {
//                    Image(systemName: "camera.fill")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                }
//                Link(destination: URL(string: "https://facebook.com")!) {
//                    Image(systemName: "face.smiling.fill")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                }
//                Link(destination: URL(string: "https://linkedin.com")!) {
//                    Image(systemName: "person.2.fill")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(.white)
//                }
//            }
//        }
//        .padding(8)
//        .frame(width: 150, height: 150)
//        .background(Color(red: 0.02, green: 0.23, blue: 0.23))
//    }
//}
//
//struct rightFooterShape: View {
//    @Binding var newsletterText: String
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Newsletter")
//                .font(.system(size: 12))
//                .foregroundColor(.white)
//            
//            TextField("Abonniere unseren Newsletter", text: $newsletterText)
//                .padding(8)
//                .background(Color.white)
//                .cornerRadius(8)
//                .padding(.bottom, 8)
//            
//            HStack {
//                Spacer()
//                
//                Button(action: {
//                    // Code für das Absenden des Newsletters hier einfügen
//                }) {
//                    Text("Absenden")
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 8)
//                        .background(Color(red: 0.15, green: 0.35, blue: 0.43))
//                        .cornerRadius(8)
//                }
//            }
//        }
//        .padding(8)
//        .frame(width: 150, height: 150)
//        .background(Color(red: 0.02, green: 0.23, blue: 0.23))
//    }
//}
