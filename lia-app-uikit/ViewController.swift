//
//  ViewController.swift
//  lia-app-uikit
//
//  Created by Kevin Henriksson (External - Magnit Global Sweden II AB) on 2024-04-29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .blue
        
        // Create label
        let label = UILabel()
        label.text = "Hello, world!"
        label.textColor = .white
        label.textAlignment = .center
        
        // Create vertical stack view
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        
        // Add label to stack view
        stackView.addArrangedSubview(label)
        
        // Disable autoresizing mask translation
        // This is required when you manually set anchors as is done below
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add stack view to parent view
        view.addSubview(stackView)
        
        // Add constraints to make the stack view fill the parent view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }


}

