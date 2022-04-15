//
//  QuoteEntity+CoreDataProperties.swift
//  GameOfThronesQuotes
//
//  Created by Oleksandr Klymenko on 15.04.2022.
//
//

import Foundation
import CoreData


extension QuoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuoteEntity> {
        return NSFetchRequest<QuoteEntity>(entityName: "QuoteEntity")
    }

    @NSManaged public var author: String?
    @NSManaged public var text: String?
    @NSManaged public var house: String?
    @NSManaged public var houseSlug: String?
    @NSManaged public var date: Date?

}

extension QuoteEntity : Identifiable {

}
