import SwiftUI

struct CreatePasscodeView: View {
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false
    @EnvironmentObject private var settings: AppSettings
    @Binding var path: NavigationPath
    @Binding var passcodeList: [Int]

    var body: some View {
        VStack {
            Spacer()
            Text("set_up_pin").frame(maxWidth: .infinity).multilineTextAlignment(.center)
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                ForEach(0...5, id: \.self) { index in
                    Indicator(filled: index < passcodeList.count)
                }
            }
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                CircleButton(label: 1, passcode: $passcodeList)
                CircleButton(label: 2, passcode: $passcodeList)
                CircleButton(label: 3, passcode: $passcodeList)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 4, passcode: $passcodeList)
                CircleButton(label: 5, passcode: $passcodeList)
                CircleButton(label: 6, passcode: $passcodeList)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 7, passcode: $passcodeList)
                CircleButton(label: 8, passcode: $passcodeList)
                CircleButton(label: 9, passcode: $passcodeList)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                Button(action: {
                    passcodeList.removeAll()
                }) {
                    Image(systemName: "trash").font(.title2)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
                CircleButton(label: 0, passcode: $passcodeList)
                Button(action: {
                    if !passcodeList.isEmpty {
                        passcodeList.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left").font(.title2)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
            }
            Spacer()
            Button(action: {
                passcodeAsked = true
                settings.isLocalAuth = true
                path = NavigationPath()
            }) {
                Text("skip")
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_darkblue)
            }.buttonStyle(.plain)
            Spacer().frame(height: 16)
        }.navigationBarBackButtonHidden(true).onChange(of: passcodeList) { _, _ in
            if passcodeList.count == 6 {
                path.append(HomeRoute.confirmPasscodeView)
            }
        }
    }
}
