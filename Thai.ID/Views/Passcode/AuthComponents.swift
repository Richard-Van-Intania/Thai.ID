import Combine
import LocalAuthentication
import SwiftUI

let reason = "Unlock using Face ID or Touch ID"

func authenticateWithBiometrics(completion: @escaping (Bool, Error?) -> Void) {
    let context = LAContext()
    var error: NSError?

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            DispatchQueue.main.async {
                completion(success, authenticationError)
            }
        }
    } else {
        completion(false, error)
    }
}

struct Indicator: View {
    let filled: Bool

    var body: some View {
        Circle().fill(filled ? primary_darkblue : white).strokeBorder(primary_darkblue, lineWidth: 1).frame(width: 16, height: 16)
    }
}

struct CircleButton: View {
    let label: Int
    let onButtonTap: VoidCallback

    var body: some View {
        Button(action: onButtonTap) {
            Text(String(label)).font(.custom("FCIconicBold", size: 28)).foregroundColor(primary_darkblue).frame(width: 88, height: 88).background(
                Circle().stroke(primary_darkblue, lineWidth: 1),
            ).contentShape(Circle())
        }.buttonStyle(.plain)
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

class PasscodeModel: ObservableObject {
    @Published var passcodeList: [Int] = []
    @Published var passcodeConfirmList: [Int] = []

    func passcodeAdd(code: Int) {
        if passcodeList.count < 6 { passcodeList.append(code) }
    }

    func confirmAdd(code: Int) {
        if passcodeConfirmList.count < 6 { passcodeConfirmList.append(code) }
    }

    func passcodePop() {
        if !passcodeList.isEmpty {
            passcodeList.removeLast()
        }
    }

    func confirmPop() {
        if !passcodeConfirmList.isEmpty {
            passcodeConfirmList.removeLast()
        }
    }

    func passcodeRestart() {
        passcodeList.removeAll()
    }

    func confirmRestart() {
        passcodeConfirmList.removeAll()
    }

    func allRestart() {
        passcodeList.removeAll()
        passcodeConfirmList.removeAll()
    }

    func isPasscodeFull() -> Bool {
        return passcodeList.count == 6
    }

    func isConfirmFull() -> Bool {
        return passcodeConfirmList.count == 6
    }

    func validate() -> String {
        if isPasscodeFull() && isConfirmFull() && passcodeList == passcodeConfirmList {
            var concatenationPasscode = ""
            for pc in passcodeList {
                concatenationPasscode += String(pc)
            }
            return concatenationPasscode.count == 6 ? concatenationPasscode : ""
        } else {
            return ""
        }

    }

    func passcodeConcatenation() -> String {
        if isPasscodeFull() {
            var concatenationPasscode = ""
            for pc in passcodeList {
                concatenationPasscode += String(pc)
            }
            return concatenationPasscode.count == 6 ? concatenationPasscode : ""
        } else {
            return ""
        }

    }

}
