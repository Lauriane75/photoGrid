//
//  SavedViewController.swift
//  photoGrid
//
//  Created by Lau on 09/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.

import UIKit

class SavedViewController: UIViewController {
        
    // MARK: - Outlets
    
    var collectionView: UICollectionView?
    var titleLabel: UILabel!
    var source = CityListGridCollectionViewDataSource()
    
    // MARK: - Properties
    
    var manager = Manager.shared
    var datas: [Datas] = []
    let createSavedViewOutlets = CreateSavedViewOutlets()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
            
        datas = manager.getData()
                                
        createSavedViewOutlets.implementOutlets(vc: self)
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bind(to: source)
        createSavedViewOutlets.implementCollectionView(vc: self)
        
        guard let collectionView = collectionView else { return }

        collectionView.dataSource = source
        collectionView.delegate = source
    }
    
    
    // MARK: - Private Functions

    private func bind(to source: CityListGridCollectionViewDataSource) {
        source.update(datas: manager.getData())
    }
    
    
    // MARK: - Action

    

    // MARK: - File private


}
