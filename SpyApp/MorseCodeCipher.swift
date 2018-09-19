//
//  MorseCodeCipher.swift
//  SpyApp
//
//  Created by Raul Serrano on 9/15/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

//the extension returns all keys for a value specified.
extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}

struct MorseCodeCipher: Cipher {
    var dic: [String: String] = ["A": "•-", "B": "-•••", "C": "-•-•", "D": "-••", "E": "•", "F": "••-•", "G": "--•", "H": "••••", "I": "••", "J": "•---", "K": "-•-", "L": "•-••", "M": "--", "N": "-•", "O": "---", "P": "•--•", "Q": "--•-", "R": "•-•", "S": "•••", "T": "-", "U": "••-", "V": "•••-", "W": "•--", "X": "-••-", "Y": "-•--", "Z": "--••", "1": "•----", "2": "••---", "3": "•••--", "4": "••••-", "5": "•••••", "6": "-••••", "7": "--•••", "8": "---••", "9": "----•", "0": "-----", ".": "•-•-•-", ",": "--••--", "?": "••--••", "'": "•----•", "!": "-•-•--", "/": "-••-•", " ": "/"]
    
    //function to encrypt the message
    func encode(_ plaintext: String, secret: String) -> String? {
        let charact = plaintext.uppercased()
        var encoded = ""
       
        for letters in charact {
                if  let letter = dic[String(letters)] {
                    encoded = encoded + letter + " "
                }else {
                    encoded = encoded + "invalid character"
            }
            
        }
        return encoded
    }
    //function to decrypt the message
    func decode(_ txt: String, msg: String) -> String? {
        let charact = txt.components(separatedBy: " ")
        var decoded = ""
        
        for code in charact {
            if  let letter = dic.someKey(forValue: code) {
                decoded = decoded + letter + " "
            }else {
                decoded = decoded + "invalid character"
            }
        }
        return decoded
      }
}
