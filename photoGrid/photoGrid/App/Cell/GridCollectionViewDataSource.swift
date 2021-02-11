//
//  GridCollectionViewDataSource.swift
//  photoGrid
//
//  Created by Lau on 11/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

final class CityListGridCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {

    
    // MARK: Private properties

    private var datas: [Datas] = []
    
    private var imagesString: [String] = []


    // MARK: Public function

    func update(datas: [Datas]) {
        self.datas = datas
        guard let data = datas.first else { return }
        imagesString = data.imageText
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesString.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
        
            imagesString.enumerated().forEach { (index, item) in
            guard let image = item.toImage() else { return }
            cell.configure(text: "Photo \(indexPath.row+1)", image: image)
        }
        
        return cell
    }
    
}
