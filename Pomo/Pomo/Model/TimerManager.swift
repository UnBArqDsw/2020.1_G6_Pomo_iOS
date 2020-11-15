//
//  TimerManager.swift
//  Pomo
//
//  Created by João Medeiros on 14/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import Foundation
import AVFoundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerState: TimerState = .initial
    
    @Published var secondsLeft: TimeInterval = 10
    var endDate: Date?
    let endDateKey = "EndDate"
    var intDate: Int
    
    var timer = Timer()
    
    init(secondsLeft: TimeInterval) {
        self.secondsLeft = secondsLeft
        self.endDate = Date().addingTimeInterval(secondsLeft)
        self.intDate = Int(secondsLeft)
    }
    
//    func setTimerLength(minutes: Int) {
//        let defaults = UserDefaults.standard
//        defaults.set(minutes, forKey: "timerLength")
//        secondsLeft = minutes
//    }
    
    func start() {
        timerState = .running
        self.endDate = Date().addingTimeInterval(self.secondsLeft)
//        self.intDate = Int(secondsLeft)
        self.notifyUser()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft <= 0 {
                self.reset()
                self.playSound(soundId: 1005)
                self.endDate = nil
                
            }
            self.secondsLeft -= 1
//            print("\(self.intDate)")
        })
    }
    
    func reset() {
        self.timerState = .initial
        self.secondsLeft = TimeInterval(intDate + 1)
        timer.invalidate()
    }
    
    func pause() {
        self.timerState = .paused
        self.endDate = nil
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        timer.invalidate()
    }
    
    func notifyUser() {
        // configure local notification
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer finished."
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarm"))
        
        // date to dateComponents
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: endDate!)
        
        // configure notification trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // handle errors
            }
        }
    }
    
    func playSound(soundId: SystemSoundID) {
        let systemSoundId: SystemSoundID = soundId
        AudioServicesPlaySystemSound(systemSoundId)
    }
    
    func saveEndDate() {
        let defaults = UserDefaults.standard
        defaults.set(endDate, forKey: endDateKey)
        print("\(defaults) saved.")
    }
    
    func timeInBackground() {
        let defaults = UserDefaults.standard
        
        if let date = defaults.value(forKey: endDateKey) as? Date {
            if Date() > date {
                // time out
                self.secondsLeft = TimeInterval(0)

            } else {
                self.secondsLeft = date.timeIntervalSince(Date())
                print("the difference is: \(self.secondsLeft)")
                
                // start the timer
//                self.reset()
            }
            
            defaults.set(nil, forKey: endDateKey)
        }
    }
    
}
