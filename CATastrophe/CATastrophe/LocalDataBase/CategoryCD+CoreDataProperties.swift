//
//  CategoryCD+CoreDataProperties.swift
//  CATastrophe
//
//  Created by Ferraz on 22/01/21.
//
//

import Foundation
import CoreData


extension CategoryCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryCD> {
        return NSFetchRequest<CategoryCD>(entityName: "CategoryCD")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?

}

extension CategoryCD : Identifiable {

}
