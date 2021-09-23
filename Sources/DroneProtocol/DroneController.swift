//
//  DroneController.swift
//  iDroneControl
//
//  Created by FA21 on 22.09.21.
//

import CoatySwift
import Foundation
import RxSwift

/// A Coaty controller that invokes remote operations to control lights.
class DroneController: Controller {
    
    func taskStateUpdate(droneId: String, taskId: String, state: TaskMessage.TaskState) {
        let taskMessage = TaskMessage(droneId: droneId, taskId: taskId, state: state)
        
        // Create the event.
        let event = try! AdvertiseEvent.with(object: taskMessage)

        // Publish the event by the communication manager.
        self.communicationManager.publishAdvertise(event)
    }
    
    func retrieveAvailableTasks() {
        let query = QueryEvent.with(objectTypes: [AvailableResponse.objectType])
        
        self.communicationManager.publishQuery(query)
            .subscribe(onNext: { (resolveEvent) in
            // TODO
        })
        .disposed(by: self.disposeBag)
    }
}

