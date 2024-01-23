//
//  TransformSubtitles.swift
//  Boba Titles
//
//  Created by Joel Tan on 23/1/2024.
//

import Foundation

struct SubtitleLine {
  var startTime: Double
  var endTime: Double
  var contents: String
  var uniqueID = "T" + UUID().uuidString.replacingOccurrences(of: "-", with: "_")
  
  func deltaTime() -> Double {
    return endTime - startTime
  }
}

func getStartAndEndTimes(timeString: String) -> [Double] {
  let times = timeString.components(separatedBy: " --> ")
  
  let timeSeconds = times.map { time in
    var seconds = 0.0
    let timeComponents = time.components(separatedBy: ":")
    seconds += (Double(timeComponents[0]) ?? 0) * 360
    seconds += (Double(timeComponents[1]) ?? 0) * 60
    let secondsComponent = timeComponents[2].replacingOccurrences(of: ",", with: "")
    seconds += (Double(secondsComponent) ?? 0) / 1000
    
    return seconds
  }
  
  return timeSeconds
}

func TransformSubtitles(subtitles: String) -> String {
  let subtitleLineStrings = subtitles.components(separatedBy: "\n\n")
  let subtitleLines: [SubtitleLine] = subtitleLineStrings.compactMap { (line) in
    let lineComponents = line.components(separatedBy: "\n")
    if (lineComponents.indices.contains(2)) {
      let times = getStartAndEndTimes(timeString: lineComponents[1])
      
      return SubtitleLine(startTime: times[0], endTime: times[1], contents: lineComponents[2])
    }
    
    return nil
  }
  
  let componentList = subtitleLines.map({ line in
    return """
    <Rect ref={textRefMap.\(line.uniqueID)} {...rectDefaults}>
      <Txt text={\"\(line.contents)\"} {...textDefaults} />
    </Rect>
    """
  }).joined(separator: "\n")
  
  let animationList = subtitleLines.map({ line in
    return  """
            delay(\(line.startTime), textRefMap.\(line.uniqueID)().y(700, 0).to(400, 0.2)),
            delay(\(line.startTime), textRefMap.\(line.uniqueID)().opacity(1, 0.2)),
            delay(\(line.startTime + line.deltaTime()), textRefMap.\(line.uniqueID)().y(700, 0.2)),
            delay(\(line.startTime + line.deltaTime()), textRefMap.\(line.uniqueID)().opacity(0, 0.2)),
            """
  }).joined(separator: "\n")
  
  let motionCanvasFile = """
  import {makeScene2D, Txt, Rect} from '@motion-canvas/2d';
  import {createRefMap, delay, all} from '@motion-canvas/core';
  
  export default makeScene2D(function* (view) {
    const textRefMap = createRefMap<Rect>()
  
    \(DefaultTextStyle)
    \(DefaultRectStyle)
  
    view.add(
    <>
      \(componentList)
    </>
    );
  
    yield* all(
      \(animationList)
    )
  });
  """
  
  return motionCanvasFile
}
