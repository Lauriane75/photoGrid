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

    // MARK: - Properties

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
        view.backgroundColor = .red
     }

}

