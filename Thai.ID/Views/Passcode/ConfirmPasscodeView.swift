import BCryptSwift
import SwiftUI

struct ConfirmPasscodeView: View {
    @AppStorage("passcode") private var passcode: String = ""
    @AppStorage("passcodeAsked") private var passcodeAsked: Bool = false

    @Binding var path: NavigationPath
    @Binding var isLocalAuth: Bool
    @Binding var passcodeList: [Int]
    @Binding var passcodeConfirmList: [Int]

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
                ForEach(0 ... 5, id: \.self) { index in
                    Indicator(filled: index < passcodeConfirmList.count)
                }
            }.modifier(Shake(animatableData: CGFloat(shakeCount)))
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                CircleButton(label: 1, passcode: $passcodeConfirmList)
                CircleButton(label: 2, passcode: $passcodeConfirmList)
                CircleButton(label: 3, passcode: $passcodeConfirmList)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 4, passcode: $passcodeConfirmList)
                CircleButton(label: 5, passcode: $passcodeConfirmList)
                CircleButton(label: 6, passcode: $passcodeConfirmList)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 7, passcode: $passcodeConfirmList)
                CircleButton(label: 8, passcode: $passcodeConfirmList)
                CircleButton(label: 9, passcode: $passcodeConfirmList)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                Button(action: {
                    passcodeConfirmList.removeAll()
                }) {
                    Image(systemName: "trash").font(.title2)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
                CircleButton(label: 0, passcode: $passcodeConfirmList)
                Button(action: {
                    if !passcodeConfirmList.isEmpty {
                        passcodeConfirmList.removeLast()
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
                isLocalAuth = true
                path = NavigationPath()
            }) {
                Text("skip")
                    .font(.custom("FCIconicBold", size: 20)).foregroundColor(primary_darkblue)
            }.buttonStyle(.plain)
            Spacer().frame(height: 16)
        }.onChange(of: passcodeConfirmList) { _, _ in
            if passcodeConfirmList.count == 6 {
                if passcodeConfirmList == passcodeList {
                    isInvalid = false
                    passcodeAsked = true
                    isLocalAuth = true
                    var concatenationPasscode = ""
                    for pc in passcodeConfirmList {
                        concatenationPasscode += String(pc)
                    }
                    do {
                        let generatedSalt: String = try BCryptSwiftModern.generateSalt()
                        let hashedPasscode: String = try BCryptSwiftModern.hashPassword(concatenationPasscode, withSalt: generatedSalt)
                        passcode = hashedPasscode
                        path.append(HomeRoute.authenticationSuccessView)
                    } catch {
                        passcodeAsked = false
                        passcode = ""
                        storePasscodeFailedDialog = true
                    }
                } else {
                    passcodeConfirmList.removeAll()
                    isInvalid = true
                    withAnimation(.default) {
                        shakeCount += 1
                    }
                }
            }
        }.alert(
            "wrong",
            isPresented: $storePasscodeFailedDialog,
            actions: {
                Button("ok", role: .none) {
                    path = NavigationPath()
                }
            },
        ).onDisappear {
            passcodeList.removeAll()
            passcodeConfirmList.removeAll()
        }
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size _: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX:
                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                y: 0,
            ),
        )
    }
}
