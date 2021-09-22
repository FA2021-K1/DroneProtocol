//
//  AvailableResponse.swift
//  iDroneControl
//
//  Created by FA21 on 22.09.21.
//

import Foundation
import CoatySwift

final class AvailableResponse: CoatyObject{
    
    // MARK: - Class registration.
    override class var objectType: String {
        return register(objectType: "idrone.sync.availables", with: self)
    }

    
}
