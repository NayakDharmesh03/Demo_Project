//
//  HomeWorkoutCellData.swift
//  NewAppProject
//
//  Created by NT 2 on 27/04/23.
//

import UIKit

class HomeWorkoutCellData: NSObject {
    var arrColors:UIColor!
    var WorkType:String!
    var Switch : Bool
    var star1:Bool
    var star2:Bool
    var star3:Bool

    var Slider: Int!
    
    init(arrColors:UIColor!,WorkType:String!,Switch: Bool,Slider:Int!,_star1:Bool,_star2:Bool,_star3:Bool) {
        self.arrColors = arrColors
        self.WorkType = WorkType
        self.Switch = Switch
        self.Slider = Slider
        self.star1 = _star1
        self.star2 = _star2
        self.star3 = _star3
    }

}
