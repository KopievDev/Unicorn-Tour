//
//  AuthViewController.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var loginTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 16)
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "Имя пользователя"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftViewMode = .always
        textfield.accessibilityIdentifier = "Login"
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.setIcon(UIImage(systemName:"person.circle.fill"))
        textfield.returnKeyType = .next
        return textfield
    }()
    
    lazy var passTextfield: UITextField = {
        let textfield = UITextField()
        textfield.font = .systemFont(ofSize: 16)
        textfield.placeholder = "Пароль"
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftViewMode = .always
        textfield.accessibilityIdentifier = "Password"
        textfield.returnKeyType = .done
        textfield.layer.cornerRadius = 10
        textfield.isSecureTextEntry = true
        textfield.autocorrectionType = .no
        textfield.backgroundColor = .white
        textfield.setIcon(UIImage(systemName:"lock.square.fill"))
        return textfield
    }()
    
    lazy var sighInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4698044031, blue: 0.469117062, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(sighIn), for: .touchUpInside)
        return button
    }()
    
     let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Unicorn Tour"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 20)
       label.text = "Авторизация"
       label.textAlignment = .center
       label.textColor = .white
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    func setUp() {
        let back = UIImageView(image: blurImage(usingImage: UIImage(named: "background"), blurAmount: 15))
        back.contentMode = .scaleAspectFill
        back.frame = view.frame
        let logo = UIImageView(image: UIImage(named: "unicorn"))
        logo.frame = CGRect(x: view.frame.width / 4, y: view.frame.width / 3, width: view.frame.width/2, height: view.frame.width/2)
        back.addSubview(logo)
        view.addSubview(back)
        view.addSubview(loginTextfield)
        view.addSubview(passTextfield)
        view.addSubview(sighInButton)
        view.addSubview(mainLabel)
        view.addSubview(authLabel)

        createConstrains()
        loginTextfield.becomeFirstResponder()
        let keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
        keyboardDismissTapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(keyboardDismissTapGesture)
    }
    
    func blurImage(usingImage image: UIImage?, blurAmount: CGFloat) -> UIImage? {
        guard let ciImage = CIImage(image: image!) else { return nil}
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        guard let outputImage = blurFilter?.outputImage else {return nil}
        return UIImage(ciImage: outputImage)
    }
    
    func createConstrains(){
        NSLayoutConstraint.activate([

            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            
            authLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 0),
            authLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            authLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            authLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
            
            loginTextfield.topAnchor.constraint(equalTo: authLabel.bottomAnchor, constant: 50),
            loginTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            passTextfield.topAnchor.constraint(equalTo: loginTextfield.bottomAnchor, constant: 20),
            passTextfield.leadingAnchor.constraint(equalTo: loginTextfield.leadingAnchor),
            passTextfield.trailingAnchor.constraint(equalTo: loginTextfield.trailingAnchor),
            passTextfield.heightAnchor.constraint(equalTo: loginTextfield.heightAnchor),
            passTextfield.bottomAnchor.constraint(equalTo: sighInButton.topAnchor, constant: -50),
            
            sighInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            sighInButton.leadingAnchor.constraint(equalTo: loginTextfield.leadingAnchor),
            sighInButton.trailingAnchor.constraint(equalTo: loginTextfield.trailingAnchor),
            sighInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            viewToAnimate.transform = .identity
            
        }
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    fileprivate func goToApp() {
        let realtyViewController = FeedsViewController()
        let clientViewController = ClientsViewController()
        
        //nav
        let realtyNavigation = UINavigationController(rootViewController: realtyViewController)
        let clientNavigation = UINavigationController(rootViewController: clientViewController)
        clientViewController.tabBarItem = UITabBarItem(title: "Клиенты", image: UIImage(systemName: "figure.wave"), tag: 1)
        realtyViewController.tabBarItem = UITabBarItem(title: "Туры", image: UIImage(systemName: "airplane"), tag: 0)
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([realtyNavigation,clientNavigation], animated: true)
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
    @objc func sighIn(){
        let firebase = Firebase()
        if loginTextfield.text?.count != 0 && passTextfield.text?.count != 0 {
            guard let login = loginTextfield.text,
                  let pass = passTextfield.text else {return}
            if firebase.auth(login: login, password: pass) {
                goToApp() // Переходим на главный экран
            } else {
                animateView(mainLabel)
                mainLabel.text = "Ошибка авторизации!"
            }
        } else {
            animateView(mainLabel)
            mainLabel.text = "Не все поля заполнены"
        }
    }
}



