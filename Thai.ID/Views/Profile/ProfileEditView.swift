import SwiftUI

struct ProfileEditView: View {
    @AppStorage("idString") private var idString: String = ""
    @AppStorage("thaiPrefix") private var thaiPrefix: String = ""
    @AppStorage("thaiName") private var thaiName: String = ""
    @AppStorage("thaiMiddleName") private var thaiMiddleName: String = ""
    @AppStorage("thaiSurname") private var thaiSurname: String = ""
    @AppStorage("engPrefix") private var engPrefix: String = ""
    @AppStorage("engName") private var engName: String = ""
    @AppStorage("engMiddleName") private var engMiddleName: String = ""
    @AppStorage("engSurname") private var engSurname: String = ""
    @AppStorage("birthDate") private var birthDate: String = ""

    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("id_number").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                ProfileDetailsHr(label: "personal_info_thai")
                ProfileDetailsHr(label: "personal_info_eng")
            }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
        }.background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("id_card_info").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ProfileEditView(path: .constant(NavigationPath())).environment(\.locale, Locale(identifier: "th"))
}
