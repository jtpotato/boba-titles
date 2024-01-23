//
//  TransformSubtitles.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

struct SubtitleLine {
  var contents: String
}

func TransformSubtitles(subtitles: String) -> String {
  let subtitleLineStrings = subtitles.components(separatedBy: "\n\n")
  let subtitleLines = subtitleLineStrings.map({ line in
    let lineComponents = line.components(separatedBy: "\n")
    return SubtitleLine(contents: lineComponents[2])
  })
  
  return subtitleLines.map({ line in
    return line.contents
  }).joined(separator: "\n")
}
