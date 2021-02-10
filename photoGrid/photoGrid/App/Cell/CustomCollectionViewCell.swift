//
//  CollectionViewCell.swift
//  photoGrid
//
//  Created by Lau on 10/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.tintColor = Constants.blueDark
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(x: contentView.frame.size.width * 0.05,
                             y: contentView.frame.size.height * 0.6,
                             width: contentView.frame.size.width * 0.9,
                             height: contentView.frame.size.height * 0.3)
        
        imageView.frame = CGRect(x: contentView.frame.size.width * 0.05,
                             y: contentView.frame.size.height * 0.05,
                             width: contentView.frame.size.width * 0.9,
                             height: contentView.frame.size.width * 0.9)
    }
    
    public func configure(text: String, image: UIImage) {
        label.text = text
        imageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        imageView.image = nil
    }
    
}
