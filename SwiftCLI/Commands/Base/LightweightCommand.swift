//
//  LightweightCommand.swift
//  SwiftCLI
//
//  Created by Jake Heiser on 7/25/14.
//  Copyright (c) 2014 jakeheis. All rights reserved.
//

import Foundation

public class LightweightCommand: OptionCommandType {
    
    public var commandName: String = ""
    public var commandSignature: String = ""
    public var commandShortDescription: String = ""
    public var commandShortcut: String? = nil
    
    public var failOnUnrecognizedOptions = true
    public var unrecognizedOptionsPrintingBehavior: UnrecognizedOptionsPrintingBehavior = .PrintAll
    
    public typealias ExecutionBlock = (arguments: CommandArguments) throws -> ()
    public typealias OptionsSetupBlock = (command: OptionCommandType, options: Options) -> ()
    
    public var executionBlock: ExecutionBlock? = nil
    public var optionsSetupBlock: OptionsSetupBlock? = nil
    
    public init(commandName: String) {
        self.commandName = commandName
    }
    
    public func setupOptions(options: Options) {
        optionsSetupBlock?(command: self, options: options)
    }
    
    public func execute(arguments arguments: CommandArguments) throws {
        try executionBlock?(arguments: arguments)
    }
    
}
