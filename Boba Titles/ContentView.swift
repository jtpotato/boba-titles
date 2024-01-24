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
    VStack {
      Button("Open Subtitle File") {
        openFileDialog = true
      }
      .buttonStyle(.borderless)
      .foregroundStyle(.white)
      .padding(.horizontal, 12)
      .padding(.vertical, 8)
      .background(
        RoundedRectangle(cornerRadius: 8)
          .fill(.blue.opacity(0.5))
      )
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
    .navigationTitle("🧋 Boba Titles")
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  ContentView()
    .preferredColorScheme(.dark)
}
