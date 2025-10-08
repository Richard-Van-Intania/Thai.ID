import SwiftUI

struct ConfirmPasscodeView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        HStack {
            Text("welcome_to")
        }.navigationBarBackButtonHidden(true)
    }
}
