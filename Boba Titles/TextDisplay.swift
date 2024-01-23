//
//  TextDisplay.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import SwiftUI

struct TextDisplay: View {
  let text: String
  
  var body: some View {
    ScrollView {
      Text("\(text)")
        .foregroundColor(.white)
        .monospaced()
        .frame(minWidth: 200)
        .padding()
        .multilineTextAlignment(.leading)
    }
    .background(
      RoundedRectangle(cornerRadius: 8)
        .fill(.white.opacity(0.05))
        .stroke(.white.opacity(0.1))
    )
    .padding(32)
  }
}

#Preview {
  TextDisplay(text: "This is a test.")
    .padding(16)
    .preferredColorScheme(.dark)
}
