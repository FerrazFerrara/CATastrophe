//
//  CatUpvote+CoreDataProperties.swift
//  CATastrophe
//
//  Created by Ferraz on 22/01/21.
//
//

import Foundation
import CoreData


extension CatUpvote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatUpvote> {
        return NSFetchRequest<CatUpvote>(entityName: "CatUpvote")
    }

    @NSManaged public var id: String?
    @NSManaged public var url: String?
    @NSManaged public var width: Int32
    @NSManaged public var height: Int32

}

extension CatUpvote : Identifiable {

}
