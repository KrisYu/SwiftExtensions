/**
 
 Take from stack over flow
 [Execute a terminal command from a Cocoa app](http://stackoverflow.com/questions/412562/execute-a-terminal-command-from-a-cocoa-app/32240064#32240064)
 
 In Swift 3.0
 
 - NSPipe has been renamed Pipe
 - NSTask has been renamed Process
 
 
 
 */

import Cocoa


extension String{
    func runAsCommand() -> String {
        let pipe = Pipe()
        let task = Process()
        
        task.launchPath = "/bin/sh"
        task.arguments = ["-c",String(format:"%@", self)]
        task.standardOutput = pipe
        let file = pipe.fileHandleForReading
        task.launch()
        if let result = NSString(data: file.readDataToEndOfFile(), encoding: String.Encoding.utf8.rawValue) {
            return result as String
        } else{
            return "--- Error runing command - Unable to initalize string from file data ---"
        }
    }
}




let input = "echo hello"
let output = input.runAsCommand()

print(output)



func toggleFinderShowAllFiles(_ sender: AnyObject) {
    
    var newSetting = ""
    let readDefaultsCommand = "defaults read com.apple.finder AppleShowAllFiles"
    
    let oldSetting = readDefaultsCommand.runAsCommand()
    
    // Note: the Command results are terminated with a newline character
    
    if (oldSetting == "0\n") { newSetting = "1" }
    else { newSetting = "0" }
    
    let writeDefaultsCommand = "defaults write com.apple.finder AppleShowAllFiles \(newSetting) ; killall Finder"
    
    _ = writeDefaultsCommand.runAsCommand()
    
}

toggleFinderShowAllFiles("a" as AnyObject)
