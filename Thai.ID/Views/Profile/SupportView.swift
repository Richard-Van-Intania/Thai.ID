import SwiftUI

let email = "contact@thai.id"

struct SupportView: View {
    @Environment(\.openURL) private var openURL
    @AppStorage("locale") private var locale: UserLocale = .th

    @Binding var path: NavigationPath

    var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
        return "\(String(localized: "version", locale: Locale(identifier: locale.rawValue))) \(version) (Build \(build))"
    }

    var body: some View {
        VStack {
            Spacer().frame(height: 32)
            Text("if_you_encounter").lineSpacing(8).frame(maxWidth: .infinity).multilineTextAlignment(.center).font(.custom("FCIconicRegular", size: 20))
                .foregroundColor(primary_black).padding(.horizontal)
            Spacer().frame(height: 32)
            Button(action: {
                let subject = String(localized: "subject", locale: Locale(identifier: locale.rawValue))
                let body = String(localized: "body", locale: Locale(identifier: locale.rawValue))
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
            Text(appVersion)
                .font(.custom("FCIconicRegular", size: 20)).foregroundColor(neutral04)
            Spacer().frame(height: 32)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("help_support").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}
