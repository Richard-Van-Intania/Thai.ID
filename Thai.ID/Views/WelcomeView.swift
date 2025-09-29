import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Image("thai_id_logo").resizable()
                .scaledToFit().frame(height: 48)
            Spacer()
            Image("welcome1").resizable()
                .scaledToFit().frame(height: 400)
            Spacer()
            HStack {
                Text("welcome_to")
                    .font(.custom("FCIconicBold", size: 40)).foregroundColor(primary_black)
                Text("thai_dot_id")
                    .font(.custom("FCIconicBold", size: 40)).foregroundColor(primary_darkblue)

            }
            Spacer().frame(height: 16)
            Text("a_credible_solution").frame(maxWidth: .infinity).multilineTextAlignment(.center)
                .font(.custom("FCIconicRegular", size: 24)).foregroundColor(neutral07)
            Spacer()
            Button(action: {
                // here
            }) {
                Text("get_started").font(.custom("FCIconicBold", size: 24))
                    .foregroundColor(white)
                    .frame(maxWidth: 320, minHeight: 56)
                    .background(primary_gradient)
                    .clipShape(Capsule())
            }

        }.padding()
    }
}
