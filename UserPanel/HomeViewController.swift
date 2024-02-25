//
//  HomeViewController.swift
//  UserPanel
//
//  Created by Shakir Kadirov on 25.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    let collectionItems: [ItemCellModel] = [
        ItemCellModel(image: "img_1.png", titleItem: "Цифровая Эволюция в Образовании", description: "Современные технологии радикально меняют образование. Виртуальные классы и онлайн-ресурсы сделали обучение более доступным, но требуют развития цифровой грамотности. Баланс между традицией и инновацией важен."),
        ItemCellModel(image: "img_2.png", titleItem: "Цифровая Эволюция в Образовании", description: "Современные технологии радикально меняют образование. Виртуальные классы и онлайн-ресурсы сделали обучение более доступным, но требуют развития цифровой грамотности. Баланс между традицией и инновацией важен."),
        ItemCellModel(image: "img_1.png", titleItem: "Цифровая Эволюция в Образовании", description: "Современные технологии радикально меняют образование. Виртуальные классы и онлайн-ресурсы сделали обучение более доступным, но требуют развития цифровой грамотности. Баланс между традицией и инновацией важен."),
        ItemCellModel(image: "img_2.png", titleItem: "Цифровая Эволюция в Образовании", description: "Современные технологии радикально меняют образование. Виртуальные классы и онлайн-ресурсы сделали обучение более доступным, но требуют развития цифровой грамотности. Баланс между традицией и инновацией важен."),
        ItemCellModel(image: "img_1.png", titleItem: "Цифровая Эволюция в Образовании", description: "Современные технологии радикально меняют образование. Виртуальные классы и онлайн-ресурсы сделали обучение более доступным, но требуют развития цифровой грамотности. Баланс между традицией и инновацией важен."),
        ItemCellModel(image: "img_2.png", titleItem: "Цифровая Эволюция в Образовании", description: "Современные технологии радикально меняют образование. Виртуальные классы и онлайн-ресурсы сделали обучение более доступным, но требуют развития цифровой грамотности. Баланс между традицией и инновацией важен."),

    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseID)
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Главный экран"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(collectionView)
    }
}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseID, for: indexPath) as! ItemCell
        
        let item = collectionItems[indexPath.row]
        let image = UIImage(named: item.image) ?? UIImage(named: "placeholder") // Use a placeholder image if the specified image is not found
        
        cell.setCell(image: image!, titleText: item.titleItem, descriptionText: item.description)
//        cell.backgroundColor = .red
        return cell
    }
}
