//
//  Animation.swift
//  photoGrid
//
//  Created by Lau on 06/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class Animation {
    func AnimationDone(viewController : ViewController) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options:[] , animations: {
            viewController.photoContentStackView.transform = .identity
            viewController.upHStackView.transform = .identity
            viewController.plusUpLeftButton.transform = .identity
            viewController.plusUpRightButton.transform = .identity
            viewController.plusUpLargeButton.transform = .identity
            viewController.downHStackView.transform = .identity
            viewController.plusDownLeftButton.transform = .identity
            viewController.plusDownRightButton.transform = .identity
            viewController.plusDownLargeButton.transform = .identity
            
        } , completion: nil )
    }
}
