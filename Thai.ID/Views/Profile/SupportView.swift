import SwiftUI

let recipient = "contact@thai.id"
let subject = "App Feedback"
let body = "I have some feedback about the app..."

struct SupportView: View {
    @Environment(\.openURL) private var openURL
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Spacer().frame(height: 32)
            Text("if_you_encounter").lineSpacing(8).frame(maxWidth: .infinity).multilineTextAlignment(.center).font(.custom("FCIconicRegular", size: 20))
                .foregroundColor(primary_black).padding(.horizontal)
            Spacer().frame(height: 32)
            Button(action: {
                //
            }) {
                Text(recipient)
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(blue05).underline()
            }.buttonStyle(.plain)
            Spacer()

        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("help_support").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}
