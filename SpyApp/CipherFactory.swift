import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "A#C": alphanumericCesarCipher(),
        "MorseC": MorseCodeCipher() as Cipher,
        "PhoneC": PhoneCipher() as Cipher
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
