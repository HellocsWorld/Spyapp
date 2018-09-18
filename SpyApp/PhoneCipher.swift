//  PhoneCipher.swift
//  SpyApp
//  Created by Raul Serrano on 9/16/18.

import Foundation

//extension to convert number into array of single digits.
extension BinaryInteger {
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}

struct PhoneCipher: Cipher {
    //dictionary with alphanumeric values
    var dictionary: [String: Int] = ["A": 21, "B": 22, "C": 23, "D": 31, "E": 32, "F": 33, "G": 41, "H": 42, "I": 43, "J": 51, "K": 52, "L": 53, "M": 61, "N": 62, "O": 63, "P": 71, "Q": 72, "R": 73, "S": 74, "T": 81, "U": 82, "V": 83, "W": 91, "X": 92, "Y": 93, "Z": 94, " ": 11]
    
    func encode(_ plaintext: String, secret: String) -> String? {
        let char = plaintext.uppercased()
        var encoded = ""
        
        for letters in char {
            if let letter = dictionary[String(letters)] {
                encoded = encoded + String(letter)
            }else {
                encoded = encoded + "Invalid Character"
            }
        }
        return encoded
    }
    
    //function to decode the message.. only numbers are expected
    func decode(_ txt: String, msg: String) -> String? {
        let num = Int(txt)
        var decoded = ""
        var code = ""
        var count = 0
        
        let num_arr = num!.digits
        for index in num_arr {
            count = count + 1
            code = code + String(index)
            if count == 2 {
                if  let num = dictionary.someKey(forValue: Int(code)!) {
                    decoded = decoded + num
                }else {
                    decoded = decoded + " invalid number found"
                    break
                }
               count = 0
               code = ""
            }
           
            
        }
        return decoded
    }

    
}
