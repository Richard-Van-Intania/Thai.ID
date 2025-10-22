import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {}.frame(maxWidth: .infinity, maxHeight: .infinity).background(neutral01).overlay(alignment: .top) {
                    Ellipse()
                        .fill(primary_gradient)
                        .frame(width: geometry.size.width * 1.8025641, height: geometry.size.width * 0.77179487).offset(
                            y: -(geometry.size.width * 0.38589744) + 32
                        )
                }.ignoresSafeArea()
                VStack {
                    Spacer().frame(height: 16)
                    HStack {
                        Image("thai_id_app_icon").resizable().scaledToFit().frame(height: 64).clipShape(Circle())
                        Spacer().frame(width: 16)
                        VStack(alignment: .leading) {
                            Text("hello").font(.custom("FCIconicRegular", size: 20)).foregroundColor(white)
                            Text("app_name").font(.custom("FCIconicBold", size: 28)).foregroundColor(white)
                        }
                        Spacer()
                        Button(action: {
                            path.append(HomeRoute.profileDetailsView)
                        }) {
                            ZStack {
                                Circle().fill(blue05).frame(width: 40, height: 40)
                                Image(systemName: "pencil.line").font(.title2).foregroundColor(white)
                            }
                        }.buttonStyle(.plain)

                    }.padding(.horizontal)
                    Spacer()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)

            }

        }
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath())).environment(\.locale, Locale(identifier: "th"))
}
