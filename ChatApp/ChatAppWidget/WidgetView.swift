//
//  WidgetView.swift
//  ChatAppWidgetExtension
//
//  Created by Костина Вероника  on 30.06.2024.
//

import SwiftUI

struct ChatAppWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            SmallSizeWidgetView(entry: entry)
        case .systemMedium:
            MediumSizeWidgetView(entry: entry)
        default: Text("Not implemented")
        }
    }
}
