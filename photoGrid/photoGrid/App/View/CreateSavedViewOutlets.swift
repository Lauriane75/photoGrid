//
//  Create.swift
//  photoGrid
//
//  Created by Lau on 10/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import Foundation

class CreateSavedViewOutlets {
    
    func implementOutlets(vc: SavedViewController) {

        let outlets = Outlets()
        let constraints = Constraints()
        
        guard let data = vc.datas.first else { return }
        
        vc.view.backgroundColor = Constants.blueLight

        // Title
        vc.titleLabel = outlets.returnLabel(font: Constants.thirstySoftRegular, text: data.title, view: vc.view)
        constraints.titleLabelConstraints(label: vc.titleLabel, view: vc.view)
    }
}
