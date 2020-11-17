//
//  SessionPickerView.swift
//  Pomo
//
//  Created by João Medeiros on 07/11/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

struct SessionPickerView: View {
    @Binding var isSelected: Bool
    @Binding var selectedSession: String
    @FetchRequest(fetchRequest: SessionItem.getAllSessionItems()) var sessionItems: FetchedResults<SessionItem>
    @State private var pickerHeight: CGFloat = 50

    func setHeight() {
        if sessionItems.count > 5 {
            pickerHeight = 300
        } else if sessionItems.count == 0 {
            pickerHeight = 100
        } else {
            pickerHeight = CGFloat(sessionItems.count * 30 + 100)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(sessionItems, id: \.self) { item in
                    Button(action: {
                        selectedSession = item.name ?? "Session"
                        isSelected.toggle()
                    }) {
                        Text("\(item.name!)")
                    }
                    
                }
            }
            .frame(width: 150)
        }
        .frame(maxHeight: pickerHeight - 100)
        .onAppear{
            setHeight()
        }
    }
}

struct SessionPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPickerView(isSelected: .constant(true), selectedSession: .constant("Session"))
    }
}
