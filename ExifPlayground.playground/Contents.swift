import ImageIO
import UIKit

let fileURL = Bundle.main.url(forResource: "IMG_6042", withExtension: "JPG")

if let imageSource = CGImageSourceCreateWithURL(fileURL as! CFURL, nil) {
    let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil)
    //    print(imageProperties)
    if let dict = imageProperties as? [String: Any] {
        print(dict[kCGImagePropertyExifDictionary as String]!)
    }
}