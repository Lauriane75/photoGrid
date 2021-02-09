//
//  Implements.swift
//  photoGrid
//
//  Created by Lau on 07/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Implement Outlets

extension ViewController {
    func implementOutlets() {
        view.backgroundColor = Constants.blueLight
        
        guard let data = data.first else { return }
        
        // Title
        titleLabel = returnLabel(font: Constants.thirstySoftRegular, text: data.title)
        titleLabelConstraints()
        
        // Arrow
        arrowUpImageView = returnImageView(image: Constants.arrowUpImage)
        arrowUpImageViewConstraints()
        
        // Swipe up
        swipeUpLabel = returnLabel(font: Constants.delmMedium, text: data.swipeText)
        swipeUpLabelConstraints()
        
        // PhotoContentStackView
        photoContentStackView = returnStackView(backgroundColor: Constants.blueDark, view: view)
        photoContentStackViewConstraints()
        
        // UpHStackView
        upHStackView = returnStackView(backgroundColor: Constants.blueDark, view: view)
        upHStackViewConstraints()
        
        // PlusUpLeftButton
        plusUpLeftButton = returnButton(image: Constants.plusImage, background: .clear)
        plusUpLeftButton.addTarget(self, action: #selector(didPressUpLeftButton), for: .touchUpInside)
        plusUpLeftButtonConstraints()
        
        // PlusUpRightButton
        plusUpRightButton = returnButton(image: Constants.plusImage, background: .clear)
        plusUpRightButton.addTarget(self, action: #selector(didPressUpRightButton), for: .touchUpInside)
        plusUpRightButtonConstraints()
        
        // PlusUpLargeButton
        plusUpLargeButton = returnButton(image: Constants.plusImage, background: Constants.whiteGray)
        plusUpLargeButton.addTarget(self, action: #selector(didPressUpLargeButton), for: .touchUpInside)
        plusUpLargeButtonConstraints()

        // DownHStackView
        downHStackView = returnStackView(backgroundColor: Constants.blueDark, view: view)
        downHStackViewConstraints()
        
        // PlusDownLeftButton
        plusDownLeftButton = returnButton(image: Constants.plusImage, background: .clear)
        plusDownLeftButton.addTarget(self, action: #selector(didPressDownLeftButton), for: .touchUpInside)
        plusDownLeftButtonConstraints()
        
        // PlusDownRightButton
        plusDownRightButton = returnButton(image: Constants.plusImage, background: .clear)
        plusDownRightButton.addTarget(self, action: #selector(didPressDownRightButton), for: .touchUpInside)
        plusDownRightButtonConstraints()
        
        // PlusDownLargeButton
        plusDownLargeButton = returnButton(image: Constants.plusImage, background: Constants.whiteGray)
        plusDownLargeButton.addTarget(self, action: #selector(didPressDownLargeButton), for: .touchUpInside)
        plusDownLargeButtonButtonConstraints()
        
        // selectedModeHStackView
        selectedModeHStackView = returnStackView(backgroundColor: .clear, view: view)
        selectedModeHStackViewConstraints()
        selectedModeHStackView.distribution = .equalCentering
        
        // mode1Button
        mode1Button = returnButton(image: Constants.selected1Image, background: .clear)
        mode1Button.addTarget(self, action: #selector(didSelectMode1Button), for: .touchUpInside)
        mode1ButtonConstraints()
        mode1SelectionImageView = returnImageView(image: Constants.selection)
        selectionImageViewConstraints(selectionImageView: mode1SelectionImageView, modeButton: mode1Button)
        
        // mode2Button
        mode2Button = returnButton(image: Constants.selected2Image, background: .clear)
        mode2Button.addTarget(self, action: #selector(didSelectMode2Button), for: .touchUpInside)
        mode2ButtonConstraints()
        mode2SelectionImageView = returnImageView(image: Constants.selection)
        selectionImageViewConstraints(selectionImageView: mode2SelectionImageView, modeButton: mode2Button)
        
        // mode3Button
        mode3Button = returnButton(image: Constants.selected3Image, background: .clear)
        mode3Button.addTarget(self, action: #selector(didSelectMode3Button), for: .touchUpInside)
        mode3ButtonConstraints()
        mode3SelectionImageView = returnImageView(image: Constants.selection)
        selectionImageViewConstraints(selectionImageView: mode3SelectionImageView, modeButton: mode3Button)
    }
}

