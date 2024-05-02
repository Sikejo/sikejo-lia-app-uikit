//
//  ListTableViewController.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-04-30.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    // Creating a list of dummy data.
    // Generates a list of * strings ("Item").
    // .enumerated transforms the array into a sequence of pairs - "Item" and Count.
    // The closure is applied to each element of the enumerated array.
    // This transforms each pair from the enumerated list into a formatted string
    // that includes a sequentially increasing number followed by the value "Item".
    var items: [String] = Array(repeating: "Item", count: 100).enumerated().map { "\($0.0 + 1) - \($0.1)" }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registering a UITableViewCell for use in creating new table cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    // Returning the number of sections in the table - 1.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Returning the number of rows in the section, which is equal to the number of items.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Creating and configuring a cell for each row in the table.  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let myImage = UIImage(systemName: "star.fill")
        cell.imageView?.image = myImage
        cell.textLabel?.text = "Placeholder title"
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }

    // Supporting conditional editing of the table view
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Creating the functionality to edit the table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade
            )
        }
    }
    
    
    // Creating the navigation on cell tap.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetail(forItemAt: indexPath.row)
    }
    
    // Placeholder for the navigation function
    func navigateToDetail(forItemAt index: Int) {
        print("Placeholder for navigation. Item tapped: \(items[index])")
        
    }
    
    
}
