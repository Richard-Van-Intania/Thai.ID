import SwiftUI

struct Indicator: View {
    let filled: Bool

    var body: some View {
        Circle()
            .fill(filled ? primary_darkblue : white)
            .strokeBorder(primary_darkblue, lineWidth: 1)
            .frame(width: 16, height: 16)
    }
}

struct CircleButton: View {
    let label: Int
    @Binding var passcode: [Int]

    var body: some View {
        Button(action: {
            if passcode.count < 6 { passcode.append(label) }
        }) {
            Text(String(label)).font(.custom("FCIconicBold", size: 28))
                .foregroundColor(primary_darkblue)
                .frame(width: 88, height: 88)
                .background(
                    Circle()
                        .stroke(primary_darkblue, lineWidth: 1)
                ).contentShape(Circle())
        }.buttonStyle(.plain)
    }
}
