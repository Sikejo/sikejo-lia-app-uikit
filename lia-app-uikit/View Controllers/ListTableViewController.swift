//
//  ListTableViewController.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-04-30.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var viewModel: ListTableViewModel
    
    init(listTableViewModel: ListTableViewModel) {
        self.viewModel = listTableViewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Registering a UITableViewCell for use in creating new table cells.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor(named: "HomeColor")
        Task {
            await viewModel.loadDogs()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        let appearance = UINavigationBarAppearance()
        // Setting the navigation bar's background color.
        appearance.backgroundColor = UIColor(named: "HomeColor")
        // Applying the appearance settings when the view's edge aligns with the navigation bar's edge.
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(navigateToFavourites))
    }
    
    // Returning the number of sections in the table - 1.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Returning the number of rows in the section, which is equal to the number of items.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    // Creating and configuring a cell for each row in the table.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.items[indexPath.row].name
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
    
    // Creating the functionality to edit the table view
    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Favourite", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.viewModel.toggleFavorite(for: indexPath.row)
            self.popupNotification(for: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
            success(true)
            
            // After setting or updating the "favorites" key in UserDefaults
            print("Favorite Dogs: \(UserDefaults.standard.stringArray(forKey: "favorites") ?? [])")
            
        })
        
        modifyAction.image = UIImage(systemName: "heart.fill")
        
        modifyAction.backgroundColor = viewModel.isFavorite(for: indexPath.row) ? .green : .blue
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func navigateToDetail(forItemAt index: Int) {
        if let dog = viewModel.items[index] as? Dog {
            let detailViewController = DetailViewController(
                dog: dog            )
            navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            print("Failed to cast item to Dog")
        }
    }
    
    @objc
    func navigateToFavourites() {
        let favouriteViewController = FavouriteViewController(favouriteViewModel: FavouriteViewModel())
        navigationController?.pushViewController(favouriteViewController, animated: true)
    }
    
    func popupNotification(for index: Int) {
        let isFavorite = viewModel.isFavorite(for: index)
        let message = isFavorite ? "Added to favourites!" : "Removed from favourites!"
        let favouritesAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        favouritesAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        present(favouritesAlert, animated: true, completion: nil)
    }
}
