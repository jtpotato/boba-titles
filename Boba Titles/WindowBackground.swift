//
//  WindowBackground.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import SwiftUI

struct VisualEffect: NSViewRepresentable {
  
  func makeNSView(context: Self.Context) -> NSView {
    let view = NSVisualEffectView()
    
    view.blendingMode = .behindWindow
    view.state = .active
    view.material = .underWindowBackground
    
    return view
  }
  
  func updateNSView(_ nsView: NSView, context: Context) { }
}
