//
//  Person.swift
//  ChatApp
//
//  Created by Костина Вероника  on 18.06.2024.
//

import Foundation
import SwiftUI

struct Person {
    let name: String
    let surname: String?
    let imageName: String?
    let status: Status
    let lastSeen: String
    let hasStory: Bool
    
    var initials: String {
        if let surname {
            return String(name[name.startIndex]) + String(surname[surname.startIndex])
        }
        return String(name[name.startIndex])
    }
    
    var image: Image? {
        guard let imageName else {
            return nil
        }
        return Image(imageName)
    }
    
    var lastSeenString: String {
        switch status {
        case .online:
            return "Online"
        case .offline:
            return "Last seen \(lastSeen)"
        }
    }
}

extension Person: Hashable {
    
}

enum Status {
    case online
    case offline
}
