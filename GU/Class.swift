//
//  Class.swift
//  GU
//
//  Created by Nicole Bien on 12/1/20.
//

import Foundation
//https://stackoverflow.com/questions/43405959/launch-a-local-notification-at-a-specific-time-in-ios

struct Class {
    var subject: String
    var name: String
    var meetingTime = DateInterval()
    var location: String
    
    init(withSubject subject: String, withName name: String, withMeetingTime meetingTime: DateInterval, withLocaiton location: String) {
        self.subject = subject
        self.name = name
        self.meetingTime = meetingTime
        self.location = location
    }
}


