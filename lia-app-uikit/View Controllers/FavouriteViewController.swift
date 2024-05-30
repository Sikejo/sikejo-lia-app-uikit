//
//  FavouriteViewController.swift
//  lia-app-uikit
//
//  Created by Filip Henriksson on 2024-05-15.
//

import UIKit

class FavouriteViewController: UITableViewController {
    
    var viewModel: FavouriteViewModel
    
    init(favouriteViewModel: FavouriteViewModel) {
        self.viewModel = favouriteViewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registering a UITableViewCell for use in creating new table cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named: "HomeColor")
        self.navigationItem.title = "Favourites"
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.items[indexPath.row].name
        cell.textLabel?.font = UIFont(name: "Nunito-Regular", size: 20)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Creating the functionality to edit the table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let Dog = viewModel.items[indexPath.row]
            viewModel.remove(Dog)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
