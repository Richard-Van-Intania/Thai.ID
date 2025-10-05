import SwiftUI

struct HistoryView: View {
    @Binding var path: NavigationPath

    var body: some View {

        HStack {
            Text("add_card").frame(maxWidth: .infinity, maxHeight: .infinity).background(bg_gray)
        }
    }
}
