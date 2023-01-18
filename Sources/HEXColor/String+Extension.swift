//
//  String+Extension.swift
//  
//
//  Created by Paul Tavitian on 15/1/2023.
//

import Foundation

public extension String {
  /// Convert argb string to rgba string.
  var argb2rgba: String? {
    guard self.hasPrefix("#") else {
      return nil
    }
    
    let hexString: String = String(self[self.index(self.startIndex, offsetBy: 1)...])
    switch hexString.count {
    case 4:
      return "#\(String(hexString[self.index(self.startIndex, offsetBy: 1)...]))\(String(hexString[..<self.index(self.startIndex, offsetBy: 1)]))"
    case 8:
      return "#\(String(hexString[self.index(self.startIndex, offsetBy: 2)...]))\(String(hexString[..<self.index(self.startIndex, offsetBy: 2)]))"
    default:
      return nil
    }
  }
}
