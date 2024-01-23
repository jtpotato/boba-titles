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
    ZStack(alignment: .topTrailing) {
      Button(action: {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
      }) {
        Image(systemName: "doc.on.clipboard")
      }
      .padding(8)
      .buttonStyle(CopyButton())
      ScrollView {
        Text("\(text)")
          .frame(maxWidth: .infinity)
          .foregroundColor(.white)
          .monospaced()
          .padding()
          .padding(.trailing, 20)
          .multilineTextAlignment(.leading)
      }
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
  TextDisplay(text: "A lot and a lot of preview text goes here. There should be an entire movie script here. Maybe it could be about bees. And it starts off with a bee...")
    .padding(16)
    .preferredColorScheme(.dark)
}
