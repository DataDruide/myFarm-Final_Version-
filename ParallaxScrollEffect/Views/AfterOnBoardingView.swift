
import SwiftUI

struct AfterOnBoardingView: View {
    
    @StateObject var viewModel = AppLoadingViewModel()

    var body: some View {
        ZStack {
                VStack {
                    StartHeaderView()
                       // .padding(30)
                    StartBodyView()
                    StartFooterView()
                    BottomView()
                }
                .padding(.horizontal) // Add padding for a better layout
                .padding(.vertical, 20)
              
        }
        .frame(maxWidth: 410, maxHeight: 950)
// Utilize maximum available space
        .edgesIgnoringSafeArea(.all) // Extend views to edges
    }
}


#Preview {
    AfterOnBoardingView()
}
