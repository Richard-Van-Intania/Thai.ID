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
    @State private var datePicker = false

    @State private var titleThai: CardTitle = .mr
    @State private var titlePickerThai = false

    @State private var titleEnglish: CardTitle = .mr
    @State private var titlePickerEnglish = false

    @State private var error = false

    @Binding var path: NavigationPath

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    Text("id_number").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black).id(ScrollAnchor.top)
                    TextField("id_number", text: $idStringState).keyboardType(.numberPad)
                        .padding().background(RoundedRectangle(cornerRadius: 4).stroke(error ? primary_red : neutral04, lineWidth: 1))
                        .frame(maxWidth: .infinity)
                        .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
                    HStack {
                        if error { Text("required").font(.custom("FCIconicRegular", size: 14)).foregroundColor(primary_red) }
                        Spacer()
                        Text("\(idStringState.count)/13").font(.custom("FCIconicRegular", size: 14)).foregroundColor(primary_black)
                    }.frame(maxWidth: .infinity).padding(.horizontal, 8)
                    Spacer().frame(height: 16)
                    Text("date_of_birth").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                    HStack {
                        TextField("date_format", text: $birthDateState).disabled(true)
                            .padding().background(RoundedRectangle(cornerRadius: 4).stroke(neutral04, lineWidth: 1))
                            .frame(maxWidth: .infinity)
                            .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
                        Button(action: {
                            datePicker = true
                        }) {
                            Image(systemName: "calendar").font(.title2).foregroundColor(primary_black)
                        }.buttonStyle(.plain).padding(.horizontal)
                    }
                    ProfileDetailsHr(label: "personal_info_thai")
                    Text("title").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                    HStack {
                        TextField("title", text: $thaiPrefixState).disabled(true)
                            .padding().background(RoundedRectangle(cornerRadius: 4).stroke(neutral04, lineWidth: 1))
                            .frame(maxWidth: .infinity)
                            .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
                        Button(action: {
                            titlePickerThai = true
                        }) {
                            Image(systemName: "chevron.down").font(.title2).foregroundColor(primary_black)
                        }.buttonStyle(.plain).padding(.horizontal)
                    }
                    Spacer().frame(height: 24)
                    OutlinedTextField(label: "first_name", value: $thaiNameState)
                    Spacer().frame(height: 24)
                    OutlinedTextField(label: "middle_name", value: $thaiMiddleNameState)
                    Spacer().frame(height: 24)
                    OutlinedTextField(label: "last_name", value: $thaiSurnameState)
                    ProfileDetailsHr(label: "personal_info_eng")
                    Text("title").font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_black)
                    HStack {
                        TextField("title", text: $engPrefixState).disabled(true)
                            .padding().background(RoundedRectangle(cornerRadius: 4).stroke(neutral04, lineWidth: 1))
                            .frame(maxWidth: .infinity)
                            .font(.custom("FCIconicRegular", size: 20)).foregroundColor(primary_black)
                        Button(action: {
                            titlePickerEnglish = true
                        }) {
                            Image(systemName: "chevron.down").font(.title2).foregroundColor(primary_black)
                        }.buttonStyle(.plain).padding(.horizontal)
                    }
                    Spacer().frame(height: 24)
                    OutlinedTextField(label: "first_name", value: $engNameState)
                    Spacer().frame(height: 24)
                    OutlinedTextField(label: "middle_name", value: $engMiddleNameState)
                    Spacer().frame(height: 24)
                    OutlinedTextField(label: "last_name", value: $engSurnameState)
                    Spacer().frame(height: 48)
                    Button(action: {
                        if idStringState.isEmpty || idStringState.count == 13 {
                            idString = idStringState
                            thaiPrefix = thaiPrefixState
                            thaiName = thaiNameState
                            thaiMiddleName = thaiMiddleNameState
                            thaiSurname = thaiSurnameState
                            engPrefix = engPrefixState
                            engName = engNameState
                            engMiddleName = engMiddleNameState
                            engSurname = engSurnameState
                            if !birthDateState.isEmpty { birthDate = formatter.string(from: selectedDate) }
                            path.removeLast()
                        } else {
                            error = true
                            withAnimation {
                                proxy.scrollTo(ScrollAnchor.top, anchor: .top)
                            }
                        }
                    }) {
                        Text("save").font(.custom("FCIconicBold", size: 24))
                            .foregroundColor(white)
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .background(primary_gradient)
                            .clipShape(Capsule())
                    }.buttonStyle(.plain)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).padding()
            }.background(white).toolbar {
                ToolbarItem(placement: .principal) {
                    Text("id_card_info").font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
                }
            }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar).sheet(isPresented: $datePicker) {
                    DatePickerSheetView(selectedDate: $selectedDate, datePicker: $datePicker)
                }.sheet(isPresented: $titlePickerThai) {
                    TitlePickerSheetView(title: $titleThai, titlePicker: $titlePickerThai)
                }.sheet(isPresented: $titlePickerEnglish) {
                    TitlePickerSheetView(title: $titleEnglish, titlePicker: $titlePickerEnglish)
                }.onAppear {
                    idStringState = idString
                    thaiPrefixState = thaiPrefix
                    thaiNameState = thaiName
                    thaiMiddleNameState = thaiMiddleName
                    thaiSurnameState = thaiSurname
                    engPrefixState = engPrefix
                    engNameState = engName
                    engMiddleNameState = engMiddleName
                    engSurnameState = engSurname
                    if birthDate.isEmpty {
                        birthDateState = birthDate
                    } else {
                        if let dateFromString = formatter.date(from: birthDate) {
                            selectedDate = dateFromString
                        }
                    }
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
                    error = false
                }.onChange(of: titleThai) { oldValue, newValue in
                    thaiPrefixState = newValue.displayThai
                    engPrefixState = newValue.displayEnglish
                }.onChange(of: titleEnglish) { oldValue, newValue in
                    thaiPrefixState = newValue.displayThai
                    engPrefixState = newValue.displayEnglish
                }.onChange(of: titlePickerThai) { oldValue, newValue in
                    if newValue {
                        thaiPrefixState = titleThai.displayThai
                    }
                }.onChange(of: titlePickerEnglish) { oldValue, newValue in
                    if newValue {
                        engPrefixState = titleEnglish.displayEnglish
                    }
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
    @Binding var datePicker: Bool

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
                    Button("ok") { datePicker = false }
                }
            }
        }
    }
}

struct TitlePickerSheetView: View {
    @Environment(\.locale) private var locale

    @Binding var title: CardTitle
    @Binding var titlePicker: Bool

    var body: some View {
        NavigationStack {
            VStack {
                Picker("title", selection: $title) {
                    if locale.identifier == UserLocale.en.rawValue {
                        ForEach(CardTitle.allCases) { title in
                            Text(title.displayEnglish).tag(title)
                        }
                    } else if locale.identifier == UserLocale.th.rawValue {
                        ForEach(CardTitle.allCases) { title in
                            Text(title.displayThai).tag(title)
                        }
                    }
                }.pickerStyle(.wheel)
            }
            .padding()
            .navigationTitle("title")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("ok") { titlePicker = false }
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
