//
//  PlatformColorInputError.swift
//  
//
//  Created by Paul Tavitian on 15/1/2023.
//

import Foundation

public enum PlatformColorInputError: LocalizedError {
  case missingHashMarkAsPrefix(String)
  case unableToScanHexValue(String)
  case mismatchedHexStringLength(String)
  case unableToOutputHexStringForWideDisplayColor
  
  public var errorDescription: String? {
    switch self {
    case let .missingHashMarkAsPrefix(hex):
      return "Invalid RGB string, missing '#' as prefix in \(hex)"
    case let .unableToScanHexValue(hex):
      return "Scan \(hex) error"
    case let .mismatchedHexStringLength(hex):
      return "Invalid RGB string from \(hex), number of characters after '#' should be either 3, 4, 6 or 8"
    case .unableToOutputHexStringForWideDisplayColor:
      return "Unable to output hex string for wide display color"
    }
  }
}
