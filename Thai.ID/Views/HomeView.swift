import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("debugs") {
            path.append(HomeRoute.profileDetailsView)
        }
    }
}
