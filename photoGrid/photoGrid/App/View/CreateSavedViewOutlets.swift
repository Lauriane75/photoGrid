//
//  Create.swift
//  photoGrid
//
//  Created by Lau on 10/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import Foundation

class CreateSavedViewOutlets {
    
    let outlets = Outlets()
    let constraints = Constraints()
    
    func implementOutlets(vc: SavedViewController) {
        
        guard let data = vc.datas.first else { return }
        
        vc.view.backgroundColor = Constants.blueLight

        // Title
        vc.titleLabel = outlets.returnLabel(font: Constants.thirstySoftRegular, text: data.title, view: vc.view)
        constraints.titleLabelConstraints(label: vc.titleLabel, view: vc.view)
    }
    
    func implementCollectionView(vc: SavedViewController) {

        let outlets = Outlets()

        let layoutFrame = constraints.returnlayoutFrame(view: vc.view)
        
        let layout = outlets.returnLayout(frame: layoutFrame)
        
        let collectionViewFrame = constraints.returnCollectionViewFrame(view: vc.view)
        
        vc.collectionView = outlets.returnCollectionView(background: Constants.blueLight, view: vc.view, frame: collectionViewFrame, layout: layout)
    }
}
