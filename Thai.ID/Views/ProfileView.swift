import SwiftUI

struct ProfileView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("debugs") {
            path.append(ProfileRoute.profileDetailsView)
        }
    }
}

