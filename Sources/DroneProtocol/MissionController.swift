//
//  MissionController.swift
//  iDroneControl
//
//  Created by FA21 on 22.09.21.
//


import CoatySwift
import Foundation
import RxSwift

/// A Coaty controller that invokes remote operations to control lights.
class MissionController: Controller {
    
    override func onInit() {
        super.onInit()
        
        try! self.communicationManager
            .observeQuery()
            .filter({ query in
                let types = query.data.objectTypes ?? []
                return types.contains(TaskControlResponse.objectType)
            }).subscribe({ event in
                let response = TaskControlResponse()
                let retrieveEvent = RetrieveEvent.with(objects: [response])
                event.element?.retrieve(retrieveEvent: retrieveEvent)
            })
            .disposed(by: self.disposeBag)
    }
    
    func publishForcedMissionEnd(droneId: String, taskId: String, retry: Bool = true){
        let taskMessage = TaskMessage(droneId: droneId, taskId: taskId, state: retry ? TaskMessage.TaskState.renew : TaskMessage.TaskState.dismissed)
        
        // Create the event.
        let event = try! AdvertiseEvent.with(object: taskMessage)

        // Publish the event by the communication manager.
        self.communicationManager.publishAdvertise(event)

    }
}

