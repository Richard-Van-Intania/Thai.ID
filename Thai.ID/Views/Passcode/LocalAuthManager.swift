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
