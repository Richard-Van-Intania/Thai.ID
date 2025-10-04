import SwiftUI

let tipsList: [(imageResource: String, head: String, body: String)] = [
    (imageResource: "welcome3", head: "certified_true_copy", body: "easily_make"), (imageResource: "welcome2", head: "identity_wallet", body: "securely_store"),
    (imageResource: "welcome4", head: "conveniently_create", body: "create_and_verify"),
    (imageResource: "welcome5", head: "save_and_share", body: "save_and_share_documents"),
]

struct OnboardingView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Button(action: {
                path.append(OnboardingRoutes.termsView)
            }) {
                Text("skip").frame(maxWidth: .infinity, alignment: .trailing)
                    .font(.custom("FCIconicRegular", size: 20)).foregroundColor(secondary_bluegray)
            }.buttonStyle(.plain)
            TabView {
                ForEach(tipsList.indices, id: \.self) { index in
                    let tip = tipsList[index]
                    VStack {
                        Image(tip.imageResource).resizable()
                            .scaledToFit().frame(height: 320)
                        Spacer().frame(height: 32)
                        Text(LocalizedStringKey(tip.head))
                            .font(.custom("FCIconicBold", size: 40)).foregroundColor(primary_black)
                        Spacer().frame(height: 16)
                        Text(LocalizedStringKey(tip.body)).frame(maxWidth: .infinity).multilineTextAlignment(.center)
                            .font(.custom("FCIconicRegular", size: 24)).foregroundColor(neutral07)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(primary_red)
                UIPageControl.appearance().pageIndicatorTintColor = UIColor(secondary_gray)
            }
            Spacer()
            Button(action: {
                path.append(OnboardingRoutes.termsView)
            }) {
                Text("log_in").font(.custom("FCIconicBold", size: 24))
                    .foregroundColor(white)
                    .frame(maxWidth: 320, minHeight: 56)
                    .background(primary_gradient)
                    .clipShape(Capsule())
            }.buttonStyle(.plain)
        }.padding()
    }
}
