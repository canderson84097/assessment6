//
//  PersonController.swift
//  SecretSanta
//
//  Created by Chris Anderson on 12/20/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import Foundation

class PersonController {
    
    static let shared = PersonController()
    
    var people: [Person] = []
    
    // MARK: - CRUD
    
    func createPerson(name: String) {
        let newPerson = Person(name: name)
        people.insert(newPerson, at: 0)
        saveToPersistentStore()
    }
    
    func updatePerson(person: Person, name: String) {
        person.name = name
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "SecretSanta.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(people)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }
    
    func loadToPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let people = try decoder.decode([Person].self, from: data)
            self.people = people
        }catch let error {
            print(error)
        }
    }
}
