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
    
    private var titleLabel: UILabel!
    private var arrowUpImageView: UIImageView!
    private var swipeUpLabel: UILabel!
    private var photoContentStackView: UIStackView!
    
    private var upHStackView: UIStackView!
    private var plusUpLeftButton: UIButton!
    private var plusUpRightButton: UIButton!
    private var plusUpLargeButton: UIButton!

    private var downHStackView: UIStackView!
    private var plusDownLeftButton: UIButton!
    private var plusDownRightButton: UIButton!
    private var plusDownLargeButton: UIButton!
    
    private var selectedModeHStackView: UIStackView!
    private var mode1Button: UIButton!
    private var mode2Button: UIButton!
    private var mode3Button: UIButton!
    private var mode1SelectionImageView: UIImageView!
    private var mode2SelectionImageView: UIImageView!
    private var mode3SelectionImageView: UIImageView!

    // MARK: - Properties
    
    var manager = Manager.shared
    private var data: [Data] = []

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
        
        mode1SelectionImageView.isHidden = true
        mode2SelectionImageView.isHidden = true
        plusUpLargeButton.isHidden = true
        plusDownLargeButton.isHidden = true
     }
    
    // MARK: - Action
    
    // Mode selection
    
    @objc func didSelectMode1Button(_ sender: UIButton) {
        setPhotoContentMode1()
    }
    
    @objc func didSelectMode2Button(_ sender: UIButton) {
        setPhotoContentMode2()
    }
    
    @objc func didSelectMode3Button(_ sender: UIButton) {
        setPhotoContentMode3()
    }
    
    // Add photo
    
    @objc func didPressUpLeftButton(_ sender: UIButton) {
        addPhotoUpLeft()
    }
    
    @objc func didPressUpRightButton(_ sender: UIButton) {
        addPhotoUpRight()
    }
    
    @objc func didPressUpLargeButton(_ sender: UIButton) {
        addPhotoUpLarge()
    }
    
    @objc func didPressDownLeftButton(_ sender: UIButton) {
        addPhotoDownLeft()
    }
    
    @objc func didPressDownRightButton(_ sender: UIButton) {
        addPhotoUpRight()
    }
    
    @objc func didPressDownLargeButton(_ sender: UIButton) {
        addPhotoDownLarge()
    }
    
    // MARK: - File private
    
    fileprivate func setPhotoContentMode1() {
        mode1SelectionImageView.isHidden = false
        mode2SelectionImageView.isHidden = true
        mode3SelectionImageView.isHidden = true
        
        plusUpLeftButton.isHidden = true
        plusUpRightButton.isHidden = true
        plusUpLargeButton.isHidden = false
        plusUpLargeButton.imageView?.contentMode = .scaleAspectFill
        
        plusDownLeftButton.isHidden = false
        plusDownRightButton.isHidden = false
        plusDownLargeButton.isHidden = true
    }
    
    fileprivate func setPhotoContentMode2() {

        mode2SelectionImageView.isHidden = false
        mode3SelectionImageView.isHidden = true
        mode1SelectionImageView.isHidden = true
    
        plusUpLeftButton.isHidden = false
        plusUpRightButton.isHidden = false
        plusUpLargeButton.isHidden = true
    
        plusDownLeftButton.isHidden = true
        plusDownRightButton.isHidden = true
        plusDownLargeButton.isHidden = false
        plusDownLargeButton.imageView?.contentMode = .scaleAspectFill
    }
    
    fileprivate func setPhotoContentMode3() {
        mode3SelectionImageView.isHidden = false
        mode1SelectionImageView.isHidden = true
        mode2SelectionImageView.isHidden = true
        
        plusUpLeftButton.isHidden = false
        plusUpRightButton.isHidden = false
        plusDownLeftButton.isHidden = false
        plusDownRightButton.isHidden = false
        
        plusUpLargeButton.isHidden = true
        plusDownLargeButton.isHidden = true
    }
    
    fileprivate func addPhotoUpLeft() {
        print("addPhotoUpLeft")
    }
    
    fileprivate func addPhotoUpRight() {
        print("addPhotoUpRight")
    }
    
    fileprivate func addPhotoUpLarge() {
        print("addPhotoUpLarge")
    }
    
    fileprivate func addPhotoDownLeft() {
        print("addPhotoDownLeft")
    }
    
    fileprivate func addPhotoDownRight() {
        print("addPhotoDownRight")
    }
    
    fileprivate func addPhotoDownLarge() {
        print("addPhotoDownLarge")
    }

}

// MARK: - Return Outlets

extension ViewController {
    
    func returnLabel(tintColor: UIColor = .white, font: UIFont = UIFont(name: "ThirstySoftRegular", size: 52)!, text: String) -> UILabel {
        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = tintColor
            label.font = font
            label.text = text
            label.numberOfLines = 0
            label.textAlignment = .center
            
            return label
        }()
        view.addSubview(label)
        return label
    }
    
    func returnImageView(image: UIImage) -> UIImageView {
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = image
            
            return imageView
        }()
        view.addSubview(imageView)
        return imageView
    }
    
    func returnStackView(backgroundColor: UIColor) -> UIStackView {
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = backgroundColor
            
            return stackView
        }()
        self.view.addSubview(stackView)
        return stackView
    }
    
    func returnButton(image: UIImage) -> UIButton {
        let button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(image, for: .normal)
            
            return button
        }()
        self.view.addSubview(button)
        return button
    }
}

// MARK: - Constraints

extension ViewController {
    
    fileprivate func titleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12)
        ])
    }
    
    fileprivate func arrowUpImageViewConstraints() {
        NSLayoutConstraint.activate([
            arrowUpImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            arrowUpImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arrowUpImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.02),
            arrowUpImageView.widthAnchor.constraint(equalTo: arrowUpImageView.heightAnchor, multiplier: 1.4)
        ])
    }
    
    fileprivate func swipeUpLabelConstraints() {
        NSLayoutConstraint.activate([
            swipeUpLabel.topAnchor.constraint(equalTo: arrowUpImageView.bottomAnchor, constant: 10),
            swipeUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swipeUpLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
    
    fileprivate func photoContentStackViewConstraints() {
        NSLayoutConstraint.activate([
            photoContentStackView.topAnchor.constraint(equalTo: swipeUpLabel.bottomAnchor, constant: 15),
            photoContentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoContentStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.42, constant: 0),
            photoContentStackView.widthAnchor.constraint(equalTo: photoContentStackView.heightAnchor, multiplier: 1, constant: 0)
        ])
    }
    
    fileprivate func upHStackViewConstraints() {
        NSLayoutConstraint.activate([
            upHStackView.topAnchor.constraint(equalTo: photoContentStackView.topAnchor, constant: 10),
            upHStackView.leadingAnchor.constraint(equalTo: photoContentStackView.leadingAnchor, constant: 10),
            upHStackView.trailingAnchor.constraint(equalTo: photoContentStackView.trailingAnchor, constant: -10),
            upHStackView.heightAnchor.constraint(equalTo: photoContentStackView.heightAnchor, multiplier: 0.5, constant: -15)
        ])
    }
    
    fileprivate func plusUpLeftButtonConstraints() {
        NSLayoutConstraint.activate([
            plusUpLeftButton.topAnchor.constraint(equalTo: upHStackView.topAnchor, constant: 0),
            plusUpLeftButton.bottomAnchor.constraint(equalTo: upHStackView.bottomAnchor, constant: 0),
            plusUpLeftButton.leadingAnchor.constraint(equalTo: upHStackView.leadingAnchor, constant: 0),
            plusUpLeftButton.widthAnchor.constraint(equalTo: upHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    fileprivate func plusUpRightButtonConstraints() {
        NSLayoutConstraint.activate([
            plusUpRightButton.topAnchor.constraint(equalTo: upHStackView.topAnchor, constant: 0),
            plusUpRightButton.bottomAnchor.constraint(equalTo: upHStackView.bottomAnchor, constant: 0),
            plusUpRightButton.trailingAnchor.constraint(equalTo: upHStackView.trailingAnchor, constant: 0),
            plusUpRightButton.widthAnchor.constraint(equalTo: upHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    fileprivate func plusUpLargeButtonConstraints() {
        NSLayoutConstraint.activate([
            plusUpLargeButton.topAnchor.constraint(equalTo: upHStackView.topAnchor, constant: 0),
            plusUpLargeButton.bottomAnchor.constraint(equalTo: upHStackView.bottomAnchor, constant: 0),
            plusUpLargeButton.trailingAnchor.constraint(equalTo: upHStackView.trailingAnchor, constant: 0),
            plusUpLargeButton.leadingAnchor.constraint(equalTo: upHStackView.leadingAnchor, constant: 0)
        ])
    }
    
    fileprivate func downHStackViewConstraints() {
        NSLayoutConstraint.activate([
            downHStackView.bottomAnchor.constraint(equalTo: photoContentStackView.bottomAnchor, constant: -10),
            downHStackView.leadingAnchor.constraint(equalTo: photoContentStackView.leadingAnchor, constant: 10),
            downHStackView.trailingAnchor.constraint(equalTo: photoContentStackView.trailingAnchor, constant: -10),
            downHStackView.heightAnchor.constraint(equalTo: photoContentStackView.heightAnchor, multiplier: 0.5, constant: -15)
        ])
    }
    
    fileprivate func plusDownLeftButtonConstraints() {
        NSLayoutConstraint.activate([
            plusDownLeftButton.topAnchor.constraint(equalTo: downHStackView.topAnchor, constant: 0),
            plusDownLeftButton.bottomAnchor.constraint(equalTo: downHStackView.bottomAnchor, constant: 0),
            plusDownLeftButton.leadingAnchor.constraint(equalTo: downHStackView.leadingAnchor, constant: 0),
            plusDownLeftButton.widthAnchor.constraint(equalTo: downHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    fileprivate func plusDownRightButtonConstraints() {
        NSLayoutConstraint.activate([
            plusDownRightButton.topAnchor.constraint(equalTo: downHStackView.topAnchor, constant: 0),
            plusDownRightButton.bottomAnchor.constraint(equalTo: downHStackView.bottomAnchor, constant: 0),
            plusDownRightButton.trailingAnchor.constraint(equalTo: downHStackView.trailingAnchor, constant: 0),
            plusDownRightButton.widthAnchor.constraint(equalTo: downHStackView.widthAnchor, multiplier: 0.5, constant: -5)
        ])
    }
    
    fileprivate func plusDownLargeButtonButtonConstraints() {
        NSLayoutConstraint.activate([
            plusDownLargeButton.topAnchor.constraint(equalTo: downHStackView.topAnchor, constant: 0),
            plusDownLargeButton.bottomAnchor.constraint(equalTo: downHStackView.bottomAnchor, constant: 0),
            plusDownLargeButton.leadingAnchor.constraint(equalTo: downHStackView.leadingAnchor, constant: 0),
            plusDownLargeButton.trailingAnchor.constraint(equalTo: downHStackView.trailingAnchor, constant: 0)
        ])
    }
    
    fileprivate func selectedModeHStackViewConstraints() {
        let selectedModeHStackViewWidth = self.view.frame.width - 40
        let selectedModeHStackViewHeight = (selectedModeHStackViewWidth - selectedModeHStackViewWidth * 0.1) / 3
        let roomSpace = (1 - 0.62) * view.frame.height
        
        NSLayoutConstraint.activate([
            selectedModeHStackView.centerYAnchor.constraint(equalTo: photoContentStackView.bottomAnchor, constant: roomSpace/2 - selectedModeHStackViewHeight/2),
            selectedModeHStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectedModeHStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            selectedModeHStackView.heightAnchor.constraint(equalToConstant: selectedModeHStackViewHeight),
        ])
    }
    
    fileprivate func mode1ButtonConstraints() {
        NSLayoutConstraint.activate([
            mode1Button.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode1Button.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode1Button.leadingAnchor.constraint(equalTo: selectedModeHStackView.leadingAnchor, constant: 0),
            mode1Button.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0),
            mode1SelectionImageView.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode1SelectionImageView.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode1SelectionImageView.leadingAnchor.constraint(equalTo: selectedModeHStackView.leadingAnchor, constant: 0),
            mode1SelectionImageView.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0),
        ])
    }
    
    fileprivate func mode2ButtonConstraints() {
        NSLayoutConstraint.activate([
            mode2Button.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode2Button.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode2Button.centerXAnchor.constraint(equalTo: selectedModeHStackView.centerXAnchor),
            mode2Button.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0),
            mode2SelectionImageView.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode2SelectionImageView.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode2SelectionImageView.centerXAnchor.constraint(equalTo: selectedModeHStackView.centerXAnchor),
            mode2SelectionImageView.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0),
        ])
    }
    
    fileprivate func mode3ButtonConstraints() {
        NSLayoutConstraint.activate([
            mode3Button.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode3Button.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode3Button.trailingAnchor.constraint(equalTo: selectedModeHStackView.trailingAnchor, constant: 0),
            mode3Button.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0),
            mode3SelectionImageView.bottomAnchor.constraint(equalTo: selectedModeHStackView.bottomAnchor, constant: 0),
            mode3SelectionImageView.topAnchor.constraint(equalTo: selectedModeHStackView.topAnchor, constant: 0),
            mode3SelectionImageView.trailingAnchor.constraint(equalTo: selectedModeHStackView.trailingAnchor, constant: 0),
            mode3SelectionImageView.widthAnchor.constraint(equalTo: selectedModeHStackView.widthAnchor, multiplier: 0.3, constant: 0),
        ])
    }
}

// MARK: - Implement Outlets

extension ViewController {
    func implementOutlets() {
        view.backgroundColor = Constants.blueLight
        guard let data = data.first else { return }
        // Title
        titleLabel = returnLabel(text: data.title)
        titleLabelConstraints()
        
        // Arrow
        arrowUpImageView = returnImageView(image: UIImage(named: "arrow-up")!)
        arrowUpImageViewConstraints()
        
        // Swipe up
        swipeUpLabel = returnLabel(font: Constants.delmMedium!, text: data.swipeText)
        swipeUpLabelConstraints()
        
        // PhotoContentView
        photoContentStackView = returnStackView(backgroundColor: Constants.blueDark!)
        photoContentStackViewConstraints()
        
        // UpHStackView
        upHStackView = returnStackView(backgroundColor: Constants.blueDark!)
        upHStackViewConstraints()
        // PlusUpLeftButton
        plusUpLeftButton = returnButton(image: UIImage(named: "plus")!)
        plusUpLeftButton.addTarget(self, action: #selector(didPressUpLeftButton), for: .touchUpInside)
        plusUpLeftButtonConstraints()
        // PlusUpRightButton
        plusUpRightButton = returnButton(image: UIImage(named: "plus")!)
        plusUpRightButton.addTarget(self, action: #selector(didPressUpRightButton), for: .touchUpInside)
        plusUpRightButtonConstraints()
        // PlusUpLargeButton
        plusUpLargeButton = returnButton(image: UIImage(named: "plus")!)
        plusUpLargeButton.addTarget(self, action: #selector(didPressUpLargeButton), for: .touchUpInside)
        plusUpLargeButtonConstraints()

        // DownHStackView
        downHStackView = returnStackView(backgroundColor: Constants.blueDark!)
        downHStackViewConstraints()
        // PlusDownLeftButton
        plusDownLeftButton = returnButton(image: UIImage(named: "plus")!)
        plusDownLeftButton.addTarget(self, action: #selector(didPressDownLeftButton), for: .touchUpInside)
        plusDownLeftButtonConstraints()
        // PlusDownRightButton
        plusDownRightButton = returnButton(image: UIImage(named: "plus")!)
        plusDownRightButton.addTarget(self, action: #selector(didPressDownRightButton), for: .touchUpInside)
        plusDownRightButtonConstraints()
        // PlusDownLargeButton
        plusDownLargeButton = returnButton(image: UIImage(named: "plus")!)
        plusDownLargeButton.addTarget(self, action: #selector(didPressDownLargeButton), for: .touchUpInside)
        plusDownLargeButtonButtonConstraints()
        
        // selectedModeHStackView
        selectedModeHStackView = returnStackView(backgroundColor: .clear)
        selectedModeHStackViewConstraints()
        
        // mode1Button
        mode1Button = returnButton(image: UIImage(named: "selected-1")!)
        mode1SelectionImageView = returnImageView(image: UIImage(named: "selection")!)
        mode1Button.addTarget(self, action: #selector(didSelectMode1Button), for: .touchUpInside)
        mode1ButtonConstraints()
        
        // mode2Button
        mode2Button = returnButton(image: UIImage(named: "selected-2")!)
        mode2SelectionImageView = returnImageView(image: UIImage(named: "selection")!)
        mode2Button.addTarget(self, action: #selector(didSelectMode2Button), for: .touchUpInside)
        mode2ButtonConstraints()
        
        // mode3Button
        mode3Button = returnButton(image: UIImage(named: "selected-3")!)
        mode3SelectionImageView = returnImageView(image: UIImage(named: "selection")!)
        mode3Button.addTarget(self, action: #selector(didSelectMode3Button), for: .touchUpInside)
        mode3ButtonConstraints()
    }
}

