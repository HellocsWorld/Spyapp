
import XCTest
@testable import SpyApp

class PhoneCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = PhoneCipher()
    }
    
    func test_secret_with_value() {
        let plaintext = "a"
        
        //the secret part in the phone cipher is ignored thus any value
        //should not change the output
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("21", result)
    }
    
    func test_nonNumericInputForSecret() {
        
        //the secret part in the phone cipher is ignored thus any value
        //should not change the output
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertEqual("22", result)
    }
    
    func test_invalid_value() {
        
        let result = cipher.encode("hell@", secret: "")
        
        XCTAssertEqual("42325353Invalid Character", result)
    }
    
    func test_invalid_number_decode() {
        
        let result = cipher.decode("12", msg: "")
        
        XCTAssertEqual(" invalid number found", result)
    }
    
}
 
