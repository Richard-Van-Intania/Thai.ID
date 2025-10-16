import SwiftUI
import WebKit

struct PolicyAndSafetyView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            WebView(url: URL(string: "https://thai.id/privacy")!).ignoresSafeArea()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("privacy_policy").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
