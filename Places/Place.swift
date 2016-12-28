//
//  Place.swift
//  Places
//
//  Created by Maria Susana Moline Venanzi on 12/10/16.
//  Copyright © 2016 Uberbliss. All rights reserved.
//

import Foundation
import UIKit

// import CoreData


class Place {
// class Place2 : NSManagedObject {
    
   // @NSManaged var name : String
   // @NSManaged var type : String
   // @NSManaged var location : String
   // @NSManaged var image : NSData?
   // @NSManaged var rating : String?
   // @NSManaged var telefone : String?
   // @NSManaged var website : String?
    
    var name : String!
    var type = ""
    var location = ""
    var image : UIImage!
    var rating = "rating"
    var telefone = ""
    var website = ""
    


    init(name: String, type: String, location: String, image: UIImage, telefone: String, website: String) {
        self.name = name
        self.image = image
        self.type = type
        self.location = location
        self.telefone = telefone
        self.website = website

}
}
