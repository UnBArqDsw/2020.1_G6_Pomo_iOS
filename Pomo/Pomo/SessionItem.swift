//
//  SessionItem.swift
//  Pomo
//
//  Created by João Medeiros on 20/05/20.
//  Copyright © 2020 Joao Medeiros. All rights reserved.
//

import Foundation
import CoreData

public class SessionItem: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var sessionDescription: String?
    @NSManaged public var icon: String?
}

extension SessionItem {
    static func getAllSessionItems() -> NSFetchRequest<SessionItem> {
        // create the request for fetching all existing elements
        let request: NSFetchRequest<SessionItem> = SessionItem.fetchRequest() as! NSFetchRequest<SessionItem>
        
        // sort items by name
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        // request with sort descriptor
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
