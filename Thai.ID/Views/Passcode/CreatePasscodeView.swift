import SwiftUI

struct CreatePasscodeView: View {
    @Binding var path: NavigationPath
    @State private var passcode: [Int] = []
    var body: some View {
        VStack {
            Text("set_up_pin").frame(maxWidth: .infinity).multilineTextAlignment(.center)
                .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                ForEach(0...5, id: \.self) { index in
                    Indicator(filled: index < passcode.count)
                }
            }
            Spacer().frame(height: 48)
            HStack(spacing: 24) {
                CircleButton(label: 1, passcode: $passcode)
                CircleButton(label: 2, passcode: $passcode)
                CircleButton(label: 3, passcode: $passcode)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 4, passcode: $passcode)
                CircleButton(label: 5, passcode: $passcode)
                CircleButton(label: 6, passcode: $passcode)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                CircleButton(label: 7, passcode: $passcode)
                CircleButton(label: 8, passcode: $passcode)
                CircleButton(label: 9, passcode: $passcode)
            }
            Spacer().frame(height: 24)
            HStack(spacing: 24) {
                Spacer().frame(width: 88, height: 88).contentShape(Circle())
                CircleButton(label: 0, passcode: $passcode)
                Button(action: {
                    if !passcode.isEmpty {
                        passcode.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left").font(.title)
                        .foregroundColor(primary_darkblue)
                        .frame(width: 88, height: 88).contentShape(Circle())
                }.buttonStyle(.plain)
            }
        }.background(white).navigationBarBackButtonHidden(true).onChange(of: passcode) { oldValue, newValue in
            print(passcode)
        }
    }
}
