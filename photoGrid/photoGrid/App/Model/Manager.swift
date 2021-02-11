//
//  Manager.swift
//  photoGrid
//
//  Created by Lau on 04/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import Foundation
import UIKit

struct Datas: Decodable {
    let title: String
    let swipeText: String
    let imageText: [String]
}

class Manager {
    
    static let shared = Manager()
    
    private var datas: [Datas] = []
    private var imagesString: [String] = []

    func getData() -> [Datas] {
        datas = [Datas(title: "Photogrid", swipeText: "Swipe up to share", imageText: imagesString)]
        return datas
    }
    
    func saveImages(imagesString: [String]) {
        self.imagesString = imagesString
    }

}
