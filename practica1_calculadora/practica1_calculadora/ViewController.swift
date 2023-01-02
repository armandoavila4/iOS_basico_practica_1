//
//  ViewController.swift
//  practica1_calculadora
//
//  Created by Jorge Armando Avila Estrada on 31/12/22.
//

import UIKit

class ViewController: UIViewController {
    var number1:Float = 0.0
    var number2:Float = 0.0
    var result:Float = 0.0
    var operation:String = ""
    
    @IBOutlet weak var screenValues: UITextField!
    
    
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func numberClick(_ sender: UIButton) {
        if(result > 0){
            result = 0
            setValue(value: "0")
        }
        
        if screenValues.text == "0" || screenValues.text == "Error" {
            setValue(value: String(sender.tag))
        }else{
            setValue(value: screenValues.text!+String(sender.tag))
        }
        
    }
    
    
    @IBAction func dotClick(_ sender: UIButton) {
        //Se verifica que solo tenga un punto decimal
        if !(screenValues.text?.contains("."))!{
            setValue(value: screenValues.text!+".")
        }
    }
    
    
    @IBAction func CClick(_ sender: UIButton) {
        setValue(value: "0")
        if number1 > 0{
            number2 = 0.0
        }
    }
    
    @IBAction func divideClick(_ sender: UIButton) {
        if operation.isEmpty{
            number1 = Float(screenValues.text!)!
            
            operation = "/"
            screenValues.text = "0"
        }else{
            operation = "/"
            screenValues.text = "0"
        }
        setSelectedOperation(button: sender)
    }
    
    @IBAction func plusClick(_ sender: UIButton) {
        if operation.isEmpty{
            number1 = Float(screenValues.text!)!
            
            operation = "+"
            screenValues.text = "0"
        }else{
            operation = "+"
            screenValues.text = "0"
        }
        setSelectedOperation(button: sender)
    }
    
    @IBAction func minusClick(_ sender: UIButton) {
        if operation.isEmpty{
            number1 = Float(screenValues.text!)!
            
            operation = "-"
            screenValues.text = "0"
        }else{
            operation = "-"
            screenValues.text = "0"
        }
        setSelectedOperation(button: sender)
    }
    
    @IBAction func multiplyClick(_ sender: UIButton) {
        if operation.isEmpty{
            number1 = Float(screenValues.text!)!
            
            operation = "*"
            screenValues.text = "0"
        }else{
            operation = "*"
            screenValues.text = "0"
        }
        setSelectedOperation(button: sender)
    }
    
    @IBAction func equalClick(_ sender: Any) {
        number2 = Float(screenValues.text!)!
        if !operation.isEmpty{
            switch operation{
            case "+":
                result = number1 + number2
                setValue(value: String(result))
            case "-":
                result = number1 - number2
                setValue(value: String(result))
            case "/":
                if number2 > 0{
                    result = number1 / number2
                    setValue(value: String(result))
                }else{
                    setValue(value: "Error")
                }
            case "*":
                result = number1 * number2
                setValue(value: String(result))
            default:
                print("Error")
            }
            number1 = 0.0
            number2 = 0.0
            operation = ""
            deleteSelectedButtons()
        }
        
    }
    
    
    func setValue(value:String){
        screenValues.text = value
    }
    
    
    func setSelectedOperation(button:UIButton){
        deleteSelectedButtons()
        button.isSelected = true
    }

    func deleteSelectedButtons(){
        btnPlus.isSelected = false
        btnMinus.isSelected = false
        btnDivide.isSelected = false
        btnMultiply.isSelected = false
    }
    
}

