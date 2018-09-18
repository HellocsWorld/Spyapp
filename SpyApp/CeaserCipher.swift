//Author: Raul A Serrano Hernandez
//CSC 690
//Spyapp to encrypt and decrept messages 

import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decode(_ txt: String, msg: String) -> String?
}

//alphanumeric cipher
struct alphanumericCesarCipher: Cipher {
    
    let char = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    //function to encrypt the message
    func encode(_ plaintext: String, secret: String) -> String? {
        let charact = plaintext.uppercased()
        guard let shiftby = Int(secret) else {
            return nil
        }
        var encoded = ""
        var count: Int = 0
        
        for character in charact {
            count = 0
            for index in char {
                if index == String(character) {
                    //go back to 0 if greater than 0
                    if count + shiftby > 35 {
                        count = (count + shiftby) - 36
                        break
                    }
                        //go back to Z if less than 0
                    else if count + shiftby < 0 {
                        count = (count + shiftby) + 36
                        break
                    }
                    else{
                        count = count + shiftby
                        break
                    }
                    
                }else if index != String(character) && count == 36 {
                    break
                } else {
                    count = count + 1
                }
                
            }
            if count != 36 {
                //append new character to string
                encoded = encoded + String(char[count])
            }
        }
        return encoded
    }
    
    //function to decrypt ther message
    func decode(_ txt: String, msg: String) -> String? {
        //convert the string to uppercase letters only
        let charact = txt.uppercased()
        guard let shiftby = Int(msg) else {
            return nil
        }
        var decoded = ""
        var count: Int = 0
        
        
        for character in charact {
            count = 0
            for index in char {
                if index == String(character) {
                    //if value is greater than 35 go back to 0
                    if count - shiftby > 35 {
                        count =  (count - shiftby) - 36
                        break
                    }
                    //if value is less than 0 go back to 35 or Z
                    else if count - shiftby < 0 {
                        count = (count - shiftby) + 36
                        break
                    }
                    else{
                        count = count - shiftby
                        break
                    }
                    
                }else if index != String(character) && count == 36{
                    break
                }else{
                    count = count + 1
                }
                
            }
            if count != 36 {
                decoded = decoded + String(char[count])
            }
        }
        return decoded
    }
    
}


struct CeaserCipher: Cipher {
    //function to encrypt the message
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        guard let shiftBy = UInt32(secret) else {
            return nil
        }

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    //function to decrypt the message
    func decode(_ txt: String, msg: String) -> String? {
        var decoded = ""
        guard let shiftBack = UInt32(msg) else {
            return nil
        }
        
        for char in txt {
            let unicode = char.unicodeScalars.first!.value
            let backShiftUnicode = unicode - shiftBack
            let shiftChar = String(UnicodeScalar(UInt8(backShiftUnicode)))
            decoded = decoded + shiftChar
        }
        return decoded
    }
}
