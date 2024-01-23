//
//  Boba_TitlesApp.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import SwiftUI

@main
struct Boba_TitlesApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(VisualEffect().ignoresSafeArea())
        .preferredColorScheme(.dark)
    }
    .windowStyle(.hiddenTitleBar)
  }
}
