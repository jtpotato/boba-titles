//
//  ContentView.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import SwiftUI

struct ContentView: View {
  @State var subtitleContents = "// placeholder text"
  @State var openFileDialog = false
  
  var body: some View {
    Text("Boba Titles")
      .fontWeight(.semibold)
      .padding(.top, 6)
      .ignoresSafeArea()
    
    VStack {
      Button("Open Subtitle File") {
        openFileDialog = true
      }
      .fileImporter(
        isPresented: $openFileDialog,
        allowedContentTypes: [.text],
        allowsMultipleSelection: false,
        onCompletion: { result in
          switch result {
          case .success(let url):
            subtitleContents = ReadSubtitleFile(fileURLs: url)
          case .failure(let error):
            print(error)
          }
        }
      )
      HStack {
        TextDisplay(text: subtitleContents)
        TextDisplay(text: TransformSubtitles(subtitles: subtitleContents))
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  ContentView()
    .preferredColorScheme(.dark)
}
