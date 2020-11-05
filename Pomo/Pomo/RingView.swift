//
//  RingView.swift
//  Pomo
//
//  Created by João Medeiros on 14/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var percentage: CGFloat = 8
    var timeStamp: Int
    var body: some View {
        let progress = 1 - percentage / CGFloat(timeStamp)
        
        return ZStack {
            Circle()
                .trim(from: progress, to: 1)
            .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 10, lineCap: .round))
            .frame(width: 200, height: 200)
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            .shadow(color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(0.3), radius: 10, x: 3, y: 3)
                
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(timeStamp: 10)
    }
}
