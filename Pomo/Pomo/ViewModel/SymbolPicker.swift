//
//  SymbolPicker.swift
//  Pomo
//
//  Created by João Medeiros on 17/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct SymbolPicker: View {
    @Binding var symbolName: String
    
    var columns = [
        GridItem(.adaptive(minimum: 20)),
        GridItem(.adaptive(minimum: 20)),
        GridItem(.adaptive(minimum: 20))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                LazyHGrid(rows: columns) {
                    ForEach(symbols, id: \.self) { item in
                        Button(action: { symbolName = item }) {
                            Image(systemName: item)
                                .foregroundColor(.primary)
                                
                        }
                        
                    }
                }
            }
            .frame(maxWidth: 250, maxHeight: 80)
            .padding(.horizontal, 800)
        }
    }
}

@available(iOS 14.0, *)
struct SymbolPicker_Previews: PreviewProvider {
    static var previews: some View {
        SymbolPicker(symbolName: .constant("paperplane"))
    }
}

//MARK: fixed symbols list
var symbols = ["drop",
               "drop.fill",
               "drop.triangle",
               "drop.triangle.fill",
               "e.circle",
               "e.circle.fill",
               "e.square",
               "e.square.fill",
               "ear",
               "ear.badge.checkmark",
               "ear.fill",
               "ear.trianglebadge.exclamationmark",
               "earpods",
               "eject",
               "eject.circle",
               "eject.circle.fill",
               "eject.fill",
               "ellipsis",
               "ellipsis.bubble",
               "ellipsis.bubble.fill",
               "ellipsis.circle",
               "ellipsis.circle.fill",
               "ellipsis.rectangle",
               "ellipsis.rectangle.fill",
               "envelope",
               "envelope.arrow.triangle.branch",
               "envelope.arrow.triangle.branch.fill",
               "envelope.badge",
               "envelope.badge.fill",
               "envelope.badge.shield.leadinghalf.fill",
               "envelope.circle",
               "envelope.circle.fill",
               "envelope.fill",
               "envelope.fill.badge.shield.trailinghalf.fill",
               "envelope.open",
               "envelope.open.fill",
               "equal",
               "equal.circle",
               "equal.circle.fill",
               "equal.square",
               "equal.square.fill",
               "escape",
               "esim",
               "esim.fill",
               "eurosign.circle",
               "eurosign.circle.fill",
               "eurosign.square",
               "eurosign.square.fill",
               "exclamationmark",
               "exclamationmark.2",
               "exclamationmark.3",
               "exclamationmark.arrow.circlepath",
               "exclamationmark.arrow.triangle.2.circlepath",
               "exclamationmark.bubble",
               "exclamationmark.bubble.fill",
               "exclamationmark.circle",
               "exclamationmark.circle.fill",
               "exclamationmark.icloud",
               "exclamationmark.icloud.fill",
               "exclamationmark.octagon",
               "f.circle",
               "f.circle.fill",
               "f.cursive",
               "f.cursive.circle",
               "f.cursive.circle.fill",
               "f.square",
               "f.square.fill",
               "face.dashed",
               "face.dashed.fill",
               "face.smiling",
               "face.smiling.fill",
               "faceid",
               "faxmachine",
               "fiberchannel",
               "figure.stand",
               "figure.stand.line.dotted.figure.stand",
               "figure.walk",
               "figure.walk.circle",
               "figure.walk.circle.fill",
               "figure.walk.diamond",
               "figure.walk.diamond.fill",
               "figure.wave",
               "figure.wave.circle",
               "figure.wave.circle.fill",
               "filemenu.and.cursorarrow",
               "filemenu.and.selection",
               "film",
               "film.fill",
               "flag",
               "flag.badge.ellipsis",
               "flag.badge.ellipsis.fill",
               "flag.circle",
               "flag.circle.fill",
               "flag.fill",
               "flag.slash",
               "flag.slash.circle",
               "flag.slash.circle.fill",
               "flag.slash.fill",
               "flame",
               "flame.fill",
               "flashlight.off.fill",
               "flashlight.on.fill",
               "flipphone",
               "florinsign.circle",
               "florinsign.circle.fill",
               "florinsign.square",
               "florinsign.square.fill",
               "flowchart",
               "flowchart.fill",
               "fn",
               "folder",
               "folder.badge.gear",
               "folder.badge.minus",
               "folder.badge.person.crop",
               "folder.badge.plus",
               "folder.badge.questionmark",
               "folder.circle",
               "folder.circle.fill",
               "folder.fill",
               "folder.fill.badge.gear",
               "folder.fill.badge.minus",
               "folder.fill.badge.person.crop",
               "folder.fill.badge.plus",
               "folder.fill.badge.questionmark",
               "forward",
               "forward.end",
               "forward.end.alt",
               "forward.end.alt.fill",
               "forward.end.fill",
               "forward.fill",
               "forward.frame",
               "forward.frame.fill",
               "francsign.circle",
               "francsign.circle.fill",
               "francsign.square",
               "francsign.square.fill",
               "function",
               "fx",
               "g.circle",
               "g.circle.fill",
               "g.square",
               "g.square.fill",
               "gamecontroller",
               "gamecontroller.fill",
               "gauge",
               "gauge.badge.minus",
               "gauge.badge.plus",
               "gear",
               "gearshape",
               "gearshape.2",
               "gearshape.2.fill",
               "gearshape.fill",
               "gift",
               "gift.circle",
               "gift.circle.fill",
               "gift.fill",
               "giftcard",
               "giftcard.fill",
               "globe",
               "gobackward",
               "gobackward.10",
               "gobackward.15",
               "gobackward.30",
               "gobackward.45",
               "gobackward.60",
               "gobackward.75",
               "gobackward.90",
               "gobackward.minus",
               "goforward",
               "goforward.10",
               "goforward.15",
               "goforward.30",
               "goforward.45",
               "goforward.60",
               "goforward.75",
               "goforward.90",
               "goforward.plus",
               "graduationcap",
               "graduationcap.fill",
               "greaterthan",
               "greaterthan.circle",
               "greaterthan.circle.fill",
               "greaterthan.square",
               "greaterthan.square.fill",
               "greetingcard",
               "greetingcard.fill",
               "grid",
               "grid.circle",
               "grid.circle.fill",
               "guaranisign.circle",
               "guaranisign.circle.fill",
               "guaranisign.square",
               "guaranisign.square.fill",
               "guitars",
               "guitars.fill",
               "gyroscope",
               "h.circle",
               "h.circle.fill",
               "h.square",
               "h.square.fill",
               "h.square.fill.on.square.fill",
               "h.square.on.square",
               "hammer",
               "hammer.fill",
               "hand.draw",
               "hand.draw.fill"]
