import SwiftUI

let email = "contact@thai.id"

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
                let subject = String(localized: "subject")
                let body = String(localized: "body")
                let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let urlString = "mailto:\(email)?subject=\(subjectEncoded)&body=\(bodyEncoded)"
                if let url = URL(string: urlString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text(email)
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
