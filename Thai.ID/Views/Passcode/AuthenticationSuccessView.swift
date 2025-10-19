import SwiftUI

struct AuthenticationSuccessView: View {
    @Binding var path: NavigationPath
    @Binding var biometricsAskDialog: Bool

    var body: some View {
        VStack {
            Image("create_sucess").resizable()
                .scaledToFit().frame(height: 160)
            Spacer().frame(height: 24)
            Text("set_up_pin_success")
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
        }.navigationBarBackButtonHidden(true).onAppear {
            Task {
                try? await Task.sleep(for: .seconds(2))
                path = NavigationPath()
                try? await Task.sleep(for: .seconds(2))
                biometricsAskDialog = true
            }
        }
    }
}
