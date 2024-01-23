//
//  OpenSubtitleFile.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import AppKit

func ReadSubtitleFile(fileURLs: [URL]) -> String {
  guard let fileURL = fileURLs.first else {
    return "<no files selected>"
  }
  
  if fileURL.startAccessingSecurityScopedResource() {
    let filePath = fileURL.path(percentEncoded: false)
    
    do {
      let contents = try String(contentsOfFile: filePath)
      fileURL.stopAccessingSecurityScopedResource()
      return contents
    }
    catch let error {
      print(error)
      fileURL.stopAccessingSecurityScopedResource()
      return "<\(error)>"
    }
  }
  
  return "<none, check console logs>"
}
