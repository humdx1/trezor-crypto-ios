import TrezorCryptoC

public struct TrezorCrypto {
    public static func generate(strength: Int) -> String {
        precondition(strength % 32 == 0 && strength >= 128 && strength <= 256)
        let rawString = mnemonic_generate(Int32(strength))!
        return String(cString: rawString)
    }
}
