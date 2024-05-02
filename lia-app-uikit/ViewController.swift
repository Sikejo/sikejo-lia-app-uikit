//
//  ViewController.swift
//  lia-app-uikit
//
//  Created by Kevin Henriksson (External - Magnit Global Sweden II AB) on 2024-04-29.
/*

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white

        // Creating the ListTableViewController Instance
        let listTableViewController = ListTableViewController(style: .plain)
        addChild(listTableViewController)
        listTableViewController.didMove(toParent: self)
        
        // Disable autoresizing mask translation for list view
        listTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        

        // Create vertical stack view
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        
        // Add label and listTableViewController's view to stack view
        stackView.addArrangedSubview(listTableViewController.view)
                
        // Disable autoresizing mask translation
        // This is required when you manually set anchors as is done below
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add stack view to parent view and configure constraints
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Add constraints to make the stack view fill the parent view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        
    }
    
    
    


}
*/
