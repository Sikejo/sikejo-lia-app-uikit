import UIKit

class DetailViewController: UIViewController {
    
    var dog: Dog
    
    private let imageView = UIImageView()
    
    init(dog: Dog, referenceImageID: String
    ) {
        self.dog = dog
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadImage(referenceImageID: dog.referenceImageID ?? "Dog Image")
        view.backgroundColor = UIColor(named: "HomeColor")
    }
    
    private func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = UIColor(named: "HomeColor")
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        let innerStackView = UIStackView()
        innerStackView.axis = .vertical
        innerStackView.backgroundColor = UIColor(named: "HomeColor")
        innerStackView.alignment = .fill
        innerStackView.distribution = .fill
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        
        let titleLabel = CommonUI.styledLabel(text: dog.name, fontSize: 25)
        titleLabel.textAlignment = .center
        
        // Initialize the fullText variable with the breed temperament
        var fullText = "Breed Temperament: \n" + (dog.temperament ?? "Unknown")
        
        // Append optional strings to the fullText if they are not nil and not empty
        if let description = dog.description, !description.isEmpty {
            fullText += "\n\nDescription: " + description
        }
        if let origin = dog.origin, !origin.isEmpty {
            fullText += "\n\nOrigin: " + origin
        }
        if let history = dog.history, !history.isEmpty {
            fullText += "\n\nHistory: " + history
        }
        if let bredFor = dog.bredFor, !bredFor.isEmpty {
            fullText += "\n\nBred For: " + bredFor
        }
        
        // Create the bodyTextView with the fullText
        let bodyTextView = CommonUI.styledTextView(
            text: fullText, fontSize: 17 )
        bodyTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        bodyTextView.textAlignment = .justified
        
        innerStackView.addArrangedSubview(titleLabel)
        innerStackView.addArrangedSubview(bodyTextView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(innerStackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func loadImage(referenceImageID: String) {
        APIManager.shared.fetchImage(with: referenceImageID) { [weak self] image in
            DispatchQueue.main.async {
                if let image = image {
                    self?.imageView.image = image
                } else {
                    print("Failed to load image")
                }
            }
        }
    }
}
