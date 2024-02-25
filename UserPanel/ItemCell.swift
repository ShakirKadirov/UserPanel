//
//  ItemCell.swift
//  UserPanel
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

class ItemCell: UICollectionViewCell {
    static let reuseID = "Cell"
    
    private lazy var rootCellView: UIView = {
        $0.addSubview(cellImage)
        $0.addSubview(cellTitle)
        $0.addSubview(cellDescription)
        $0.backgroundColor = .systemGray3
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var cellImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true 
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var cellTitle: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var cellDescription: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(rootCellView)
        setContraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
     func setCell(image: UIImage, titleText: String, descriptionText: String){
        self.cellImage.image = image
        self.cellTitle.text = titleText
        self.cellDescription.text = descriptionText
         
    }
    
    
    private func setContraints() {
        let targetWidth: CGFloat = 330 // Set your desired width here
        
        let imageSize = cellImage.image?.size
        let imageRatio = (imageSize?.height ?? 1) / (imageSize?.width ?? 1)

        let viewWidth = UIScreen.main.bounds.width - 20
        let newHeightImg = targetWidth * imageRatio

        NSLayoutConstraint.activate([
            rootCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            rootCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rootCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            rootCellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),

            cellImage.topAnchor.constraint(equalTo: rootCellView.topAnchor, constant: 10),
            cellImage.leadingAnchor.constraint(equalTo: rootCellView.leadingAnchor, constant: 10),
            cellImage.trailingAnchor.constraint(equalTo: rootCellView.trailingAnchor, constant: -10),
            cellImage.heightAnchor.constraint(equalToConstant: newHeightImg),
            cellImage.widthAnchor.constraint(equalToConstant: newHeightImg),
            cellImage.widthAnchor.constraint(equalTo: rootCellView.widthAnchor, constant: -20),

            cellTitle.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 15),
            cellTitle.leadingAnchor.constraint(equalTo: rootCellView.leadingAnchor, constant: 10),
            cellTitle.trailingAnchor.constraint(equalTo: rootCellView.trailingAnchor, constant: -10),

            cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 15),
            cellDescription.leadingAnchor.constraint(equalTo: rootCellView.leadingAnchor, constant: 10),
            cellDescription.trailingAnchor.constraint(equalTo: rootCellView.trailingAnchor, constant: -10),
            cellDescription.bottomAnchor.constraint(equalTo: rootCellView.bottomAnchor, constant: -20),
        ])
    }

}
