import SwiftUI

struct ProfileView: View {
    @Binding var path: NavigationPath

    var body: some View {
        Button(String("debugs")) {
            path.append(ProfileRoute.termsView)
        }
    }
}
