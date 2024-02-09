import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let url: URL
    let size: CGSize
    let animationSpeed: CGFloat

    init(url: URL, size: CGSize = CGSize(width: 350, height: 350), animationSpeed: CGFloat = 3) {
        self.url = url
        self.size = size
        self.animationSpeed = animationSpeed
    }

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        let animationView = Lottie.AnimationView()
        
        // Setzt die Animation des AnimationViews mit dem Dateipfad aus der URL
        animationView.animation = Lottie.Animation.filepath(url.path)
        animationView.play() // Startet die Animation
        animationView.animationSpeed = animationSpeed
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        // Fügt Constraints für die Größe und Position des AnimationViews hinzu
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalToConstant: size.width),
            animationView.heightAnchor.constraint(equalToConstant: size.height),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Implementiere die Update-Logik hier, falls erforderlich
    }
}
