//
//  AvailableResponse.swift
//  iDroneControl
//
//  Created by FA21 on 22.09.21.
//

import Foundation
import CoatySwift

final class TaskControlResponse: CoatyObject{
    
    // MARK: - Class registration.
    override class var objectType: String {
        return register(objectType: "idrone.sync.availables", with: self)
    }
    
    init() {
        
    }

    enum CodingKeys: String, CodingKey{
        case NONE
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}
