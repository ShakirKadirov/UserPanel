//
//  CustomView.swift
//  UserPanel
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

class CustomView: UIView {
    
    lazy var topLabel: UILabel = {
        $0.text = "Label"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var countLabel: UILabel = {
        $0.text = "Number of count"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
        addSubview(topLabel)
        addSubview(countLabel)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([

            countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            
            topLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 8),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
