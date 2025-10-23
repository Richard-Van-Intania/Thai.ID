import SwiftUI

struct HomeView: View {

    @AppStorage("isSelectedNeverShowAgain") private var isSelectedNeverShowAgain: Bool = false
    @AppStorage("homeViewLayout") private var homeViewLayout: ViewLayout = .list

    @Binding var path: NavigationPath

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {}.frame(maxWidth: .infinity, maxHeight: .infinity).background(neutral01).overlay(alignment: .top) {
                    Ellipse()
                        .fill(primary_gradient)
                        .frame(width: geometry.size.width * 1.8025641, height: geometry.size.width * 0.77179487).offset(
                            y: -(geometry.size.width * 0.38589744) - (geometry.size.width * 0.21918) + 128.438
                        )
                }.ignoresSafeArea()
                VStack(alignment: .leading) {
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
                            }.clipShape(Circle())
                        }.buttonStyle(.plain)

                    }.padding(.horizontal)
                    Spacer().frame(height: abs((geometry.size.width * 0.13699) - 44.27))
                    HStack {
                        ZStack {
                            HStack {
                                Spacer()
                                Image("icon_ctc").resizable().scaledToFit().frame(height: 136)
                            }
                            HStack {
                                Text("make_a_cert").font(.custom("FCIconicBold", size: 28)).foregroundColor(light_blue09)
                                Spacer()
                                Button(action: {
                                    //                                    path.append(HomeRoute.profileDetailsView)

                                }) {
                                    Image("group_40854").resizable().scaledToFit().frame(height: 64).clipShape(Circle())
                                }.buttonStyle(.plain)
                            }.padding(.horizontal)
                        }
                    }.padding(16).frame(maxWidth: .infinity).frame(height: 96).background(white).cornerRadius(16).shadow(radius: 1).padding(.horizontal)
                    Spacer().frame(height: 24)
                    HStack {
                        Text("my_documents_and_cards").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
                        Spacer()
                        Button(action: {
                            homeViewLayout = (homeViewLayout == .list ? .thumbnails : .list)
                        }) {
                            Image(systemName: homeViewLayout == .list ? "square.grid.2x2" : "list.bullet").font(.title2).foregroundColor(primary_darkblue)
                        }.buttonStyle(.plain)

                    }.padding(.horizontal, 24)
                    Spacer().frame(height: 16)
                    ScrollView {
                        VStack {
                            Text("make_a_cert").font(.custom("FCIconicBold", size: 28)).foregroundColor(light_blue09)
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)

            }

        }
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath())).environment(\.locale, Locale(identifier: "th"))
}
