//
//  command.swift
//  ReEnroller
//
//  Created by Leslie Helou on 9/27/18.
//  Copyright © 2018 Leslie Helou. All rights reserved.
//

import Foundation

class command {
    
    // function to return exit code of bash command - start
    func myExitCode(cmd: String, args: String...) -> Int8 {
        //var pipe_pkg = Pipe()
        let task_pkg = Process()
        
        task_pkg.launchPath = cmd
        task_pkg.arguments = args
        //task_pkg.standardOutput = pipe_pkg
        //var test = task_pkg.standardOutput
        
        task_pkg.launch()
        task_pkg.waitUntilExit()
        let result = task_pkg.terminationStatus
        
        return(Int8(result))
    }
    // function to return exit code of bash command - end
    
    // function to return value of bash command - start
    func myExitValue(cmd: String, args: String...) -> [String] {
        var status  = [String]()
        let pipe    = Pipe()
        let task    = Process()
        
        task.launchPath     = cmd
        task.arguments      = args
        task.standardOutput = pipe
        //        let outputHandle    = pipe.fileHandleForReading
        
        task.launch()
        
        let outdata = pipe.fileHandleForReading.readDataToEndOfFile()
        if var string = String(data: outdata, encoding: .utf8) {
            string = string.trimmingCharacters(in: .newlines)
            status = string.components(separatedBy: "\n")
        }
        
        task.waitUntilExit()
        
        //        print("status: \(status)")
        return(status)
    }
    // function to return value of bash command - end
    
}
