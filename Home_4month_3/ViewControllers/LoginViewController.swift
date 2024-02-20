//
//  LoginViewController.swift
//  Home_4month_3
//
//  Created by A LINA on 20/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var loginBtn: UIButton = {
        let maker = MakerView()
        let button = maker.makerButton(title: "Login",
                                       titleColor: .black,
                                       titleFont: .boldSystemFont(ofSize: 23),
                                       backgroundColor: .clear,
                                       cornerRadius: 0,
                                       translatesAutoresizingMaskIntoConstraints: false)
        
        let image = UIImage(systemName: "person")
        let tintedImage = image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(tintedImage, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    private let textLbl = MakerView().makerLabel(text: "Welcome back , Rohit thakur", size:14, textColor: .darkGray, backgroundColor: .systemGray6)
    
    
    
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImageView( image: UIImage( named: "backgroundImage"))
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var entertextLbl = MakerView().makerLabel(text: "Enter Your Mobile Number", size: 19, weight: .bold, textColor: UIColor(named: "color")!)
    
    private lazy var changeLbl = MakerView().makerLabel(text:"password must contain 12 or 13 numbers", textColor: .systemGray6)
    
    private lazy var mobileNumberTF = MakerView().makeTextField(placeholder: "Enter Number", backgroundColor: .white)
    
    private lazy var changeNumberBtn: UIButton = {
        let view = MakerView().makerButton(title: "Change Number?", titleColor: .darkGray, titleFont: UIFont.systemFont(ofSize: 13))
        view.addTarget(self, action: #selector(changeNumberTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var loginButton: UIButton = {
        let button = MakerView().makerButton(title: "Login", titleColor: .white, titleFont: UIFont.systemFont(ofSize: 18, weight: .semibold), backgroundColor: UIColor(named: "color") ?? .orange, cornerRadius: 10)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var googleButton: UIButton = {
        let maker = MakerView()
        let button = maker.makerButton(title: "Google",
                                       titleColor: .black,
                                       titleFont: .boldSystemFont(ofSize: 18),
                                       backgroundColor: .clear,
                                       cornerRadius: 0,
                                       translatesAutoresizingMaskIntoConstraints: false)
        
        let image = UIImage(systemName: "g.circle")
        let tintedImage = image?.withTintColor(UIColor(named: "color") ?? .tintColor, renderingMode: .alwaysOriginal)
        button.setImage(tintedImage, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(googleBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var signupLbl = MakerView().makerLabel(text: "You Don’t have an account ?", size: 16, textColor: .systemGray )
    
    
    private lazy var signupBtn: UIButton = {
        let button = MakerView().makerButton(title: "Sign up", titleColor: .black, titleFont: .systemFont(ofSize: 16, weight: .bold) )
        button.addTarget(self, action: #selector(signupBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupView()
    }
    
    private func setupView() {
        view.addSubview(loginBtn)
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            loginBtn.widthAnchor.constraint(equalToConstant: 100),
            loginBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        
        
        
        view.addSubview(textLbl)
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: loginBtn.topAnchor, constant: 40),
            textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textLbl.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: textLbl.topAnchor, constant: 50),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 230),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -420)
        ])
        
        view.addSubview(entertextLbl)
        NSLayoutConstraint.activate([
            entertextLbl.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 220),
            entertextLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 78),
            entertextLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entertextLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            entertextLbl.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        
        view.addSubview(changeLbl)
        NSLayoutConstraint.activate([
            changeLbl.topAnchor.constraint(equalTo: entertextLbl.topAnchor, constant: 50),
            changeLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            changeLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            changeLbl.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        
        
        view.addSubview(mobileNumberTF)
        NSLayoutConstraint.activate([
            mobileNumberTF.topAnchor.constraint(equalTo: entertextLbl.topAnchor, constant: 70),
            mobileNumberTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mobileNumberTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mobileNumberTF.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(changeNumberBtn)
        NSLayoutConstraint.activate([
            changeNumberBtn.topAnchor.constraint(equalTo: mobileNumberTF.topAnchor,constant: 50),
            changeNumberBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -23),
            changeNumberBtn.heightAnchor.constraint(equalToConstant: 20 )
        ])
        
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: changeNumberBtn.topAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(googleButton)
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: 100),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            googleButton.widthAnchor.constraint(equalToConstant: 200),
            googleButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(signupLbl)
        NSLayoutConstraint.activate([
            signupLbl.topAnchor.constraint(equalTo: googleButton.topAnchor,constant: 100),
            signupLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signupLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            signupLbl.heightAnchor.constraint(equalToConstant: 15 )
        ])
        
        view.addSubview(signupBtn)
        NSLayoutConstraint.activate([
            signupBtn.topAnchor.constraint(equalTo: googleButton.topAnchor,constant: 100),
            signupBtn.leadingAnchor.constraint(equalTo: signupLbl.leadingAnchor, constant: 210),
            signupBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            signupBtn.heightAnchor.constraint(equalToConstant: 15 )
        ])
        
    }
    
    
    
    
    @objc private func loginButtonTapped() {
        
        guard let phoneNumber = mobileNumberTF.text else {
            mobileNumberTF.layer.borderColor = UIColor.red.cgColor
            mobileNumberTF.placeholder = "Введите номер Кыргызстана"
            return
        }
        
        
        if phoneNumber.hasPrefix("+996") && phoneNumber.count == 13 {
            performLogin()
        }  else if phoneNumber.hasPrefix("996") && phoneNumber.count == 12 {
            performLogin()
        }  else if phoneNumber.hasPrefix("070") && phoneNumber.count == 10 {
            performLogin()
        }  else if phoneNumber.hasPrefix("055") && phoneNumber.count == 10 {
            performLogin()
        }
        else if phoneNumber.hasPrefix("077") && phoneNumber.count == 10 {
            performLogin()
        }
        else {
            mobileNumberTF.layer.borderColor = UIColor.red.cgColor
            changeLbl.text = "Введите номер Кыргызстана"
            changeLbl.textColor = .red
        }
    }
    
    private func performLogin() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc private func changeNumberTapped(){
        
    }
    
    @objc private func loginBtnTapped(){
        
    }
    
    @objc private func googleBtnTapped(){
        
    }
    
    @objc private func signupBtnTapped(){
        
    }
    
}
