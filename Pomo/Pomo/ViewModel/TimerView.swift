//
//  TimerView.swift
//  Pomo
//
//  Created by João Medeiros on 14/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import SwiftUI

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(type: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: type).impactOccurred()
}

struct TimerView: View {
    @ObservedObject var timerManager = TimerManager(secondsLeft: 1500)
    @GestureState var tap = false
    @State private var press = false
    @State private var start = false
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    Text(secondsToMinutesAndSeconds(seconds: Int(timerManager.secondsLeft)))
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .scaleEffect(timerManager.timerState == .initial ? 0.6 : 1)
                        .blur(radius: timerManager.timerState == .initial || timerManager.timerState == .paused ? 5 : 0)
                        .animation(nil)
                    
                    Image(systemName: "play.fill")
                        .font(.system(size: 70, weight: .semibold))
                        .foregroundColor(.black)
                        .scaleEffect(timerManager.timerState == .initial ? 1 : 0.001)
                        .blur(radius: timerManager.timerState == .initial ? 0 : 20)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .animation(.easeInOut)
                        
                    if timerManager.timerState == .paused {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 70, weight: .semibold))
                            .foregroundColor(.black)
                            .scaleEffect(timerManager.timerState == .paused ? 1 : 0.001)
                            .blur(radius: timerManager.timerState == .paused ? 0 : 20)
                            .shadow(color: Color.black.opacity(0.2), radius: 30, x: 10, y: 10)
                            .animation(.easeInOut)
                    }
                    
                    RingView(percentage: CGFloat(timerManager.secondsLeft), timeStamp: timerManager.intDate)
                        .animation(.easeInOut)
                }
                
                    
            }
            .frame(width: 250, height: 250)
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)

                    Circle()
                        .stroke(Color.clear, lineWidth: 10)
                        .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 3, x: -5, y: -5)

                    Circle()
                        .stroke(Color.clear, lineWidth: 10)
                        .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 3, x: 3, y: 3)
                }
            )
            .clipShape(Circle())
               .overlay(
                    Circle()
                        .trim(from: CGFloat(timerManager.secondsLeft), to: 0)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: 200, height: 200)
                        .rotationEffect(Angle(degrees: 90))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
                        .animation(.easeInOut)
                )
            .shadow(color: Color(press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), radius: 20, x: -20, y: -20)
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
            .scaleEffect(tap ? 1.3 : 1)
            .animation(.spring(response: 0.43, dampingFraction: 0.57, blendDuration: 0))
            .gesture(
                LongPressGesture(minimumDuration: 0.4, maximumDistance: 10).updating($tap){ currentState, gestureState, transaction in
                    gestureState = currentState
                }
                .onEnded { value in
                    self.press.toggle()
                    self.timerManager.timerState == .running ? self.timerManager.pause() : self.timerManager.start()
                    haptic(type: .success)
                    
                }
            )
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    self.timerManager.saveEndDate()
            }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    self.timerManager.timeInBackground()
            }

        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
