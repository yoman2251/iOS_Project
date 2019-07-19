//
//  BMI_model.swift
//  BMI_calculation
//
//  Created by sunny on 2019/3/16.
//  Copyright © 2019 sunny. All rights reserved.
//

import Foundation

class BMIModel{
    var height: Double
    var weight: Double
    
    init(h: Double, w: Double) {
        height = h
        weight = w
    }
    
    func calculation() -> Double {
        return weight / (height * height)
    }
}
