//
//  Implements.swift
//  photoGrid
//
//  Created by Lau on 07/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import Foundation

class CreateHomeViewOutlets {
    
    func implementOutlets(vc: HomeViewController) {
        
        let outlets = Outlets()
        let constraints = Constraints()
        
        vc.view.backgroundColor = Constants.blueLight
        
        guard let data = vc.datas.first else { return }
        
        // Title
        vc.titleLabel = outlets.returnLabel(font: Constants.thirstySoftRegular, text: data.title, view: vc.view)
        constraints.titleLabelConstraints(label: vc.titleLabel, view: vc.view)
        
        // Arrow
        vc.arrowUpImageView = outlets.returnImageViewWithImage(image: Constants.arrowUpImage, view: vc.view)
        constraints.arrowUpImageViewConstraints(arrowUpImageView: vc.arrowUpImageView, titleLabel: vc.titleLabel, view: vc.view)
        
        // Swipe up
        vc.swipeUpLabel = outlets.returnLabel(font: Constants.delmMedium, text: data.swipeText, view: vc.view)
        constraints.swipeUpLabelConstraints(swipeUpLabel: vc.swipeUpLabel, arrowUpImageView: vc.arrowUpImageView, view: vc.view)
        
        // PhotoContentStackView
        vc.photoContentStackView = outlets.returnStackView(backgroundColor: Constants.blueDark, view: vc.view)
        constraints.photoContentStackViewConstraints(photoContentStackView: vc.photoContentStackView, swipeUpLabel: vc.swipeUpLabel, view: vc.view)

        // UpHStackView
        vc.upHStackView = outlets.returnStackView(backgroundColor: Constants.blueDark, view: vc.view)
        constraints.upHStackViewConstraints(upHStackView: vc.upHStackView, photoContentStackView: vc.photoContentStackView)

        // PlusUpLeftButton
        vc.plusUpLeftButton = outlets.returnButton(image: Constants.plusImage, background: .clear, view: vc.view)
        vc.plusUpLeftButton.addTarget(vc, action: #selector(vc.didPressUpLeftButton), for: .touchUpInside)
        constraints.plusUpLeftButtonConstraints(plusUpLeftButton: vc.plusUpLeftButton, upHStackView: vc.upHStackView)

        // PlusUpRightButton
        vc.plusUpRightButton = outlets.returnButton(image: Constants.plusImage, background: .clear, view: vc.view)
        vc.plusUpRightButton.addTarget(vc, action: #selector(vc.didPressUpRightButton), for: .touchUpInside)
        constraints.plusUpRightButtonConstraints(plusUpRightButton: vc.plusUpRightButton, upHStackView: vc.upHStackView)

        // PlusUpLargeButton
        vc.plusUpLargeButton = outlets.returnButton(image: Constants.plusImage, background: Constants.whiteGray, view: vc.view)
        vc.plusUpLargeButton.addTarget(vc, action: #selector(vc.didPressUpLargeButton), for: .touchUpInside)
        constraints.plusUpLargeButtonConstraints(plusUpLargeButton: vc.plusUpLargeButton, upHStackView: vc.upHStackView)

        // DownHStackView
        vc.downHStackView = outlets.returnStackView(backgroundColor: Constants.blueDark, view: vc.view)
        constraints.downHStackViewConstraints(downHStackView: vc.downHStackView, photoContentStackView: vc.photoContentStackView)

        // PlusDownLeftButton
        vc.plusDownLeftButton = outlets.returnButton(image: Constants.plusImage, background: .clear, view: vc.view)
        vc.plusDownLeftButton.addTarget(vc, action: #selector(vc.didPressDownLeftButton), for: .touchUpInside)
        constraints.plusDownLeftButtonConstraints(plusDownLeftButton: vc.plusDownLeftButton, downHStackView: vc.downHStackView)

        // PlusDownRightButton
        vc.plusDownRightButton = outlets.returnButton(image: Constants.plusImage, background: .clear, view: vc.view)
        vc.plusDownRightButton.addTarget(vc, action: #selector(vc.didPressDownRightButton), for: .touchUpInside)
        constraints.plusDownRightButtonConstraints(plusDownRightButton: vc.plusDownRightButton, downHStackView: vc.downHStackView)

        // PlusDownLargeButton
        vc.plusDownLargeButton = outlets.returnButton(image: Constants.plusImage, background: Constants.whiteGray, view: vc.view)
        vc.plusDownLargeButton.addTarget(vc, action: #selector(vc.didPressDownLargeButton), for: .touchUpInside)
        constraints.plusDownLargeButtonButtonConstraints(plusDownLargeButton: vc.plusDownLargeButton, downHStackView: vc.downHStackView)

        // selectedModeHStackView
        vc.selectedModeHStackView = outlets.returnStackView(backgroundColor: .clear, view: vc.view)
        constraints.selectedModeHStackViewConstraints(view: vc.view, selectedModeHStackView: vc.selectedModeHStackView, photoContentStackView: vc.photoContentStackView)
        vc.selectedModeHStackView.distribution = .equalCentering

        // mode1Button
        vc.mode1Button = outlets.returnButton(image: Constants.selected1Image, background: .clear, view: vc.view)
        vc.mode1Button.addTarget(self, action: #selector(vc.didSelectMode1Button), for: .touchUpInside)
        constraints.mode1ButtonConstraints(mode1Button: vc.mode1Button, selectedModeHStackView: vc.selectedModeHStackView)
        vc.mode1SelectionImageView = outlets.returnImageViewWithImage(image: Constants.selection, view: vc.view)
        constraints.selectionImageViewConstraints(selectionImageView: vc.mode1SelectionImageView, modeButton: vc.mode1Button)

        // mode2Button
        vc.mode2Button = outlets.returnButton(image: Constants.selected2Image, background: .clear, view: vc.view)
        vc.mode2Button.addTarget(self, action: #selector(vc.didSelectMode2Button), for: .touchUpInside)
        constraints.mode2ButtonConstraints(mode2Button: vc.mode2Button, selectedModeHStackView: vc.selectedModeHStackView)
        vc.mode2SelectionImageView = outlets.returnImageViewWithImage(image: Constants.selection, view: vc.view)
        constraints.selectionImageViewConstraints(selectionImageView: vc.mode2SelectionImageView, modeButton: vc.mode2Button)

        // mode3Button
        vc.mode3Button = outlets.returnButton(image: Constants.selected3Image, background: .clear, view: vc.view)
        vc.mode3Button.addTarget(self, action: #selector(vc.didSelectMode3Button), for: .touchUpInside)
        constraints.mode3ButtonConstraints(mode3Button: vc.mode3Button, selectedModeHStackView: vc.selectedModeHStackView)
        vc.mode3SelectionImageView = outlets.returnImageViewWithImage(image: Constants.selection, view: vc.view)
        constraints.selectionImageViewConstraints(selectionImageView: vc.mode3SelectionImageView, modeButton: vc.mode3Button)
    }
}

