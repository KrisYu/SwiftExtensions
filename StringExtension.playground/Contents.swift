/**
 [Does Swift have a trim method on String](http://stackoverflow.com/questions/26797739/does-swift-have-a-trim-method-on-string)
 */
import Cocoa

extension String{
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}


print("123    ".trim())

