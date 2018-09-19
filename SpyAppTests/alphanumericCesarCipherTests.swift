import XCTest
@testable import SpyApp

class alphanumericCesarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = alphanumericCesarCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "Hello"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext.uppercased(), result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret_decode() {
        let plaintext = "Hello"
        
        let result = cipher.decode(plaintext, msg: "0")
        
        XCTAssertEqual(plaintext.uppercased(), result)
    }
    
    func test_nonNumericInputForSecret_decode() {
        let result = cipher.decode("b", msg: "nonNumericString")
        
        XCTAssertNil(result)
    }
    
    func test_Z_to_0_encode() {
        let result = cipher.encode("z", secret: "1")
        
        XCTAssertEqual("0", result)
    }
    
    func test_9_to_A_encode() {
        let result = cipher.encode("9", secret: "1")
        
        XCTAssertEqual("A", result)
    }
    
    func test_0_to_Z_encode() {
        let result = cipher.encode("0", secret: "-1")
        
        XCTAssertEqual("Z", result)
    }
    
    func test_A_to_9_encode() {
        let result = cipher.encode("a", secret: "-1")
        
        XCTAssertEqual("9", result)
    }
    
    func test_Z_to_0_decode() {
        let result = cipher.decode("0", msg: "1")
        
        XCTAssertEqual("Z", result)
    }
    
    func test_9_to_A_decode() {
        let result = cipher.decode("A", msg: "1")
        
        XCTAssertEqual("9", result)
    }
    
    func test_0_to_Z_decode() {
        let result = cipher.decode("Z", msg: "-1")
        
        XCTAssertEqual("0", result)
    }
    
    func test_A_to_9_decode() {
        let result = cipher.decode("9", msg: "-1")
        
        XCTAssertEqual("A", result)
    }
}
