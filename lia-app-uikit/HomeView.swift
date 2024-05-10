//
//  HomeView.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-07.
//

import UIKit

class HomeView: UIViewController {
    
    // Initializing the navigation button and configuring its appearance.
    private let navButton: UIButton = {
        let navButton = UIButton()
        navButton.backgroundColor = UIColor(named: "HomeColor")
        navButton.setTitleColor(.black, for: .normal)
        navButton.setTitle("To the list ➔", for: .normal)
        navButton.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 20)
        navButton.layer.cornerRadius = 7
        return navButton
    }()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        setupUI()
        // Linking the button press to the method.
        self.navButton.addTarget(self, action: #selector(navigateToList), for: .touchUpInside)
    }
    
    private func setupUI() {
        // Setting up a vertical stack view for the layout.
        let logoStackView = UIStackView()
        logoStackView.axis = .vertical
        logoStackView.backgroundColor = UIColor(named: "HomeColor")
        logoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting up a vertical stack for the text element.
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        
        // Setting up a dedicated stack for the navigation button
        let navButtonView = UIStackView()
        navButtonView.axis = .vertical

        // Configuring the logo image and appearance.
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = UIImage(named: "AppLogo")
        
        // Setting up the app title
        let homeTextView = UITextView()
        homeTextView.text = "Lia Dog Breed App"
        homeTextView.font = UIFont(name: "Nunito-Regular", size: 36)
        homeTextView.backgroundColor = UIColor(named: "HomeColor")
        homeTextView.textAlignment = .center
        homeTextView.isEditable = false
        
        // Assembling the views in the stack.
        navButtonView.addArrangedSubview(navButton)
        textStackView.addArrangedSubview(homeTextView)
        logoStackView.addArrangedSubview(logoImageView)
        logoStackView.addArrangedSubview(textStackView)
        logoStackView.addArrangedSubview(navButtonView)

        // Adding the main stack view to the view and constraining it to the edges of the screen.
        view.addSubview(logoStackView)
        NSLayoutConstraint.activate([
            logoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
    }
    
    // Navigating to ListTableViewController.
    @objc func navigateToList() {
        let ltvc = ListTableViewController()
        self.navigationController?.pushViewController(ltvc, animated: true)
    }
}
