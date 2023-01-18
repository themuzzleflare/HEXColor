//
//  Color+Extension.swift
//  
//
//  Created by Paul Tavitian on 15/1/2023.
//

#if arch(arm64) || arch(x86_64)

import SwiftUI

@available(watchOS 6.0, macOS 10.15, iOS 13.0, tvOS 13.0, *)
public extension Color {
  init(hex3: UInt16, alpha: CGFloat = 1) {
    self.init(PlatformColor(hex3: hex3, alpha: alpha))
  }
  
  init(hex4: UInt16) {
    self.init(PlatformColor(hex4: hex4))
  }
  
  init(hex6: UInt32, alpha: CGFloat = 1) {
    self.init(PlatformColor(hex6: hex6, alpha: alpha))
  }
  
  init(hex8: UInt32) {
    self.init(PlatformColor(hex8: hex8))
  }
  
#if os(macOS)
  init(rgba: String, defaultColor: NSColor = .clear) {
    if let platformColor = PlatformColor(rgba, defaultColor: defaultColor) {
      self.init(platformColor)
    } else {
      self.init(defaultColor)
    }
  }
#elseif os(iOS)
  init(rgba: String, defaultColor: UIColor = .clear) {
    self.init(PlatformColor(rgba, defaultColor: defaultColor))
  }
#endif
}

#endif
