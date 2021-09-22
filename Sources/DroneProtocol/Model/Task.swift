//
//  TaskStatus.swift
//  iDroneControl
//
//  Created by FA21 on 22.09.21.
//

import Foundation
import CoatySwift

final class TaskMessage: CoatyObject{
    
    // MARK: - Class registration.
    override class var objectType: String {
        return register(objectType: "idrone.sync.task", with: self)
    }
    
    // MARK: - Properties.
    
    var json: String
    
    
    // MARK: - Initializers.
    
    init(json:String) {
        self.json=json
        super.init(coreType: .CoatyObject,
                   objectType: Task.objectType,
                   objectId: .init(),
                   name: "Task")
    }
    
    // MARK: Codable methods.
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.json = try container.decode(String.self, forKey: .json)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(droneId, forKey: .json)
    }
}
