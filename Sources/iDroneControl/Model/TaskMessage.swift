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
        return register(objectType: "idrone.sync.taskmessage", with: self)
    }
    
    // MARK: - Properties.
    
    /// Determines whether the light is currently defect. The default value is `false`.
    var state: TaskState
    var id: UUID
    var time: 
    
    
    // MARK: - Initializers.
    
    init(id: UUID, state: TaskState) {
        self.state = state
        self.id = id
        super.init(coreType: .CoatyObject,
                   objectType: TaskMessage.objectType,
                   objectId: .init(),
                   name: "TaskMessage")
    }
    
    // MARK: Codable methods.
    
    enum TaskState: UInt8, Codable {
        case available
        case inProgress
        case finished
        case renew
        case dismissed
    }
    
    enum CodingKeys: String, CodingKey{
        case state
        case id
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(TaskState.self, forKey: .state)
        self.id = try container.decode(UUID.self, forKey: .id)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(state, forKey: .state)
        try container.encode(id, forKey: .id)
    }
}
