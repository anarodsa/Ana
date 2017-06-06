// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Dog.swift instead.

import Foundation
import CoreData

public enum DogAttributes: String {
    case color = "color"
    case image = "image"
    case name = "name"
    case orden = "orden"
}

open class _Dog: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "Dog"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _Dog.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var color: String?

    @NSManaged open
    var image: NSData?

    @NSManaged open
    var name: String?

    @NSManaged open
    var orden: NSNumber?

    // MARK: - Relationships

}

