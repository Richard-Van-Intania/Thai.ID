import BCryptSwift
import SwiftUI

struct ConfirmNewPasscodeView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false
    @AppStorage("usePasscode") private var usePasscode: Bool = false

    @EnvironmentObject private var settings: AppSettings
    @ObservedObject var passcodeModel: PasscodeModel

    @Binding var path: NavigationPath

    @State private var isInvalid = false
    @State private var shakeCount = 0
    @State private var storePasscodeFailedDialog: Bool = false

    var body: some View {
        VStack {
            Spacer()
            Text("set_up_pin_confirm").frame(maxWidth: .infinity).multilineTextAlignment(.center)
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                ForEach(0...5, id: \.self) { index in
                    Indicator(filled: index < passcodeModel.passcodeConfirmList.count)
                }
            }.modifier(Shake(animatableData: CGFloat(shakeCount)))
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                CircleButton(label: 1, onButtonTap: { passcodeModel.confirmAdd(code: 1) })
                CircleButton(label: 2, onButtonTap: { passcodeModel.confirmAdd(code: 2) })
                CircleButton(label: 3, onButtonTap: { passcodeModel.confirmAdd(code: 3) })
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 4, onButtonTap: { passcodeModel.confirmAdd(code: 4) })
                CircleButton(label: 5, onButtonTap: { passcodeModel.confirmAdd(code: 5) })
                CircleButton(label: 6, onButtonTap: { passcodeModel.confirmAdd(code: 6) })
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 7, onButtonTap: { passcodeModel.confirmAdd(code: 7) })
                CircleButton(label: 8, onButtonTap: { passcodeModel.confirmAdd(code: 8) })
                CircleButton(label: 9, onButtonTap: { passcodeModel.confirmAdd(code: 9) })
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                Button(action: {
                    passcodeModel.confirmRestart()
                }) {
                    Image(systemName: "trash").font(.title2)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
                CircleButton(label: 0, onButtonTap: { passcodeModel.confirmAdd(code: 0) })
                Button(action: {
                    passcodeModel.confirmPop()
                }) {
                    Image(systemName: "delete.left").font(.title2)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
            }
            Spacer()
            Button(action: {
                cancel()
            }) {
                Text("cancel")
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_darkblue)
            }.buttonStyle(.plain)
            Spacer().frame(height: 16)
        }.alert(
            "wrong",
            isPresented: $storePasscodeFailedDialog,
            actions: {
                Button("ok", role: .none) {
                    cancel()
                }
            },
        ).onDisappear {
            passcodeModel.allRestart()
        }.onChange(of: passcodeModel.passcodeConfirmList) { oldValue, newValue in
            if oldValue.count == 5 && newValue.count == 6 {
                let concatenationPasscode = passcodeModel.validate()
                if !concatenationPasscode.isEmpty {
                    isInvalid = false
                    do {
                        let generatedSalt: String = try BCryptSwiftModern.generateSalt()
                        let hashedPasscode: String = try BCryptSwiftModern.hashPassword(concatenationPasscode, withSalt: generatedSalt)
                        passcode = hashedPasscode
                        passcodeAsked = true
                        usePasscode = true
                        settings.isLocalAuth = true
                        path.removeLast()
                        path.removeLast()
                    } catch {
                        authFailed()
                        storePasscodeFailedDialog = true
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
        passcodeModel.confirmRestart()
    }

    func cancel() {
        passcodeAsked = true
        usePasscode = false
        settings.isLocalAuth = true
        path.removeLast()
        path.removeLast()
    }
}
