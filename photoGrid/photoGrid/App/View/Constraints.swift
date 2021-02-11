//
//  Constraints.swift
//  photoGrid
//
//  Created by Lau on 06/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

// MARK: - Constraints

class Constraints {
    
    // MARK: - HomeViewController
    
    func titleLabelConstraints(label: UILabel, view: UIView) {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
        ])
    }
    
    func arrowUpImageViewConstraints(arrowUpImageView: UIImageView, titleLabel: UILabel, view: UIView) {
        NSLayoutConstraint.activate([
            arrowUpImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            arrowUpImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arrowUpImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.02),
            arrowUpImageView.widthAnchor.constraint(equalTo: arrowUpImageView.heightAnchor, multiplier: 1.4)
        ])
    }
    
    func swipeUpLabelConstraints(swipeUpLabel: UILabel, arrowUpImageView: UIImageView, view: UIView) {
        NSLayoutConstraint.activate([
            swipeUpLabel.topAnchor.constraint(equalTo: arrowUpImageView.bottomAnchor, constant: 10),
            swipeUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swipeUpLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
    
    func photoContentStackViewConstraints(photoContentStackView: UIStackView, swipeUpLabel: UILabel, view: UIView) {
        NSLayoutConstraint.activate([
            photoContentStackView.topAnchor.constraint(equalTo: swipeUpLabel.bottomAnchor, constant: 15),
            photoContentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoContentStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.42, constant: 0),
            photoContentStackView.widthAnchor.constraint(equalTo: photoContentStackView.heightAnchor, multiplier: 1, constant: 0)
        ])
    }
    
    func upHStackViewConstraints(upHStackView: UIStackView, photoContentStackView: UIStackView) {
        NSLayoutConstraint.activate([
            upHStackView.topAnchor.constraint(equalTo: photoContentStackView.topAnchor, constant: 10),
            upHStackView.leadingAnchor.constraint(equalTo: photoContentStackView.leadingAnchor, constant: 10),
            upHStackView.trailingAnchor.constraint(equalTo: photoContentStackView.trailingAnchor, constant: -10),
            upHStackView.heightAnchor.constraint(equalTo: photoContentStackView.heightAnchor, multiplier: 0.5, constant: -15)
        ])
    }
    
    func plusUpLeftButtonConstraints(plusUpLeftButton: UIButton, upHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            plusUpLeftButton.topAnchor.constraint(equalTo: upHStackView.topAnchor, constant: 0),
            plusUpLeftButton.bottomAnchor.constraint(equalTo: upHStackView.bottomAnchor, constant: 0),
            plusUpLeftButton.leadingAnchor.constraint(equalTo: upHStackView.leadingAnchor, constant: 0),
            plusUpLeftButton.widthAnchor.constraint(equalTo: upHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    func plusUpRightButtonConstraints(plusUpRightButton: UIButton, upHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            plusUpRightButton.topAnchor.constraint(equalTo: upHStackView.topAnchor, constant: 0),
            plusUpRightButton.bottomAnchor.constraint(equalTo: upHStackView.bottomAnchor, constant: 0),
            plusUpRightButton.trailingAnchor.constraint(equalTo: upHStackView.trailingAnchor, constant: 0),
            plusUpRightButton.widthAnchor.constraint(equalTo: upHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    func plusUpLargeButtonConstraints(plusUpLargeButton: UIButton, upHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            plusUpLargeButton.topAnchor.constraint(equalTo: upHStackView.topAnchor, constant: 0),
            plusUpLargeButton.bottomAnchor.constraint(equalTo: upHStackView.bottomAnchor, constant: 0),
            plusUpLargeButton.trailingAnchor.constraint(equalTo: upHStackView.trailingAnchor, constant: 0),
            plusUpLargeButton.leadingAnchor.constraint(equalTo: upHStackView.leadingAnchor, constant: 0)
        ])
    }
    
    func downHStackViewConstraints(downHStackView: UIStackView, photoContentStackView: UIStackView) {
        NSLayoutConstraint.activate([
            downHStackView.bottomAnchor.constraint(equalTo: photoContentStackView.bottomAnchor, constant: -10),
            downHStackView.leadingAnchor.constraint(equalTo: photoContentStackView.leadingAnchor, constant: 10),
            downHStackView.trailingAnchor.constraint(equalTo: photoContentStackView.trailingAnchor, constant: -10),
            downHStackView.heightAnchor.constraint(equalTo: photoContentStackView.heightAnchor, multiplier: 0.5, constant: -15)
        ])
    }
    
    func plusDownLeftButtonConstraints(plusDownLeftButton: UIButton, downHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            plusDownLeftButton.topAnchor.constraint(equalTo: downHStackView.topAnchor, constant: 0),
            plusDownLeftButton.bottomAnchor.constraint(equalTo: downHStackView.bottomAnchor, constant: 0),
            plusDownLeftButton.leadingAnchor.constraint(equalTo: downHStackView.leadingAnchor, constant: 0),
            plusDownLeftButton.widthAnchor.constraint(equalTo: downHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    func plusDownRightButtonConstraints(plusDownRightButton: UIButton, downHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            plusDownRightButton.topAnchor.constraint(equalTo: downHStackView.topAnchor, constant: 0),
            plusDownRightButton.bottomAnchor.constraint(equalTo: downHStackView.bottomAnchor, constant: 0),
            plusDownRightButton.trailingAnchor.constraint(equalTo: downHStackView.trailingAnchor, constant: 0),
            plusDownRightButton.widthAnchor.constraint(equalTo: downHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    func plusDownLargeButtonButtonConstraints(plusDownLargeButton: UIButton, downHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            plusDownLargeButton.topAnchor.constraint(equalTo: downHStackView.topAnchor, constant: 0),
            plusDownLargeButton.bottomAnchor.constraint(equalTo: downHStackView.bottomAnchor, constant: 0),
            plusDownLargeButton.leadingAnchor.constraint(equalTo: downHStackView.leadingAnchor, constant: 0),
            plusDownLargeButton.trailingAnchor.constraint(equalTo: downHStackView.trailingAnchor, constant: 0)
        ])
    }
    
    func selectedModeHStackViewConstraints(view: UIView, selectedModeHStackView: UIStackView, photoContentStackView: UIStackView) {
        let selectedModeHStackViewWidth = view.frame.width - 40
        let selectedModeHStackViewHeight = (selectedModeHStackViewWidth - selectedModeHStackViewWidth * 0.1) / 3
        let roomSpace = (1 - 0.62) * view.frame.height
        
        NSLayoutConstraint.activate([
            selectedModeHStackView.centerYAnchor.constraint(equalTo: photoContentStackView.bottomAnchor, constant: roomSpace/2 - selectedModeHStackViewHeight/2),
            selectedModeHStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectedModeHStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            selectedModeHStackView.heightAnchor.constraint(equalToConstant: selectedModeHStackViewHeight),
        ])
    }
    
    func mode1ButtonConstraints(mode1Button: UIButton, selectedModeHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            mode1Button.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode1Button.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode1Button.leadingAnchor.constraint(equalTo: selectedModeHStackView.leadingAnchor, constant: 0),
            mode1Button.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0)
        ])
    }
    
    func mode2ButtonConstraints(mode2Button: UIButton, selectedModeHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            mode2Button.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode2Button.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode2Button.centerXAnchor.constraint(equalTo: selectedModeHStackView.centerXAnchor),
            mode2Button.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0)
        ])
    }
    
    func mode3ButtonConstraints(mode3Button: UIButton, selectedModeHStackView: UIStackView) {
        NSLayoutConstraint.activate([
            mode3Button.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode3Button.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode3Button.trailingAnchor.constraint(equalTo: selectedModeHStackView.trailingAnchor, constant: 0),
            mode3Button.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0)
        ])
    }
    
    func selectionImageViewConstraints(selectionImageView: UIImageView, modeButton: UIButton) {
        NSLayoutConstraint.activate([
            selectionImageView.bottomAnchor.constraint(equalTo: modeButton.imageView!.bottomAnchor, constant: 0),
            selectionImageView.topAnchor.constraint(equalTo: modeButton.imageView!.topAnchor, constant: 0),
            selectionImageView.leadingAnchor.constraint(equalTo: modeButton.imageView!.leadingAnchor, constant: 0),
            selectionImageView.trailingAnchor.constraint(equalTo: modeButton.imageView!.trailingAnchor, constant: 0)
        ])
    }
    
    // MARK: - SavedViewController
    
    func collectionViewConstraints(view: UIView, collectionView: UICollectionView) {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0),
            collectionView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8, constant: 0)
        ])
    }
    
    func returnlayoutFrame(view: UIView) -> CGSize {
        let layoutFrame = CGSize(width: view.frame.size.width, height: view.frame.size.height * 0.8)
        return layoutFrame
    }
    
    func returnCollectionViewFrame(view: UIView) -> CGRect {
        let collectionViewFrame = CGRect(x: Double(0), y: Double(view.frame.size.width * 0.35), width: Double(view.frame.size.width), height: Double(view.frame.size.height * 0.8))
        return collectionViewFrame
    }
    
    func returnLabelGridCollectionViewFrame(contentView: UIView) -> CGRect {
        let labelFrame = CGRect(x: contentView.frame.size.width * 0.05,
                                y: contentView.frame.size.height * 0.6,
                                width: contentView.frame.size.width * 0.9,
                                height: contentView.frame.size.height * 0.3)
        return labelFrame
    }
    
    func returnImageViewGridCollectionViewFrame(contentView: UIView) -> CGRect {
        let imageViewFrame = CGRect(x: contentView.frame.size.width * 0.05,
                                         y: contentView.frame.size.height * 0.05,
                                         width: contentView.frame.size.width * 0.9,
                                         height: contentView.frame.size.width * 0.9)
        return imageViewFrame
    }
    
}
