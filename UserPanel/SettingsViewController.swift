//
//  SettingsViewController.swift
//  UserPanel
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit


class SettingsViewController: UIViewController {
     
    var delegate: ViewControllerDelegate? 
    private lazy var personalDataLabel: UILabel = {
        $0.text = "Введите новые данные"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var mainView: UIView = {
        $0.backgroundColor = .systemGray3
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addSubview(nameTextField)
        $0.addSubview(surNameTextField)
        $0.addSubview(saveButton)
        return $0
    }(UIView())
    
    
    private lazy var nameTextField: UITextField = {
        $0.placeholder = "Имя"
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.leftViewMode = .always
        $0.leftView = ofsetView()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    private lazy var surNameTextField: UITextField = {
        $0.placeholder = "Фамилия"
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.leftViewMode = .always
        $0.leftView = ofsetView()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    private lazy var saveButton: UIButton = {
        $0.setTitle("Сохранить", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(setUserInfo), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(personalDataLabel)
        view.addSubview(mainView)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            personalDataLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            personalDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            personalDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            personalDataLabel.heightAnchor.constraint(equalToConstant: 15),
            
            mainView.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 15),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            
            nameTextField.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            surNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            surNameTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            surNameTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            surNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.topAnchor.constraint(equalTo: surNameTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func setUserInfo(){
        let vc = ProfileViewController()
        let inputName = nameTextField.text ?? ""
        let inputSurName = surNameTextField.text ?? ""
        self.delegate?.setUserInfo(name: inputName, surname: inputSurName)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func ofsetView() -> UIView{
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 50)
        return view
    }
}
