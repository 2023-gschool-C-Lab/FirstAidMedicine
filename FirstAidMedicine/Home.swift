//
//  Home.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/21.
//

import Foundation
import SwiftUI


struct Medicine : Codable, Hashable, Identifiable {
    var id : Int
    var name : String
    var description : String
    var symptoms : String
    var category : String
}






