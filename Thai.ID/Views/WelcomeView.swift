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
                Text("ยินดีต้อนรับสู่")
                    .font(.custom("FCIconicBold", size: 40)).foregroundColor(primary_black)
                Text("Thai.ID")
                    .font(.custom("FCIconicBold", size: 40)).foregroundColor(primary_darkblue)

            }
            Spacer().frame(height: 16)
            Text("ให้บริการพิสูจน์และยืนยันตัวตนเพื่อสังคมไทยไร้กระดาษให้บริการพิสูจน์และยืนยันตัวตนเพื่อสังคมไทยไร้กระดาษ")
                .font(.custom("FCIconicRegular", size: 24)).foregroundColor(neutral07)
            Spacer()
            Button(action: {
                // here
            }) {
                Text("hola").font(.custom("FCIconicBold", size: 24))
                    .foregroundColor(white)
                    .frame(maxWidth: 320, maxHeight: 56)
                    .background(primary_gradient)
                    .clipShape(Capsule())
            }

        }.padding()
    }
}

#Preview {
    WelcomeView()
}
