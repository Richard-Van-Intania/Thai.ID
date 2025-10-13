import BCryptSwift
import SwiftUI

struct EnterPasscodeLoginView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("useBiometric") private var useBiometric: Bool = false

    @Binding var path: NavigationPath
    @Binding var isLocalAuth: Bool
    @Binding var passcodeList: [Int]

    @State private var isInvalid = false
    @State private var shakeCount = 0
    @State private var verifyPasscodeFailedDialog: Bool = false

    var body: some View {
        VStack {
            Text("enter_pin").frame(maxWidth: .infinity).multilineTextAlignment(.center)
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                ForEach(0 ... 5, id: \.self) { index in
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
                if useBiometric {
                    Button(action: {
                        authenticateWithBiometrics(completion: { success, _ in
                            if success {
                                isInvalid = false
                                isLocalAuth = true
                                path = NavigationPath()
                            } else {
                                isInvalid = true
                                isLocalAuth = false
                                passcodeList.removeAll()
                            }
                        })
                    }) {
                        Image(systemName: "faceid").font(.title2)
                            .foregroundColor(primary_darkblue)
                            .frame(width: 88, height: 88).contentShape(Circle())
                    }.buttonStyle(.plain)
                } else {
                    Button(action: {
                        passcodeList.removeAll()
                    }) {
                        Image(systemName: "trash").font(.title2)
                            .foregroundColor(primary_darkblue)
                            .frame(width: 88, height: 88).contentShape(Circle())
                    }.buttonStyle(.plain)
                }
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
        }.navigationBarBackButtonHidden(true).onChange(of: passcodeList) { _, _ in
            if passcodeList.count == 6 {
                var concatenationPasscode = ""
                for pc in passcodeList {
                    concatenationPasscode += String(pc)
                }
                do {
                    let isValid = try BCryptSwiftModern.verifyPassword(concatenationPasscode, matchesHash: passcode)
                    if isValid {
                        isInvalid = false
                        isLocalAuth = true
                        path = NavigationPath()
                    } else {
                        isInvalid = true
                        isLocalAuth = false
                        passcodeList.removeAll()
                    }
                } catch {
                    isInvalid = true
                    isLocalAuth = false
                    passcodeList.removeAll()
                    verifyPasscodeFailedDialog = true
                }
            }
        }.alert(
            "wrong",
            isPresented: $verifyPasscodeFailedDialog,
            actions: {
                Button("ok", role: .none) {}
            },
        ).onDisappear {
            passcodeList.removeAll()
        }
    }
}
