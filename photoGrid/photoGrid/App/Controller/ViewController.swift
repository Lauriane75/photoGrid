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
    var finalPhoto: UIImage? = nil
    var button: UIButton? = nil
    var select: SelectedMode = .mode3 {
        didSet {
        }
    }
    let alert = Alert()

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
        
        setPhotoContentMode(imageViewMode1Hidden: true, imageViewMode2Hidden: true, imageViewMode3Hidden: false, imageViewUpLeftHidden: false, imageViewUpRightHidden: false, imageViewUpLargeHidden: true, imageViewDownLeftHidden: false, imageViewDownRightHidden: false, downLargeHidden: true)
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
        setPhotoContentMode(imageViewMode1Hidden: false, imageViewMode2Hidden: true, imageViewMode3Hidden: true, imageViewUpLeftHidden: true, imageViewUpRightHidden: true, imageViewUpLargeHidden: false, imageViewDownLeftHidden: false, imageViewDownRightHidden: false, downLargeHidden: true)
    }
    
    @objc func didSelectMode2Button(_ sender: UIButton) {
        select = .mode2
        setPhotoContentMode(imageViewMode1Hidden: true, imageViewMode2Hidden: false, imageViewMode3Hidden: true, imageViewUpLeftHidden: false, imageViewUpRightHidden: false, imageViewUpLargeHidden: true, imageViewDownLeftHidden: true, imageViewDownRightHidden: true, downLargeHidden: false)
    }
    
    @objc func didSelectMode3Button(_ sender: UIButton) {
        select = .mode3
        setPhotoContentMode(imageViewMode1Hidden: true, imageViewMode2Hidden: true, imageViewMode3Hidden: false, imageViewUpLeftHidden: false, imageViewUpRightHidden: false, imageViewUpLargeHidden: true, imageViewDownLeftHidden: false, imageViewDownRightHidden: false, downLargeHidden: true)
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
        
        guard let plusUpLeftImage = plusUpLeftButton.imageView?.image else { return }
        guard let plusUpRightImage = plusUpRightButton.imageView?.image else { return }
        guard let plusUpLargeImage = plusUpLargeButton.imageView?.image else { return }
        guard let plusDownLeftImage = plusDownLeftButton.imageView?.image else { return }
        guard let plusDownRightImage = plusDownRightButton.imageView?.image else { return }
        guard let plusDownLargeImage = plusDownLargeButton.imageView?.image else { return }
        
        swipeAnimation()
        switch self.select {
        case .mode1:
            checkMode1() ? finalPhoto = mergeImages(topLeftImage: plusUpLargeImage, topRightImage: plusUpRightImage, bottomLeftImage: plusDownLeftImage, bottomRightImage: plusDownRightImage) : alert.missingImage(viewController: self)
        case .mode2:
            checkMode2() ? finalPhoto = mergeImages(topLeftImage: plusUpLeftImage, topRightImage: plusUpRightImage, bottomLeftImage: plusDownLargeImage, bottomRightImage: plusDownRightImage) : alert.missingImage(viewController: self)
        case .mode3:
            checkMode3() ? finalPhoto = mergeImages(topLeftImage: plusUpLeftImage, topRightImage: plusUpRightImage, bottomLeftImage: plusDownLeftImage, bottomRightImage: plusDownRightImage) : alert.missingImage(viewController: self)
            break
        }
        
        guard finalPhoto != nil else { return }
        
        presentUiActivityController()
    }
    
    // MARK: - File private
    
    fileprivate func setPhotoContentMode(imageViewMode1Hidden: Bool, imageViewMode2Hidden: Bool, imageViewMode3Hidden: Bool, imageViewUpLeftHidden: Bool, imageViewUpRightHidden: Bool, imageViewUpLargeHidden: Bool, imageViewDownLeftHidden: Bool, imageViewDownRightHidden: Bool, downLargeHidden: Bool) {

        mode1SelectionImageView.isHidden = imageViewMode1Hidden
        mode2SelectionImageView.isHidden = imageViewMode2Hidden
        mode3SelectionImageView.isHidden = imageViewMode3Hidden
        
        plusUpLeftButton.isHidden = imageViewUpLeftHidden
        plusUpRightButton.isHidden = imageViewUpRightHidden
        plusUpLargeButton.isHidden = imageViewUpLargeHidden
        
        plusDownLeftButton.isHidden = imageViewDownLeftHidden
        plusDownRightButton.isHidden = imageViewDownRightHidden
        plusDownLargeButton.isHidden = downLargeHidden
    }
        
    fileprivate func presentUiActivityController() {
        let uiActivityController = UIActivityViewController(activityItems: [finalPhoto!] as [Any], applicationActivities: nil)
        present(uiActivityController, animated: true)
    }
    
    fileprivate func mergeImages(topLeftImage: UIImage, topRightImage: UIImage,
                     bottomLeftImage: UIImage, bottomRightImage: UIImage) -> UIImage? {
        
        let widthImage = upHStackView.frame.size.width
        let heightImage = upHStackView.frame.size.height * 2
        let size = CGSize(width: widthImage, height: heightImage)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        if select == .mode1 {
            topLeftImage.draw(in: CGRect(x:0, y: 0, width: widthImage, height: heightImage/2))
            bottomLeftImage.draw(in: CGRect(x: 0, y: heightImage/2, width: widthImage/2, height: heightImage/2))
            bottomRightImage.draw(in: CGRect(x: widthImage/2, y: heightImage/2, width: widthImage/2, height: heightImage/2))
        } else if select == .mode2 {
            topLeftImage.draw(in: CGRect(x:0, y: 0, width: widthImage/2, height: heightImage/2))
            topRightImage.draw(in: CGRect(x: widthImage/2, y: 0, width: widthImage/2, height: heightImage/2))
            bottomLeftImage.draw(in: CGRect(x: 0, y: heightImage/2, width: widthImage, height: heightImage/2))
        } else if select == .mode3 {
            topLeftImage.draw(in: CGRect(x:0, y: 0, width: widthImage/2, height: heightImage/2))
            topRightImage.draw(in: CGRect(x: widthImage/2, y: 0, width: widthImage/2, height: heightImage/2))
            bottomLeftImage.draw(in: CGRect(x: 0, y: heightImage/2, width: widthImage/2, height: heightImage/2))
            bottomRightImage.draw(in: CGRect(x: widthImage/2, y: heightImage/2, width: widthImage/2, height: heightImage/2))
        }
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // Swipe final image
    fileprivate func swipeAnimation() {
        let animation = Animation()
        let swipePortrait = CGAffineTransform(translationX: 0, y: -view.frame.height * 0.3)
            UIView.animate(withDuration: 0.4, animations: {
                self.photoContentStackView.transform = swipePortrait
                self.upHStackView.transform = swipePortrait
                self.plusUpLeftButton.transform = swipePortrait
                self.plusUpRightButton.transform = swipePortrait
                self.plusUpLargeButton.transform = swipePortrait
                self.downHStackView.transform = swipePortrait
                self.plusDownLeftButton.transform = swipePortrait
                self.plusDownRightButton.transform = swipePortrait
                self.plusDownLargeButton.transform = swipePortrait
            }) { (success) in
                if (success) {
                    animation.AnimationDone(viewController: self)
            }
        }
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

