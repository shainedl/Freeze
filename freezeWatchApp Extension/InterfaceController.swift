//
//  InterfaceController.swift
//  freezeWatchApp Extension
//
//  Created by Anmol Seth on 3/12/19.
//  Copyright © 2019 freeze. All rights reserved.
//

import WatchKit

class InterfaceController: WKInterfaceController {
    
    // MARK: - Outlets
    
    @IBOutlet var heartRateLabel: WKInterfaceLabel!
    @IBOutlet var controlButton: WKInterfaceButton!
    @IBOutlet weak var alertNotification: WKInterfaceLabel!
    
    // MARK: - Properties
    
    private let workoutManager = WorkoutManager()
    
    // MARK: - Lifecycle
    
    override func willActivate() {
        super.willActivate()
        
        // Configure workout manager.
        workoutManager.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func didTapButton() {
        switch workoutManager.state {
        case .started:
            // Stop current workout.
            workoutManager.stop()
            break
        case .stopped:
            // Start new workout.
            workoutManager.start()
            break
        }
    }
    
}

// MARK: - Workout Manager Delegate

extension InterfaceController: WorkoutManagerDelegate {
    func workoutManager(_ manager: WorkoutManager, didChangeAlertSendTo newAlertSend: Bool) {
        if(newAlertSend){
        alertNotification.setText("Alert Sent")
        }
        else{
            alertNotification.setText("Alert Sent") 
        }
    }
    
    
    func workoutManager(_ manager: WorkoutManager, didChangeStateTo newState: WorkoutState) {
        // Update title of control button.
        controlButton.setTitle(newState.actionText())
    }
    
    func workoutManager(_ manager: WorkoutManager, didChangeHeartRateTo newHeartRate: HeartRate) {
        // Update heart rate label.
        heartRateLabel.setText(String(format: "%.0f", newHeartRate.bpm))
    }
    
}
