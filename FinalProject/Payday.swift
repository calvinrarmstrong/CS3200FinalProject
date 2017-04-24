//
//  Payday.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 4/20/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import Foundation
import RealmSwift

class Payday: Object
{
    dynamic var paydate: Date?
    dynamic var reoccurrence: Int = -1
}
