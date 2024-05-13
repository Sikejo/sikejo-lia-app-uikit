//
//  HomeView.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-07.
//

import UIKit

class HomeView: UIViewController {
    
    private var navButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Initializing the navigation button and its appearance.
        navButton = UIButton()
        navButton.backgroundColor = UIColor(named: "HomeColor")
        navButton.setTitleColor(.black, for: .normal)
        navButton.setTitle("To the list ➔", for: .normal)
        navButton.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 20)
        navButton.layer.cornerRadius = 7
        
        // Linking the button press to the method
        navButton.addTarget(self, action: #selector(navigateToList), for: .touchUpInside)
        
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
        homeTextView.text = greetingLogic() + "\n Welcome to Lia Dog Breed App"
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
    
    // Creating the time based greeting text function.
    func greetingLogic() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        let NEW_DAY = 0
        let NOON = 12
        let SUNSET = 18
        let MIDNIGHT = 24
        
        var greetingText = "Welcome!"
        switch hour {
        case NEW_DAY..<NOON:
            greetingText = "Good Morning!"
        case NOON..<SUNSET:
            greetingText = "Good Afternoon!"
        case SUNSET..<MIDNIGHT:
            greetingText = "Good Evening!"
        default:
            _ = "Welcome!"
        }
        return greetingText
    }
}
