import SwiftUI

let email = "contact@thai.id"

struct SupportView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Spacer().frame(height: 32)
            Text("if_you_encounter").lineSpacing(8).frame(maxWidth: .infinity).multilineTextAlignment(.center).font(.custom("FCIconicRegular", size: 20))
                .foregroundColor(primary_black)
            Spacer().frame(height: 8)
            Spacer()

        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("help_support").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}
