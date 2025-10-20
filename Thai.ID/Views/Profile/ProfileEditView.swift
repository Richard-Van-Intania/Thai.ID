import SwiftUI

struct ProfileEditView: View {
    @Environment(\.locale) private var locale

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

    @State private var idStringState: String = ""
    @State private var thaiPrefixState: String = ""
    @State private var thaiNameState: String = ""
    @State private var thaiMiddleNameState: String = ""
    @State private var thaiSurnameState: String = ""
    @State private var engPrefixState: String = ""
    @State private var engNameState: String = ""
    @State private var engMiddleNameState: String = ""
    @State private var engSurnameState: String = ""
    @State private var birthDateState: String = ""

    @State private var selectedDate = Date()
    @State private var showPicker = false

    @Binding var path: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("id_number").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                TextField("id_number", text: $idStringState).keyboardType(.numberPad)
                    .padding().background(RoundedRectangle(cornerRadius: 4).stroke(neutral04, lineWidth: 1))
                    .frame(maxWidth: .infinity)
                    .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
                Text("\(idStringState.count)/13").font(.custom("FCIconicRegular", size: 12)).foregroundColor(primary_black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer().frame(height: 16)
                Text("date_of_birth").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                HStack {
                    TextField("date_format", text: $birthDateState).disabled(true)
                        .padding().background(RoundedRectangle(cornerRadius: 4).stroke(neutral04, lineWidth: 1))
                        .frame(maxWidth: .infinity)
                        .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
                    Button(action: {
                        showPicker = true
                    }) {
                        Image(systemName: "calendar").font(.title2).foregroundColor(primary_black)
                    }.buttonStyle(.plain).padding(.horizontal)
                }
                ProfileDetailsHr(label: "personal_info_thai")
                OutlinedTextField(label: "first_name", value: $thaiNameState)
                Spacer().frame(height: 16)
                OutlinedTextField(label: "middle_name", value: $thaiMiddleNameState)
                Spacer().frame(height: 16)
                OutlinedTextField(label: "last_name", value: $thaiSurnameState)
                ProfileDetailsHr(label: "personal_info_eng")
                OutlinedTextField(label: "first_name", value: $engNameState)
                Spacer().frame(height: 16)
                OutlinedTextField(label: "middle_name", value: $engMiddleNameState)
                Spacer().frame(height: 16)
                OutlinedTextField(label: "last_name", value: $engSurnameState)
                Spacer().frame(height: 16)
            }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
        }.background(white).toolbar {
            ToolbarItem(placement: .principal) {
                Text("id_card_info").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar).sheet(isPresented: $showPicker) {
                DatePickerSheetView(selectedDate: $selectedDate, showPicker: $showPicker)
            }
            .onAppear {
                idString = idStringState
                thaiPrefix = thaiPrefixState
                thaiName = thaiNameState
                thaiMiddleName = thaiMiddleNameState
                thaiSurname = thaiSurnameState
                engPrefix = engPrefixState
                engName = engNameState
                engMiddleName = engMiddleNameState
                engSurname = engSurnameState
                if birthDate.isEmpty {
                    birthDateState = birthDate
                } else {
                    if let dateFromString = formatter.date(from: birthDate) {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy"
                        dateFormatter.locale = locale
                        birthDateState = dateFormatter.string(from: dateFromString)
                    }
                }
            }
            .onDisappear {
                // Invalidate the timer when the view disappears

            }.onChange(of: selectedDate) { oldValue, newValue in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
                dateFormatter.locale = locale
                birthDateState = dateFormatter.string(from: newValue)
            }.onChange(of: idStringState) { oldValue, newValue in
                if newValue.count < 14 {
                    idStringState = newValue
                } else {
                    idStringState = oldValue
                }
            }
    }
}

#Preview {
    ProfileEditView(path: .constant(NavigationPath())).environment(\.locale, Locale(identifier: "th"))
}

let startDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
let endDate = Calendar.current.date(byAdding: .year, value: -17, to: Date())!

struct DatePickerSheetView: View {
    @Binding var selectedDate: Date
    @Binding var showPicker: Bool

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "date_of_birth",
                    selection: $selectedDate,
                    in: startDate...endDate,
                    displayedComponents: [.date]
                ).datePickerStyle(.graphical).padding()
                Spacer()
            }
            .navigationTitle("date_of_birth")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("ok") { showPicker = false }
                }
            }
        }
    }
}

struct OutlinedTextField: View {
    let label: String
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(LocalizedStringKey(label)).font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
            TextField(LocalizedStringKey(label), text: $value)
                .padding().background(RoundedRectangle(cornerRadius: 4).stroke(neutral04, lineWidth: 1))
                .frame(maxWidth: .infinity)
                .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
        }
    }
}
