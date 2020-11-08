//
//  ContentView.swift
//  Pomo
//
//  Created by João Medeiros on 14/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isPicking = false
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TimerView()
                Spacer()
                CapsulePicker()
                Spacer()
                
            }
            .padding(.top, 40)
            .onAppear {
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CapsulePicker: View {
    @State var isSelected: Bool = false
    @FetchRequest(fetchRequest: SessionItem.getAllSessionItems()) var sessionItems: FetchedResults<SessionItem>
    @State private var pickerHeight: CGFloat = 50
    @State private var selectedSession = "Session"
    
    func setHeight() {
        if sessionItems.count > 5 {
            pickerHeight = 250
        } else if sessionItems.count == 0 {
            pickerHeight = 100
        } else {
            pickerHeight = CGFloat(sessionItems.count * 30 + 100)
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .stroke(Color.red, lineWidth: 5)
                    .frame(width: 150, height: isSelected ? pickerHeight : 50, alignment: .center)
                    .shadow(color: Color.pink.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
                
                
                if isSelected {
                    SessionPickerView(isSelected: $isSelected, selectedSession: $selectedSession)
                        .offset(y: -pickerHeight/6)
        
                }
                HStack {
                    Text(selectedSession)
                    Spacer()
                    Image(systemName: "chevron.up.circle.fill")
                        .foregroundColor(.pink)
                        .rotationEffect(Angle(degrees: isSelected ? 180 : 0))
                    
                }
                .padding()
                .frame(width: 150, height: 50)
                .background(Color.white.opacity(0.001)) //make the entire capsule clickable
                
                
            }
            .onTapGesture {
                isSelected.toggle()
            }
            .animation(.easeInOut)
            
        }
        .onAppear {
            setHeight()
        }
    }
}
