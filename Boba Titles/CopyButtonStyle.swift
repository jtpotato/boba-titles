//
//  CopyButtonStyle.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import Foundation
import SwiftUI

struct CopyButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(4)
      .foregroundStyle(.white)
      .background(
        RoundedRectangle(cornerRadius: 4)
          .fill(configuration.isPressed ? .white.opacity(0.1) : .white.opacity(0.05))
      )
  }
}
