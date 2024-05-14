import UIKit

class DetailViewController: UIViewController {
    
    var header: String
    
    init(header: String) {
        self.header = header
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        
    private func setupUI() {
        // Main Stack View
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
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dogimage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true

        let titleLabel = CommonUI.styledLabel(text: header, fontSize: 25)
        titleLabel.textAlignment = .center

        let bodyTextView = CommonUI.styledTextView(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", fontSize: 15)
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
}
