//
//  ViewController.swift
//  BMI_calculation
//
//  Created by sunny on 2019/3/16.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HeightFieldText: UITextField!

    @IBOutlet weak var WeightFieldText: UITextField!
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var standard: UILabel!
    
    @IBAction func Calculation(_ sender: Any) {
        let heightValue = Double(HeightFieldText.text!)
        let weightValue = Double(WeightFieldText.text!)
        let bmi = BMIModel(h: heightValue!, w: weightValue!)
        Result.text = String(format: "%.3f", bmi.calculation())
        
        if bmi.calculation() > 24 {
            standard.text = "過重"
        }else if bmi.calculation() < 18 {
            standard.text = "過瘦"
        }else {
            standard.text = "正常"
        }
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        HeightFieldText.text = ""
        WeightFieldText.text = ""
        Result.text = ""
        standard.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

