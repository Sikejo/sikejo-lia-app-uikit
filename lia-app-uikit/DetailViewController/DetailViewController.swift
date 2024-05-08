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
        stackView.backgroundColor = .blue
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        let innerStackView = UIStackView()
        innerStackView.axis = .vertical
        innerStackView.backgroundColor = .green
        innerStackView.alignment = .fill
        innerStackView.distribution = .fill
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dogimage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = "TEST TEST TEST TEST"
        titleLabel.backgroundColor = .orange

        
        let bodyTextView = UITextView()
        bodyTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis eros viverra, bibendum urna et, tincidunt odio. Aenean leo odio, finibus in mi in, tincidunt pharetra nunc. Sed sollicitudin eu orci non tempus. Nulla vitae auctor nisi. Donec laoreet, felis ut lobortis sodales, purus dui scelerisque enim, sit amet cursus ligula lectus quis leo. Aliquam ac turpis nec arcu congue pretium et a leo. Nulla quis lectus feugiat, porta elit id, finibus nisi. Proin sed ligula sed lacus scelerisque congue. Etiam a suscipit lorem. Suspendisse ultrices sem vitae tempor posuere. Duis auctor nibh in nisi pretium sollicitudin. Donec lacus dui, consectetur nec aliquet et, commodo vel arcu."
        bodyTextView.backgroundColor = .systemPink
        
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
