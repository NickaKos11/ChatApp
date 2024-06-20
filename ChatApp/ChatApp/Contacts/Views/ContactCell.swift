//
//  ContactCell.swift
//  ChatApp
//
//  Created by Костина Вероника  on 20.06.2024.
//

import SwiftUI

struct ContactCell: View {
    var person: Person
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack() {
                AvatarView(image: person.image, initials: person.initials)
                StoryView(hasStory: person.hasStory, hasImage: person.image != nil ? true: false)
                StatusView(status: person.status)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(person.name + (person.surname != nil ? " \(person.surname!)" : ""))
                    .textFont(.body1)
                    .foregroundStyle(.mainText)
                    .padding(.top, 3)
                
                
                Text(person.lastSeenString)
                    .textFont(.metadata1)
                    .foregroundStyle(.lightText)
            }
        }
        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
    }
}

#Preview {
    ContactCell(person: Person(name: "Анастасия", surname: "Иванова", imageName: "Avatar", status: .online, lastSeen: "yesterday", hasStory: true))
}
