//
//  userViewModel.swift
//  Co-Star-App
//
//  Created by Robert Brennan on 7/10/19.
//  Copyright © 2019 Creatility. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import enum Result.NoError

struct UserViewModel {
    let user: MutableProperty<userInfo>

    init(user: userInfo) {
        self.user = MutableProperty(user)
    }
    
    var nameTextSignal: SignalProducer<String, NoError> {
        return user.producer.map { $0.name }
    }
}

