//
//  File.swift
//  
//
//  Created by FA21 on 21.09.21.
//

import Foundation

let instance = Registry()

class Registry {
    var actorList: [Actor] = []
    
    func register(actor: Actor){
        actorList.append(actor)
    }
    
    func broadcast(message: String){
        for actor in actorList{
            actor.receive(message: message)
        }
    }
}
