//
//  main.swift
//  Hashids
//
//  Created by Ricki on 2022/2/6.
//

import Foundation
import ArgumentParser

@main
struct hashids: ParsableCommand {
    
    static var configuration: CommandConfiguration = CommandConfiguration(commandName: "Hashids")
    @Flag(help: "TEST output")
    var test = false
    
    @Argument(help: "The salt phrase.")
    var salt: String
    @Argument(help: "The numbers.")
    var values: [Int]

    mutating func run() throws {

        
        guard let result = Hashids(salt: salt).encode(values) else {
            hashids.exit(withError: ExitCode.failure)
            }
        print("\(result)")
        
        
        //test
        if(test){
            if let tess = Hashids(salt: "salt").encode(1,2) {
                print("Hashids salt 1 2 should be: \(tess)")
            }else{
                hashids.exit(withError: ExitCode.failure)
            }
        }
        
    }
}
