import SwiftUI

struct ProfileView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("go to terms") {
            path.append(ProfileRoute.termsView)
        }
    }
}

