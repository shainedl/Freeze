//
//  HKUnit+BeatsPerMinute.swift
//  freezeWatchApp Extension
//
//  Created by Anmol Seth on 3/12/19.
//  Copyright © 2019 freeze. All rights reserved.
//
import HealthKit

extension HKUnit {
    
    static func beatsPerMinute() -> HKUnit {
        return HKUnit.count().unitDivided(by: HKUnit.minute())
    }
    
}
