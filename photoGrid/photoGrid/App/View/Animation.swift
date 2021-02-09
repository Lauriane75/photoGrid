//
//  Animation.swift
//  photoGrid
//
//  Created by Lau on 06/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class Animation {
    func animationDone(viewController : ViewController) {
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
    
    func swipeAnimation(viewController : ViewController) {
        let swipePortrait = CGAffineTransform(translationX: 0, y: -viewController.view.frame.height * 0.3)
            UIView.animate(withDuration: 0.4, animations: {
                viewController.photoContentStackView.transform = swipePortrait
                viewController.upHStackView.transform = swipePortrait
                viewController.plusUpLeftButton.transform = swipePortrait
                viewController.plusUpRightButton.transform = swipePortrait
                viewController.plusUpLargeButton.transform = swipePortrait
                viewController.downHStackView.transform = swipePortrait
                viewController.plusDownLeftButton.transform = swipePortrait
                viewController.plusDownRightButton.transform = swipePortrait
                viewController.plusDownLargeButton.transform = swipePortrait
            }) { [self] (success) in
                if (success) {
                    animationDone(viewController: viewController)
            }
        }
    }
}
