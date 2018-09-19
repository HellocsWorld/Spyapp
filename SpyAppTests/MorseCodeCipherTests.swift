
import XCTest
@testable import SpyApp

class MorseCodeCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = MorseCodeCipher()
    }
    
    func test_number_for_secret() {
        let plaintext = "hi"
        
       //the secret part in the morse code cipher is ignored thus any value
       //should not change the output
        let result = cipher.encode(plaintext, secret: "0")
        
        //each letter is converted to morse code follow by space to keep it separated
        XCTAssertEqual("•••• •• ", result)
    }
    
    func test_string_on_secret() {
        let plaintext = "hi"
        
        //the secret part in the morse code cipher is ignored thus any value
        //should not change the output
        let result = cipher.encode(plaintext, secret: "stringhere")
        
        //each letter is converted to morse code follow by space to keep it separated
        XCTAssertEqual("•••• •• ", result)
    }
    
    func test_encode_wrong_value(){
       let plaintext = "h@"

       let result = cipher.encode(plaintext, secret: "")
    
       //each letter is converted to morse code follow by space to keep it separated when an invalid
       // character is encontered it shows "invalid character" for the character only and not for the
       //whole letter.
       XCTAssertEqual("•••• invalid character", result)
    }
    
    func test_decode_value(){
        let plaintext = "--• •-• • •- -"
        
        let result = cipher.decode(plaintext, msg: "")
        
        //each code is converted back to letters follow by space to keep it separated when an invalid
        // character is encontered it shows "invalid character" for the character only and not for the
        //whole letter.
        XCTAssertEqual("G R E A T ", result)
    }
    
    func test_decode_wrong_value(){
        let plaintext = "--• •-• • •- - *"
        
        let result = cipher.decode(plaintext, msg: "")
        
        //each code is converted back to letters follow by space to keep it separated when an invalid
        // character is encontered it shows "invalid character" for the character only and not for the
        //whole letter.
        XCTAssertEqual("G R E A T invalid character", result)
    }
    
    
}
