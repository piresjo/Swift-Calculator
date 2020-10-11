//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Joe Pires on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    var buffer = 0
    var mathArray = [String]()
    
    @IBOutlet weak var calcOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        let textVal = sender.titleLabel!.text!
        updateBufferOperator(operatorString: textVal)
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        // For right now, assume [firstVal, operator, secondVal]
        if checkEquationQueue() {
            mathArray.append(calcOutput.text!)
            var firstVal : Int = 0
            var firstValDouble : Double = 0.0
            var secondVal : Int = 0
            var secondValDouble : Double = 0.0
            var firstValIsDouble = false
            var secondValIsDouble = false
            if mathArray[0].contains(".") || mathArray[2].contains(".") {
                firstValDouble = Double(mathArray[0])!
                secondValDouble = Double(mathArray[2])!
                firstValIsDouble = true
                secondValIsDouble = true
            } else {
                firstVal = Int(mathArray[0])!
                secondVal = Int(mathArray[2])!
            }
            
            let operatorVal = mathArray[1]
            
            var result = 0
            var doubleResult = 0.0
            var displayDouble = false
            
            if operatorVal == "+" {
                if secondValIsDouble || firstValIsDouble {
                    doubleResult = firstValDouble + secondValDouble
                    displayDouble = true
                } else {
                    result = firstVal + secondVal
                }
            } else if operatorVal == "-" {
                if secondValIsDouble || firstValIsDouble {
                    doubleResult = firstValDouble - secondValDouble
                    displayDouble = true
                } else {
                    result = firstVal - secondVal
                }
            } else if operatorVal == "*" {
                if secondValIsDouble || firstValIsDouble {
                    doubleResult = firstValDouble * secondValDouble
                    displayDouble = true
                } else {
                    result = firstVal * secondVal
                }
            } else {
                if secondValIsDouble || firstValIsDouble || (!(firstValIsDouble) && !(secondValIsDouble) && firstVal % secondVal != 0) {
                    if firstValIsDouble || secondValIsDouble {
                        doubleResult = firstValDouble / secondValDouble
                        displayDouble = true
                    } else {
                        doubleResult = Double(firstVal) / Double(secondVal)
                        displayDouble = true
                    }
                    
                } else {
                    result = firstVal / secondVal
                }
            }
            
            mathArray = []
            if displayDouble {
                calcOutput.text = String(doubleResult)
            } else {
                calcOutput.text = String(result)
            }
            
        }
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let textVal = sender.titleLabel!.text!
        updateBuffer(updateString: textVal)
    }
    
    
    @IBAction func greyButtonPressed(_ sender: UIButton) {
        let textVal = (sender as AnyObject).titleLabel!.text!
        if textVal == "%" {
            
        } else if textVal == "+/-" {
            var numberVal = Int(calcOutput.text!)!
            numberVal *= -1
            calcOutput.text = String(numberVal)
        } else {
            mathArray = []
            calcOutput.text = "0"
        }
    }
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if !(calcOutput.text!.contains(".")) {
            calcOutput.text! += "."
        }
    }
    
    func updateBuffer(updateString : String) {
        if calcOutput.text == "0" {
            calcOutput.text! = updateString
        } else {
            calcOutput.text! += updateString
        }
    }
    
    func updateBufferOperator(operatorString : String) {
        if checkEquationQueue() {
            
        } else {
            mathArray.append(calcOutput.text!)
            mathArray.append(operatorString)
            calcOutput.text! = "0"
        }
    }
    
    func checkEquationQueue() -> Bool {
        if mathArray.contains("+") || mathArray.contains("-") || mathArray.contains("*") || mathArray.contains("/") {
            return true
        }
        return false
    }
    
    
}

