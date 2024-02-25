//
//  ViewController.swift
//  UserPanel
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func setUserInfo(name: String, surname: String)
}


class ProfileViewController: UIViewController, ViewControllerDelegate {
    
    func setUserInfo(name: String, surname: String) {
        self.nameTextField.text =  name
        self.surNameTextField.text = surname
    }
    
    private lazy var profileImageView: UIImageView = {
        $0.image = UIImage(named: "profileImage.png")
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var nameTextField: UITextField = {
        $0.text = "Имя"
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    private lazy var surNameTextField: UITextField = {
        $0.text = "Фамилия"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    private lazy var topStackView: UIStackView = {
        $0.addArrangedSubview(nameTextField)
        $0.addArrangedSubview(surNameTextField)
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var settingButton: UIButton = {
        $0.setTitle("Настройки", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.addTarget(self, action: #selector(openSettings), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    
    private lazy var middleStackView: UIStackView = {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 8
            
            let friendsView = createCustomView(count: "10", title: "Друзей")
            let followersView = createCustomView(count: "20", title: "Подписок")
            let postsView = createCustomView(count: "30", title: "Избранных")
            
            $0.addArrangedSubview(friendsView)
            $0.addArrangedSubview(followersView)
            $0.addArrangedSubview(postsView)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UIStackView())
    
    private lazy var contentImageView: UIImageView = {
        $0.image = UIImage(named: "contentImage.png")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(profileImageView)
        view.addSubview(topStackView)
        view.addSubview(middleStackView)
        view.addSubview(contentImageView)
        view.addSubview(settingButton)
        setConstraints()
    }
    

    private func createCustomView(count: String, title: String) -> CustomView {
             let customView = CustomView()
             customView.layer.cornerRadius = 10
             customView.countLabel.text = count
             customView.topLabel.text = title
             return customView
         }
    @objc private func openSettings(){
        let vc = SettingsViewController()
        vc.delegate = self 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func setConstraints(){
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            topStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            topStackView.heightAnchor.constraint(equalToConstant: 25),
            
            settingButton.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 10),
            settingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            settingButton.bottomAnchor.constraint(equalTo: middleStackView.topAnchor, constant: -10),
                        
            middleStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            middleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            middleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            middleStackView.heightAnchor.constraint(equalToConstant: 79),
            
            contentImageView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 10),
            contentImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contentImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contentImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}

