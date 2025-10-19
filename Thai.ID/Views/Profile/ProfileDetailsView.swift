import SwiftUI

struct ProfileDetailsView: View {
    @Environment(\.locale) private var locale

    @AppStorage("idString") private var idString: String = "1490700031833"
    @AppStorage("thaiPrefix") private var thaiPrefix: String = ""
    @AppStorage("thaiName") private var thaiName: String = ""
    @AppStorage("thaiMiddleName") private var thaiMiddleName: String = ""
    @AppStorage("thaiSurname") private var thaiSurname: String = ""
    @AppStorage("engPrefix") private var engPrefix: String = ""
    @AppStorage("engName") private var engName: String = ""
    @AppStorage("engMiddleName") private var engMiddleName: String = ""
    @AppStorage("engSurname") private var engSurname: String = ""
    @AppStorage("birthDate") private var birthDate: String = "2025-10-19T14:06:23Z"

    @Binding var path: NavigationPath

    var id: String {
        if !idString.isEmpty {
            var concatenation = ""
            for (index, character) in idString.enumerated() {
                if index == 0 || index == 4 || index == 9 || index == 11 {
                    concatenation += String(character) + " "
                } else {
                    concatenation += String(character)
                }
            }
            return concatenation
        }
        return idString
    }

    var date: String {
        if !birthDate.isEmpty {
            if let dateFromString = formatter.date(from: birthDate) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                dateFormatter.locale = locale
                return dateFormatter.string(from: dateFromString)
            }
        }
        return birthDate
    }

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("id_number").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                    Spacer()
                    if id.isEmpty {
                        Text("id_number").font(.custom("FCIconicRegular", size: 20)).foregroundColor(neutral04)
                    } else {
                        Text(id).font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_darkblue)
                    }
                }.padding(.vertical)
                Divider()
                HStack {
                    Text("date_of_birth").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                    Spacer()
                    if date.isEmpty {
                        Text("date_format").font(.custom("FCIconicRegular", size: 20)).foregroundColor(neutral04)
                    } else {
                        Text(date).font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_darkblue)
                    }
                }.padding(.vertical)
                Divider()

                ProfileDetailsItem(label: "title", value: $thaiPrefix)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).padding()
        }
        .background(white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("my_profile")
                    .font(.custom("FCIconicBold", size: 24))
                    .foregroundColor(primary_black)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    //                    path.append(ProfileRoute.profileEditView)
                }) {
                    Image(systemName: "pencil.line").font(.title2).foregroundColor(neutral05)
                }.buttonStyle(.plain)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    ProfileDetailsView(path: .constant(NavigationPath())).environment(\.locale, Locale(identifier: "en"))
}

struct ProfileDetailsItem: View {
    let label: String
    @Binding var value: String

    var body: some View {
        VStack {
            HStack {
                Text(LocalizedStringKey(label)).font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                Spacer()
                if value.isEmpty {
                    Text(LocalizedStringKey(label)).font(.custom("FCIconicRegular", size: 20)).foregroundColor(neutral04)
                } else {
                    Text(value).font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_darkblue)
                }
            }.padding(.vertical)
            Divider()
        }
    }
}
