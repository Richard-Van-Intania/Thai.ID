import SwiftUI

struct LocalizationSettingsView: View {
    @Environment(\.locale) private var lc
    @AppStorage("locale") private var locale: UserLocale = .th
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Spacer().frame(height: 24)
            Group {
                Button(action: { locale = UserLocale.en }) {
                    HStack {
                        Text(UserLocale.en.displayName).font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                        Spacer()
                        Image(systemName: isEn() ? "checkmark.circle.fill" : "circle.fill").font(.title2).foregroundColor(isEn() ? primary_darkblue : blue02)
                    }.padding(.vertical).contentShape(Rectangle())
                }.buttonStyle(.plain)
                Divider()
                Button(action: { locale = UserLocale.th }) {
                    HStack {
                        Text(UserLocale.th.displayName).font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                        Spacer()
                        Image(systemName: isEn() ? "circle.fill" : "checkmark.circle.fill").font(.title2).foregroundColor(isEn() ? blue02 : primary_darkblue)
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

    func isEn() -> Bool {
        return lc.identifier == UserLocale.en.rawValue
    }
}
