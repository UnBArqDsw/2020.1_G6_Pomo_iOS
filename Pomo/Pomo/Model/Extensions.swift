//
//  Extensions.swift
//  Pomo
//
//  Created by João Medeiros on 16/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI
import SwiftyChat

extension Color {
    static let chatBlue = Color(#colorLiteral(red: 0.1405690908, green: 0.1412397623, blue: 0.25395751, alpha: 1))
    static let chatGray = Color(#colorLiteral(red: 0.7861273885, green: 0.7897668481, blue: 0.7986581922, alpha: 1))
}

let futuraFont = Font.custom("Futura", size: 17)

internal extension ChatMessageCellStyle {
    
    static let basicStyle = ChatMessageCellStyle(
        incomingTextStyle: .init(
            textStyle: .init(textColor: .black),
            textPadding: 16,
            attributedTextStyle: .init(textColor: .black),
            cellBackgroundColor: Color.chatGray,
            cellBorderWidth: 0,
            cellShadowRadius: 0
        ),
        outgoingTextStyle: .init(
            textStyle: .init(textColor: .white),
            textPadding: 16,
            cellBackgroundColor: Color.chatBlue,
            cellBorderWidth: 0,
            cellShadowRadius: 0
        ),
        incomingAvatarStyle: .init(imageStyle: .init(imageSize: .zero))
    )
    
}
