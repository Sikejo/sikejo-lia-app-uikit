//
//  ListTableViewController.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-04-30.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var items : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registering a UITableViewCell for use in creating new table cells.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named: "HomeColor")
        Task {
            await loadDogBreeds()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appearance = UINavigationBarAppearance()
        // Setting the navigation bar's background color.
        appearance.backgroundColor = UIColor(named: "HomeColor")
        // Applying the appearance settings when the view's edge aligns with the navigation bar's edge.
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Calling the API function
    // Defining an asynchronous function to load dog breeds.
    func loadDogBreeds() async {
        // Try to fetch the list of dog breeds using the shared API manager.
        // If the fetching fails and returns nil, print an error message and exit the function.
        guard let breeds = await APIManager.shared.fetchDogBreeds() else {
            print("Failed to load dog breeds")
            return
        }
        // If fetching is successful, extract the names of the breeds and store them in the 'items' array.
        // The 'map' function is used to transform the array of breed objects into an array of their names.
        self.items = breeds.map { $0.name }
        DispatchQueue.main.async {
            // Reload the table view data to reflect the new list of dog breeds.
            self.tableView.reloadData()
        }
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
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Nunito-Regular", size: 20)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .default
        return cell
    }
    
    // Setting background color for list.
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
    }
    
    // Creating the navigation on cell tap.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetail(forItemAt: indexPath.row)
    }
    
    // Navigating to the detail view. 
    func navigateToDetail(forItemAt index: Int) {
        let detailViewController = DetailViewController(header: items[index])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
