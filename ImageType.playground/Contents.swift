import Cocoa
import ImageIO

// MARK: - Image format
struct ImageHeaderData {
    static var PNG: [UInt8] = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]
    static var JPEG_SOI: [UInt8] = [0xFF, 0xD8]
    static var JPEG_IF: [UInt8] = [0xFF]
    static var GIF: [UInt8] = [0x47, 0x49, 0x46]
}


enum ImageFormat{
    case Unknown, PNG, JPEG, GIF
}


extension NSData{
    var imageFormat: ImageFormat{
        var buffer = [UInt8](repeating: 0, count: 8)
        self.getBytes(&buffer, range: NSRange(location: 0,length: 8))
        if buffer == ImageHeaderData.PNG
        {
            return .PNG
        } else if buffer[0] == ImageHeaderData.JPEG_SOI[0] && buffer[1] == ImageHeaderData.JPEG_SOI[1] && buffer[2] == ImageHeaderData.JPEG_IF[2]
        {
            return .JPEG
        } else if buffer[0] == ImageHeaderData.GIF[0] && buffer[1] == ImageHeaderData.GIF[1] && buffer[2] == ImageHeaderData.GIF[2]
        {
            return .GIF
        }
        return .Unknown
    }
}




let fileURL = Bundle.main.url(forResource: "oitnb", withExtension: "gif")

let imageData = NSData(contentsOf: fileURL!)
print(imageData!.imageFormat)



