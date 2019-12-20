//
//  File.swift
//  SecretSanta2
//
//  Created by Chris Anderson on 12/20/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import Foundation

class Person: Codable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}
