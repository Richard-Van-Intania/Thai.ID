import SwiftUI

struct SupportView: View {
    var body: some View {
        VStack {
            //

        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("help_support").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    SupportView()
}
