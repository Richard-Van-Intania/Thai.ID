import SwiftUI

struct LocalizationSettingsView: View {
    @Binding var path: NavigationPath
    let currentUILanguage: String = Bundle.main.preferredLocalizations[0]

    var body: some View {
        VStack {
            Group {
                Button(action: {
                    if let url = URL(string: UIApplication.openSettingsURLString),
                        UIApplication.shared.canOpenURL(url)
                    {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Text(String("English (EN)"))
                            .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                        Spacer()
                        Image(systemName: currentUILanguage == "en" ? "checkmark.circle.fill" : "circle.fill").font(.title2).foregroundColor(
                            currentUILanguage == "en" ? primary_darkblue : blue02
                        )
                    }.padding(.vertical).contentShape(Rectangle())
                }.buttonStyle(.plain)
                Divider()
                Button(action: {
                    if let url = URL(string: UIApplication.openSettingsURLString),
                        UIApplication.shared.canOpenURL(url)
                    {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Text(String("ไทย (TH)"))
                            .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                        Spacer()
                        Image(systemName: currentUILanguage == "en" ? "circle.fill" : "checkmark.circle.fill").font(.title2).foregroundColor(
                            currentUILanguage == "en" ? blue02 : primary_darkblue
                        )
                    }.padding(.vertical).contentShape(Rectangle())
                }.buttonStyle(.plain)
                Divider()
            }.padding(.horizontal)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("language").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}
