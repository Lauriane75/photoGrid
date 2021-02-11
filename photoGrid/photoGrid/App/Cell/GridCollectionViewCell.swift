//
//  CollectionViewCell.swift
//  photoGrid
//
//  Created by Lau on 10/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "GridCollectionViewCell"
    
    var label: UILabel!
    var imageView: UIImageView!
    
    // MARK: - View life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let outlets = Outlets()
        label = outlets.returnLabel(font: Constants.thirstySoftRegular, text: "", view: contentView)
        imageView = outlets.returnImageView(view: contentView)

        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let constraints = Constraints()
        
        label.frame = constraints.returnLabelGridCollectionViewFrame(contentView: contentView)
        
        imageView.frame = constraints.returnImageViewGridCollectionViewFrame(contentView: contentView)
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
