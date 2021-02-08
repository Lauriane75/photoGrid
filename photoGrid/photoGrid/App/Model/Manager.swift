//
//  Manager.swift
//  photoGrid
//
//  Created by Lau on 04/02/2021.
//  Copyright © 2021 Lauriane Haydari. All rights reserved.
//

import Foundation

struct Data: Decodable {
    let title: String
    let swipeText: String
}

class Manager {
    
    static let shared = Manager()
    
    private var data: [Data] = []
    
    func getData() -> [Data] {
        data = [Data(title: "Photogrid", swipeText: "Swipe up to share")]
        return data
    }
}

