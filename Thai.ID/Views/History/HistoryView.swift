import SwiftUI

struct HistoryView: View {
    @AppStorage("historyViewLayout") private var historyViewLayout: ViewLayout = .list

    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack {
                //
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(neutral01).toolbar {
            ToolbarItem(placement: .principal) { Text("history").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black) }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}
