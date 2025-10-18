import BCryptSwift
import SwiftUI

struct EnterPasscodeLoginView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("useBiometric") private var useBiometric: Bool = false

    @EnvironmentObject private var settings: AppSettings
    @ObservedObject var passcodeModel: PasscodeModel

    @Binding var path: NavigationPath

    @State private var isInvalid = false
    @State private var shakeCount = 0
    @State private var verifyPasscodeFailedDialog: Bool = false

    var body: some View {
        VStack {
            Text("enter_pin").frame(maxWidth: .infinity).multilineTextAlignment(.center)
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                ForEach(0...5, id: \.self) { index in
                    Indicator(filled: index < passcodeModel.passcodeList.count)
                }
            }.modifier(Shake(animatableData: CGFloat(shakeCount)))
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                CircleButton(label: 1, onButtonTap: { passcodeModel.passcodeAdd(code: 1) })
                CircleButton(label: 2, onButtonTap: { passcodeModel.passcodeAdd(code: 2) })
                CircleButton(label: 3, onButtonTap: { passcodeModel.passcodeAdd(code: 3) })
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 4, onButtonTap: { passcodeModel.passcodeAdd(code: 4) })
                CircleButton(label: 5, onButtonTap: { passcodeModel.passcodeAdd(code: 5) })
                CircleButton(label: 6, onButtonTap: { passcodeModel.passcodeAdd(code: 6) })
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 7, onButtonTap: { passcodeModel.passcodeAdd(code: 7) })
                CircleButton(label: 8, onButtonTap: { passcodeModel.passcodeAdd(code: 8) })
                CircleButton(label: 9, onButtonTap: { passcodeModel.passcodeAdd(code: 9) })
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                if useBiometric {
                    Button(action: {
                        authenticateWithBiometrics(completion: { success, _ in
                            if success {
                                authPassed()
                            } else {
                                authFailed()
                            }
                        })
                    }) {
                        Image(systemName: "faceid").font(.title2)
                            .foregroundColor(primary_darkblue)
                            .frame(width: 88, height: 88).contentShape(Circle())
                    }.buttonStyle(.plain)
                } else {
                    Button(action: {
                        passcodeModel.passcodeRestart()
                    }) {
                        Image(systemName: "trash").font(.title2)
                            .foregroundColor(primary_darkblue)
                            .frame(width: 88, height: 88).contentShape(Circle())
                    }.buttonStyle(.plain)
                }
                CircleButton(label: 0, onButtonTap: { passcodeModel.passcodeAdd(code: 0) })
                Button(action: {
                    passcodeModel.passcodePop()
                }) {
                    Image(systemName: "delete.left").font(.title2)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
            }
        }.navigationBarBackButtonHidden(true).alert(
            "wrong",
            isPresented: $verifyPasscodeFailedDialog,
            actions: {
                Button("ok", role: .none) {}
            },
        ).onDisappear {
            passcodeModel.allRestart()
        }.onChange(of: passcodeModel.passcodeList) { oldValue, newValue in
            if oldValue.count == 5 && newValue.count == 6 {
                let concatenationPasscode = passcodeModel.passcodeConcatenation()
                if !concatenationPasscode.isEmpty {
                    do {
                        let isValid = try BCryptSwiftModern.verifyPassword(concatenationPasscode, matchesHash: passcode)
                        if isValid {
                            authPassed()
                        } else {
                            authFailed()
                        }
                    } catch {
                        authFailed()
                        verifyPasscodeFailedDialog = false
                    }
                } else {
                    authFailed()
                }
            }
        }
    }

    func authFailed() {
        isInvalid = true
        withAnimation(.default) {
            shakeCount += 1
        }
        passcodeModel.passcodeRestart()
    }

    func authPassed() {
        isInvalid = false
        settings.isLocalAuth = true
        path = NavigationPath()
    }
}
