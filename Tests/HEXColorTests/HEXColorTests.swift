import XCTest
@testable import HEXColor

final class HEXColorTests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  /*
   Test cases
   * Minimum: 0x00000000
   * Step:    0x12345678
   * Alpha:   0x123456, alpha = 0.5 (3-digit/6-digit)
   * Maximum: 0xFFFFFFFF
   */
  
  // MARK: - Three-digit
  func testThreeDigitMin() {
    let (red, green, blue, alpha) = UIColor(hex3: 0x000).rgba()
    XCTAssertEqual(red, 0)
    XCTAssertEqual(green, 0)
    XCTAssertEqual(blue, 0)
    XCTAssertEqual(alpha, 0xFF)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#000").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0)
    XCTAssertEqual(g, 0)
    XCTAssertEqual(b, 0)
    XCTAssertEqual(a, 0xFF)
  }
  
  func testThreeDigitStep() {
    let (red, green, blue, alpha) = UIColor(hex3: 0x123, alpha: 0.5).rgba()
    XCTAssertEqual(red, 0x11)
    XCTAssertEqual(green, 0x22)
    XCTAssertEqual(blue, 0x33)
    XCTAssertEqual(alpha, 0xFF / 2)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#123").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0x11)
    XCTAssertEqual(g, 0x22)
    XCTAssertEqual(b, 0x33)
    XCTAssertEqual(a, 0xFF)
  }
  
  func testThreeDigitMax() {
    let (red, green, blue, alpha) = UIColor(hex3: 0xFFF).rgba()
    XCTAssertEqual(red, 0xFF)
    XCTAssertEqual(green, 0xFF)
    XCTAssertEqual(blue, 0xFF)
    XCTAssertEqual(alpha, 0xFF)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#FFF").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0xFF)
    XCTAssertEqual(g, 0xFF)
    XCTAssertEqual(b, 0xFF)
    XCTAssertEqual(a, 0xFF)
  }
  
  // MARK: - Four-digit
  func testFourDigitMin() {
    let (red, green, blue, alpha) = UIColor(hex4: 0x0000).rgba()
    XCTAssertEqual(red, 0)
    XCTAssertEqual(green, 0)
    XCTAssertEqual(blue, 0)
    XCTAssertEqual(alpha, 0)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#0000").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0)
    XCTAssertEqual(g, 0)
    XCTAssertEqual(b, 0)
    XCTAssertEqual(a, 0)
  }
  
  func testFourDigitStep() {
    let (red, green, blue, alpha) = UIColor(hex4: 0x1234).rgba()
    XCTAssertEqual(red, 0x11)
    XCTAssertEqual(green, 0x22)
    XCTAssertEqual(blue, 0x33)
    XCTAssertEqual(alpha, 0x44)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#1234").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0x11)
    XCTAssertEqual(g, 0x22)
    XCTAssertEqual(b, 0x33)
    XCTAssertEqual(a, 0x44)
  }
  
  func testFourDigitMax() {
    let (red, green, blue, alpha) = UIColor(hex4: 0xFFFF).rgba()
    XCTAssertEqual(red, 0xFF)
    XCTAssertEqual(green, 0xFF)
    XCTAssertEqual(blue, 0xFF)
    XCTAssertEqual(alpha, 0xFF)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#FFFF").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0xFF)
    XCTAssertEqual(g, 0xFF)
    XCTAssertEqual(b, 0xFF)
    XCTAssertEqual(a, 0xFF)
    
  }
  
  // MARK: - Six-digit
  func testSixDigitMin() {
    let (red, green, blue, alpha) = UIColor(hex6: 0x000000).rgba()
    XCTAssertEqual(red, 0)
    XCTAssertEqual(green, 0)
    XCTAssertEqual(blue, 0)
    XCTAssertEqual(alpha, 0xFF)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#000000").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0)
    XCTAssertEqual(g, 0)
    XCTAssertEqual(b, 0)
    XCTAssertEqual(a, 0xFF)
  }
  
  func testSixDigitStep() {
    let (red, green, blue, alpha) = UIColor(hex6: 0x123456, alpha: 0.5).rgba()
    XCTAssertEqual(red, 0x12)
    XCTAssertEqual(green, 0x34)
    XCTAssertEqual(blue, 0x56)
    XCTAssertEqual(alpha, 0xFF / 2)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#123456").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0x12)
    XCTAssertEqual(g, 0x34)
    XCTAssertEqual(b, 0x56)
    XCTAssertEqual(a, 0xFF)
  }
  
  func testSixDigitMax() {
    let (red, green, blue, alpha) = UIColor(hex6: 0xFFFFFF).rgba()
    XCTAssertEqual(red, 0xFF)
    XCTAssertEqual(green, 0xFF)
    XCTAssertEqual(blue, 0xFF)
    XCTAssertEqual(alpha, 0xFF)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#FFFFFF").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0xFF)
    XCTAssertEqual(g, 0xFF)
    XCTAssertEqual(b, 0xFF)
    XCTAssertEqual(a, 0xFF)
  }
  
  // MARK: - Eight-digit
  func testEightDigitMin() {
    let (red, green, blue, alpha) = UIColor(hex8: 0x00000000).rgba()
    XCTAssertEqual(red, 0)
    XCTAssertEqual(green, 0)
    XCTAssertEqual(blue, 0)
    XCTAssertEqual(alpha, 0)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#00000000").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0)
    XCTAssertEqual(g, 0)
    XCTAssertEqual(b, 0)
    XCTAssertEqual(a, 0)
  }
  
  func testEightDigitStep() {
    let (red, green, blue, alpha) = UIColor(hex8: 0x12345678).rgba()
    XCTAssertEqual(red, 0x12)
    XCTAssertEqual(green, 0x34)
    XCTAssertEqual(blue, 0x56)
    XCTAssertEqual(alpha, 0x78)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#12345678").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0x12)
    XCTAssertEqual(g, 0x34)
    XCTAssertEqual(b, 0x56)
    XCTAssertEqual(a, 0x78)
  }
  
  func testEightDigitMax() {
    let (red, green, blue, alpha) = UIColor(hex6: 0xFFFFFFFF).rgba()
    XCTAssertEqual(red, 0xFF)
    XCTAssertEqual(green, 0xFF)
    XCTAssertEqual(blue, 0xFF)
    XCTAssertEqual(alpha, 0xFF)
    guard let (r, g, b, a) = try? UIColor(rgba_throws: "#FFFFFFFF").rgba() else {
      XCTAssertTrue(false)
      return
    }
    XCTAssertEqual(r, 0xFF)
    XCTAssertEqual(g, 0xFF)
    XCTAssertEqual(b, 0xFF)
    XCTAssertEqual(a, 0xFF)
  }
  
  // MARK: - String (With error)
  
  func testStringInputErrorMissingHashMarkAsPrefix() {
    do {
      let _ = try UIColor(rgba_throws: "FFFFFFFF")
    } catch PlatformColorInputError.missingHashMarkAsPrefix {
      XCTAssertTrue(true)
    } catch PlatformColorInputError.unableToScanHexValue {
      XCTAssertTrue(false)
    } catch PlatformColorInputError.mismatchedHexStringLength {
      XCTAssertTrue(false)
    } catch {
      XCTAssertTrue(false)
    }
  }
  
  func testStringInputErrorMismatchedHexStringLength() {
    do {
      let _ = try UIColor(rgba_throws: "#FFFFFFF")
    } catch PlatformColorInputError.missingHashMarkAsPrefix {
      XCTAssertTrue(false)
    } catch PlatformColorInputError.unableToScanHexValue {
      XCTAssertTrue(false)
    } catch PlatformColorInputError.mismatchedHexStringLength {
      XCTAssertTrue(true)
    } catch {
      XCTAssertTrue(false)
    }
  }
  
  func testStringInputErrorUnableToScanHexValue() {
    do {
      let _ = try UIColor(rgba_throws: "#ONMPQRST")
    } catch PlatformColorInputError.missingHashMarkAsPrefix {
      XCTAssertTrue(false)
    } catch PlatformColorInputError.unableToScanHexValue {
      XCTAssertTrue(true)
    } catch PlatformColorInputError.mismatchedHexStringLength {
      XCTAssertTrue(false)
    } catch {
      XCTAssertTrue(false)
    }
  }
  
  // MARK: - String (With default color)
  
  func testStringDefaultColor() {
    var color = UIColor("FFFFFFFF")
    XCTAssertEqual(color, UIColor.clear)
    color = UIColor("#FFFFFFF")
    XCTAssertEqual(color, UIColor.clear)
    color = UIColor("#ONMPQRST")
    XCTAssertEqual(color, UIColor.clear)
  }
  
  // MARK: - Hex string output
  
  func testStringOutput() {
    let color = UIColor(red: CGFloat(0x22 / 255.0), green: CGFloat(0x44 / 255.0), blue: CGFloat(0x66 / 255.0), alpha: CGFloat(0x88 / 255.0))
    XCTAssertEqual("#224466", color.hexString(false))
    XCTAssertEqual("#22446688", color.hexString(true))
    
    var hexColor = UIColor("#AABBCCDD", defaultColor: UIColor.yellow);
    XCTAssertEqual("#AABBCC", hexColor.hexString(false))
    XCTAssertEqual("#AABBCCDD", hexColor.hexString(true))
    
    hexColor = UIColor("#273448", defaultColor: UIColor.yellow);
    XCTAssertEqual("#273448", hexColor.hexString(false))
  }
  
  // MARK: - Convert argb string to rgba string
  
  func testArgb2rgba() {
    if let _ = "2468".argb2rgba {} else  {
      XCTAssertTrue(true)
    }
    if let _ = "22446688".argb2rgba {} else  {
      XCTAssertTrue(true)
    }
    if let _ = "#468".argb2rgba {} else  {
      XCTAssertTrue(true)
    }
    if let rgba = "#2468".argb2rgba {
      XCTAssertEqual("#4682", rgba)
      let color = UIColor(rgba)
      XCTAssertEqual(color, UIColor("#4682"))
    }
    
    if let rrggbbaa = "#22446688".argb2rgba {
      XCTAssertEqual("#44668822", rrggbbaa)
      let color = UIColor(rrggbbaa)
      XCTAssertEqual(color, UIColor("#44668822"))
    }
  }
  
  // MARK: - Hex string output for wide display colors
  
  func testWideDisplayColors() {
    let colors = [UIColor(red: 0.1, green: -0.1, blue: 0.1, alpha: 1),
                  UIColor(red: -0.1, green: 0.1, blue: 0.1, alpha: 1),
                  UIColor(red: 0.1, green: 0.1, blue: -0.1, alpha: 1)]
    for color in colors {
      XCTAssertEqual("", color.hexString(false))
      XCTAssertEqual("", color.hexString(true))
      do {
        let _ = try color.hexStringThrows(true)
      } catch PlatformColorInputError.unableToOutputHexStringForWideDisplayColor {
        XCTAssertTrue(true)
      } catch {
        XCTAssertTrue(false)
      }
      do {
        let _ = try color.hexStringThrows(false)
      } catch PlatformColorInputError.unableToOutputHexStringForWideDisplayColor {
        XCTAssertTrue(true)
      } catch {
        XCTAssertTrue(false)
      }
    }
  }
  
  // MARK: - Hex string output for red/green/blue color
  func testRGB() {
    do {
      let redString = try UIColor.red.hexStringThrows(true)
      XCTAssertEqual(redString, UIColor.red.hexString(true))
      
      let greenString = try UIColor.green.hexStringThrows(false)
      XCTAssertEqual(greenString, UIColor.green.hexString(false))
      
      let blueString = try UIColor.blue.hexStringThrows()
      XCTAssertEqual(blueString, UIColor.blue.hexString())
    } catch {
      XCTAssertTrue(false)
    }
  }
}

fileprivate extension UIColor {
  func toUInt8(_ value: CGFloat) -> UInt8 {
    let multiplier = CGFloat(255)
    return UInt8(value * multiplier)
  }
  
  func rgba() -> (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return (toUInt8(red), toUInt8(green), toUInt8(blue), toUInt8(alpha))
  }
}
