//
//  PersonDetailViewController.swift
//  SecretSanta
//
//  Created by Chris Anderson on 12/20/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var personNameLabel: UITextField!
    
    var personLanding: Person? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let name = personNameLabel.text, !name.isEmpty else { return }
        
        if let person = personLanding {
            PersonController.shared.updatePerson(person: person, name: name)
        } else {
            PersonController.shared.createPerson(name: name)
        }
        navigationController?.popViewController(animated: true)
    }
    func updateViews() {
        guard let person = personLanding else { return }
        personNameLabel.text = person.name
    }
}
