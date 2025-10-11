import SwiftUI

struct AuthenticationSuccessView: View {
    @Binding var path: NavigationPath
    @AppStorage("useBiometric") private var useBiometric: Bool = false

    var body: some View {
        VStack {
            Image("create_sucess").resizable()
                .scaledToFit().frame(height: 160)
            Spacer().frame(height: 24)
            Text("set_up_pin_success")
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
        }.navigationBarBackButtonHidden(true).onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                path = NavigationPath()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    authenticateWithBiometrics(completion: { success, authenticationError in useBiometric = success })
                }
            }
        }
    }
}
