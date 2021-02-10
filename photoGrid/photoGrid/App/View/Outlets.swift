//
//  Outlets.swift
//  photoGrid
//
//  Created by Lau on 06/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

// MARK: - Return Outlets

class Outlets {
    
    func returnView(view: UIView) -> UIView {
        let uiview: UIView = {
            let uiview = UIView()
            uiview.translatesAutoresizingMaskIntoConstraints = false
    
            return uiview
        }()
        view.addSubview(uiview)
        return uiview
    }
    
    func returnStackView(backgroundColor: UIColor, view: UIView) -> UIStackView {
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = backgroundColor
            
            return stackView
        }()
        view.addSubview(stackView)
        return stackView
    }
 
    func returnLabel(tintColor: UIColor = .white, font: UIFont, text: String, view: UIView) -> UILabel {
        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = tintColor
            label.font = font
            label.text = text
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = font
            
            return label
        }()
        view.addSubview(label)
        return label
    }
    
    func returnImageView(image: UIImage, view: UIView) -> UIImageView {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = image
            
            return imageView
        }()
        view.addSubview(imageView)
        return imageView
    }
    
    func returnButton(image: UIImage, background: UIColor, view: UIView) -> UIButton {
        let button: UIButton = {
            let button = UIButton()
            button.imageView?.contentMode = .scaleAspectFill
            button.backgroundColor = background
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(image, for: .normal)
            
            return button
        }()
        view.addSubview(button)
        return button
    }
    
    func returnCollectionView(background: UIColor, view: UIView, frame: CGRect) -> UICollectionView {
        let collectionView: UICollectionView = {
            let collectionView = UICollectionView()
            collectionView.backgroundColor = background
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.frame = frame

            return collectionView
        }()
        view.addSubview(collectionView)
        return collectionView
    }
    
    func returnLayout(frame: CGSize) -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = frame
            
            return layout
    }()
    return layout
    }

}
