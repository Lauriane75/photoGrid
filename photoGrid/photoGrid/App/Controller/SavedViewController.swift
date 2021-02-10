//
//  SavedViewController.swift
//  photoGrid
//
//  Created by Lau on 09/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.

import UIKit

class SavedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
        
    // MARK: - Outlets
    
    var collectionView: UICollectionView?
    
    var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var manager = Manager.shared
    var datas: [Datas] = []
    var imagesString: [String] = []

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datas = manager.getData()
                
        let createSavedViewOutlets = CreateSavedViewOutlets()
        
        createSavedViewOutlets.implementOutlets(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        implementCollectionView()
    }
    
    // MARK: - CollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        imagesString.enumerated().forEach { (index, item) in
            guard let image = item.toImage() else { return }
            cell.configure(text: "Photo \(indexPath.row)", image: image)
        }
    
        return cell
    }
    
    // MARK: - Action

    
    // MARK: - Private Functions
    
    private func implementCollectionView() {
        datas = manager.getData()

        guard let data = datas.first else { return }
        imagesString = data.imageText

        let outlets = Outlets()

        let layoutFrame = CGSize(width: view.frame.size.width, height: view.frame.size.height * 0.8)
        
        let layout = outlets.returnLayout(frame: layoutFrame)
        
        let collectionViewFrame = CGRect(x: Double(0), y: Double(view.frame.size.width * 0.35), width: Double(view.frame.size.width), height: Double(view.frame.size.height * 0.8))
        
        collectionView = UICollectionView(frame: collectionViewFrame,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
                
        view.addSubview(collectionView)
        collectionView.backgroundColor = Constants.blueLight
    }

    // MARK: - File private


}
