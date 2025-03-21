//
//  LongPressView.swift
//  LongPress
//
//  Created by Douglas Jasper on 2025-03-21.
//

import SwiftUI

struct LongPressView: View {
    @State private var isPressed = false
    @State private var message = "Press and hold!"

    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.title)
                .padding()

            RoundedRectangle(cornerRadius: 20)
                .fill(isPressed ? Color.green : Color.blue)
                .frame(width: 200, height: 100)
                .overlay(
                    Text("Long Press Me")
                        .foregroundColor(.white)
                        .bold()
                )
                .scaleEffect(isPressed ? 1.2 : 1.0)
                .animation(.spring(), value: isPressed)
                .onLongPressGesture(minimumDuration: 1.0, pressing: { isPressing in
                    isPressed = isPressing
                }) {
                    message = "Long Press Detected!"
                }
        }
        .padding()
    }
}

#Preview {
    LongPressView()
}
