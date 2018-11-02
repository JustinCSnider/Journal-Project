//
//  Entry.swift
//  Journal
//
//  Created by Justin Snider on 11/2/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import Foundation

class Entry {
    var title: String
    var description: String
    var currentDate: Date
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        currentDate = Date.init()
    }
}
