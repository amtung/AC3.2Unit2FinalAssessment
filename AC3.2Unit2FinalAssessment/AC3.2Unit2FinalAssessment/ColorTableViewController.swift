//
//  ColorTableViewController.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Annie Tung on 10/6/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import UIKit

class ColorTableViewController: UITableViewController {
    
    var crayons = [Crayon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for c in crayolaColors {
            if let crayon = Crayon(fromDict: c) {
                crayons.append(crayon)
            }
    }
}

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorIdentifier", for: indexPath)
        //iterate through the array, set cells textlabel.text = crayons name (use that indexPath.row...) Set the cells background color equal to a UIColor with the red, green and blue properties of the crayon
        let crayon = self.crayons[indexPath.row]
        cell.backgroundColor = UIColor(red: CGFloat(crayon.red), green: CGFloat(crayon.green), blue: CGFloat(crayon.blue), alpha: 1.0)
        cell.textLabel?.text = crayon.name
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCrayon = self.crayons[indexPath.row]
        performSegue(withIdentifier: "CrayonNameSegue", sender: selectedCrayon)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CrayonNameSegue" {
            if let colorViewController = segue.destination as? CrayonViewController {
                colorViewController.detailCrayon = sender as? Crayon

            }
        }
    }
}
