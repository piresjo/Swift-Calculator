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

    
    @IBAction func divideButtonPressed(_ sender: Any) {
        if checkEquationQueue() {
            
        } else {
            mathArray.append(calcOutput.text!)
            mathArray.append("/")
            calcOutput.text! = "0"
        }
    }
    @IBAction func multiplyButtonPressed(_ sender: Any) {
        if checkEquationQueue() {
            
        } else {
            mathArray.append(calcOutput.text!)
            mathArray.append("*")
            calcOutput.text! = "0"
        }
    }
    @IBAction func minusButtonPressed(_ sender: Any) {
        if checkEquationQueue() {
            
        } else {
            mathArray.append(calcOutput.text!)
            mathArray.append("-")
            calcOutput.text! = "0"
        }
    }
    @IBAction func plusButtonPressed(_ sender: Any) {
        if checkEquationQueue() {
            
        } else {
            mathArray.append(calcOutput.text!)
            mathArray.append("+")
            calcOutput.text! = "0"
        }
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        // For right now, assume [firstVal, operator, secondVal]
        if checkEquationQueue() {
            mathArray.append(calcOutput.text!)
            print("HELLO")
            print(calcOutput.text!)
            print(mathArray)
            print("HELLO")
            let firstVal = Int(mathArray[0])
            let operatorVal = mathArray[1]
            let secondVal = Int(mathArray[2])
            var result = 0
            
            if operatorVal == "+" {
                result = firstVal! + secondVal!
            } else if operatorVal == "-" {
                result = firstVal! - secondVal!
            } else if operatorVal == "*" {
                result = firstVal! * secondVal!
            } else {
                result = firstVal! / secondVal!
            }
            
            mathArray = []
            calcOutput.text = String(result)
            //print("MOO")
            //print(mathArray)
            //print("MOO")
        }
    }
    
    @IBAction func zeroButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "0")
    }
    @IBAction func oneButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "1")
    }
    
    @IBAction func twoButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "2")
    }
    
    @IBAction func threeButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "3")
    }
    
    @IBAction func fourButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "4")
    }
    
    @IBAction func fiveButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "5")
    }
    
    @IBAction func sixButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "6")
    }
    
    @IBAction func sevenButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "7")
    }
    
    @IBAction func eightButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "8")
    }
    
    
    @IBAction func nineButtonPressed(_ sender: Any) {
        updateBuffer(updateString: "9")
    }
    
    func updateBuffer(updateString : String) {
        if calcOutput.text == "0" {
            calcOutput.text! = updateString
        } else {
            calcOutput.text! += updateString
        }
    }
    
    func checkEquationQueue() -> Bool {
        if mathArray.contains("+") || mathArray.contains("-") || mathArray.contains("*") || mathArray.contains("/") {
            return true
        }
        return false
    }
}

