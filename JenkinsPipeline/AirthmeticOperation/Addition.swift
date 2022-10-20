//
//  Addition.swift
//  AirthmeticOperation
//
//  Created by manjuprashanth s on 26/08/22.
//

import Foundation

public class Addition {
    
    public init() {}
    
    public func add<T: Numeric>(number1: T, number2: T) -> T {
        return number1 + number2
    }
}
