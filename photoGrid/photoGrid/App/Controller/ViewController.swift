//
//  ViewController.swift
//  photoGrid
//
//  Created by Lauriane Haydari on 03/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    var titleLabel: UILabel!
    var arrowUpImageView: UIImageView!
    var swipeUpLabel: UILabel!
    
    var photoContentStackView: UIStackView!

    var upHStackView: UIStackView!
    var plusUpLeftButton: UIButton!
    var plusUpRightButton: UIButton!
    var plusUpLargeButton: UIButton!

    var downHStackView: UIStackView!
    var plusDownLeftButton: UIButton!
    var plusDownRightButton: UIButton!
    var plusDownLargeButton: UIButton!
    
    var selectedModeHStackView: UIStackView!
    var mode1Button: UIButton!
    var mode2Button: UIButton!
    var mode3Button: UIButton!
    var mode1SelectionImageView: UIImageView!
    var mode2SelectionImageView: UIImageView!
    var mode3SelectionImageView: UIImageView!

    // MARK: - Properties
    
    var manager = Manager.shared
    var data: [Data] = []
    var button: UIButton? = nil
    var select: SelectedMode = .mode3 {
        didSet {
        }
    }

    // MARK: - Initializer

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View life cycle

    override func viewDidLoad() {
         super.viewDidLoad()
        
        data = manager.getData()
        
        implementOutlets()
        
        setPhotoContentMode(imageViewMode1Hidden: true,
                            imageViewMode2Hidden: true,
                            imageViewMode3Hidden: false,
                            
                            imageViewUpLeftHidden: false,
                            imageViewUpLargeHidden: true,
                            imageViewDownLeftHidden: false,
                            downLargeHidden: true)
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    // MARK: - Action
    
    // Mode selection
    
    @objc func didSelectMode1Button(_ sender: UIButton) {
        select = .mode1
        setPhotoContentMode(imageViewMode1Hidden: false,
                            imageViewMode2Hidden: true,
                            imageViewMode3Hidden: true,
                            
                            imageViewUpLeftHidden: true,
                            imageViewUpLargeHidden: false,
                            imageViewDownLeftHidden: false,
                            downLargeHidden: true)
    }
    
    @objc func didSelectMode2Button(_ sender: UIButton) {
        select = .mode2
        setPhotoContentMode(imageViewMode1Hidden: true,
                            imageViewMode2Hidden: false,
                            imageViewMode3Hidden: true,
                            
                            imageViewUpLeftHidden: false,
                            imageViewUpLargeHidden: true,
                            imageViewDownLeftHidden: true,
                            downLargeHidden: false)
    }
    
    @objc func didSelectMode3Button(_ sender: UIButton) {
        select = .mode3
        setPhotoContentMode(imageViewMode1Hidden: true,
                            imageViewMode2Hidden: true,
                            imageViewMode3Hidden: false,
                            
                            imageViewUpLeftHidden: false,
                            imageViewUpLargeHidden: true,
                            imageViewDownLeftHidden: false,
                            downLargeHidden: true)
    }
    
    // Add photo
    
    @objc func didPressUpLeftButton(_ sender: UIButton) {
        addPhoto(button: plusUpLeftButton)
    }
    
    @objc func didPressUpRightButton(_ sender: UIButton) {
        addPhoto(button: plusUpRightButton)
    }
    
    @objc func didPressUpLargeButton(_ sender: UIButton) {
        addPhoto(button: plusUpLargeButton)
    }
    
    @objc func didPressDownLeftButton(_ sender: UIButton) {
        addPhoto(button: plusDownLeftButton)
    }
    
    @objc func didPressDownRightButton(_ sender: UIButton) {
        addPhoto(button: plusDownRightButton)
    }
    
    @objc func didPressDownLargeButton(_ sender: UIButton) {
        addPhoto(button: plusDownLargeButton)
    }
    
    // Swipe up
    
    @objc func handleGesture() {
        
        let animation = Animation()
        let alert = Alert()
        
        var finalPhoto: UIImage? = nil
        
        guard let plusUpLeftImage = plusUpLeftButton.imageView?.image else { return }
        guard let plusUpRightImage = plusUpRightButton.imageView?.image else { return }
        guard let plusUpLargeImage = plusUpLargeButton.imageView?.image else { return }
        guard let plusDownLeftImage = plusDownLeftButton.imageView?.image else { return }
        guard let plusDownRightImage = plusDownRightButton.imageView?.image else { return }
        guard let plusDownLargeImage = plusDownLargeButton.imageView?.image else { return }
        
        animation.swipeAnimation(viewController: self)
        switch self.select {
        case .mode1:
            checkMode1() ? finalPhoto = mergeImages(topLeftImage: plusUpLargeImage,
                                                    topRightImage: plusUpRightImage,
                                                    bottomLeftImage: plusDownLeftImage,
                                                    bottomRightImage: plusDownRightImage) : alert.missingImage(viewController: self)
        case .mode2:
            checkMode2() ? finalPhoto = mergeImages(topLeftImage: plusUpLeftImage,
                                                    topRightImage: plusUpRightImage,
                                                    bottomLeftImage: plusDownLargeImage,
                                                    bottomRightImage: plusDownRightImage) : alert.missingImage(viewController: self)
        case .mode3:
            checkMode3() ? finalPhoto = mergeImages(topLeftImage: plusUpLeftImage,
                                                    topRightImage: plusUpRightImage,
                                                    bottomLeftImage: plusDownLeftImage,
                                                    bottomRightImage: plusDownRightImage) : alert.missingImage(viewController: self)
            break
        }
        
        guard finalPhoto != nil else { return }
        
        presentUiActivityController(finalPhoto: finalPhoto!)
    }
    
    // MARK: - File private
    
    fileprivate func setPhotoContentMode(imageViewMode1Hidden: Bool, imageViewMode2Hidden: Bool, imageViewMode3Hidden: Bool, imageViewUpLeftHidden: Bool, imageViewUpLargeHidden: Bool, imageViewDownLeftHidden: Bool, downLargeHidden: Bool) {

        mode1SelectionImageView.isHidden = imageViewMode1Hidden
        mode2SelectionImageView.isHidden = imageViewMode2Hidden
        mode3SelectionImageView.isHidden = imageViewMode3Hidden
        
        plusUpLeftButton.isHidden = imageViewUpLeftHidden
        plusUpLargeButton.isHidden = imageViewUpLargeHidden
        
        plusDownLeftButton.isHidden = imageViewDownLeftHidden
        plusDownLargeButton.isHidden = downLargeHidden
    }
        
    fileprivate func presentUiActivityController(finalPhoto: UIImage) {
        let uiActivityController = UIActivityViewController(activityItems: [finalPhoto] as [Any], applicationActivities: nil)
        present(uiActivityController, animated: true)
    }
    
    fileprivate func mergeImages(topLeftImage: UIImage, topRightImage: UIImage,
                     bottomLeftImage: UIImage, bottomRightImage: UIImage) -> UIImage? {
        
        let widthImage = upHStackView.frame.size.width
        let heightImage = upHStackView.frame.size.height * 2
        
        let width = widthImage / 2
        let height = heightImage / 2
        
        let size = CGSize(width: widthImage, height: heightImage)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        if select == .mode1 {
            topLeftImage.draw(in: CGRect(x:0, y: 0, width: widthImage, height: height))
            bottomLeftImage.draw(in: CGRect(x: 0, y: height, width: width, height: height))
            bottomRightImage.draw(in: CGRect(x: width, y: height, width: width, height: height))
        } else if select == .mode2 {
            topLeftImage.draw(in: CGRect(x:0, y: 0, width: width, height: height))
            topRightImage.draw(in: CGRect(x: width, y: 0, width: width, height: height))
            bottomLeftImage.draw(in: CGRect(x: 0, y: height, width: widthImage, height: height))
        } else if select == .mode3 {
            topLeftImage.draw(in: CGRect(x:0, y: 0, width: width, height: height))
            topRightImage.draw(in: CGRect(x: width, y: 0, width: width, height: height))
            bottomLeftImage.draw(in: CGRect(x: 0, y: height, width: width, height: height))
            bottomRightImage.draw(in: CGRect(x: width, y: height, width: width, height: height))
        }
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
        
    fileprivate func checkMode1() -> Bool {
        return plusUpLargeButton.image(for: .normal) != Constants.plusImage &&
            plusDownLeftButton.image(for: .normal) != Constants.plusImage &&
            plusDownRightButton.image(for: .normal) != Constants.plusImage
    }
    
    fileprivate func checkMode2() -> Bool {
        return plusUpLeftButton.image(for: .normal) != Constants.plusImage &&
            plusUpRightButton.image(for: .normal) != Constants.plusImage &&
            plusDownLargeButton.image(for: .normal) != Constants.plusImage
    }
    
    fileprivate func checkMode3() -> Bool {
        return plusUpLeftButton.image(for: .normal) != Constants.plusImage &&
        plusUpRightButton.image(for: .normal) != Constants.plusImage &&
        plusDownLeftButton.image(for: .normal) != Constants.plusImage &&
        plusDownRightButton.image(for: .normal) != Constants.plusImage
    }
}

