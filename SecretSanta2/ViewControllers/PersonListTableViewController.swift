//
//  PersonListTableViewController.swift
//  SecretSanta
//
//  Created by Chris Anderson on 12/20/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func randomButtonPressed(_ sender: Any) {
        PersonController.shared.people.shuffle()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {

        if PersonController.shared.people.count == 1 {
            return 1
        } else {
            return PersonController.shared.people.count / 2
        }
    }
    
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return "Section 1"
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if PersonController.shared.people.count <= 1 {
            return 1
        } else {
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = PersonController.shared.people[indexPath.row]
        
        cell.textLabel?.text = person.name

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? PersonDetailViewController else { return }
            let person = PersonController.shared.people[indexPath.row]
            destinationVC.personLanding = person
        }
    }
}
