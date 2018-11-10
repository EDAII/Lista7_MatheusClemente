//
//  ViewController.swift
//  lista7eda2
//
//  Created by Matheus Azevedo on 09/11/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var knap: Knapsack?
    
    @IBOutlet weak var valorField: UITextField!
    
    @IBOutlet weak var pesoField: UITextField!
    
    @IBOutlet weak var weightOutlet: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var knapBtn: UIButton!

    @IBOutlet weak var resultLabel: UILabel!
    
    var toReset = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knap = Knapsack()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func dissmissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let value =  Int(sender.value)
        
        weightOutlet.text = "Capacidade: \(value)"
    }
    
    @IBAction func addItemAction(_ sender: Any) {
        if let valor = Int(valorField.text!) {
            if let peso = Int(pesoField.text!) {
                let newItem = KnapItem(value: valor, weight: peso)
                knap?.addItem(newItem)
                textLabel.text?.append("\n\(newItem.value) - (\(newItem.weight) P)")
            }
        }
        
    }
    
    
    @IBAction func knapAction(_ sender: Any) {
        if toReset {
            textLabel.text = "Itens"
            resultLabel.text = "Resultado:"
            knap?.resetKnapsack()
            toReset = false
        } else {
        
            if knap?.itens.isEmpty ?? true {
                resultLabel.text = "Não há valores"
            } else {
                let result = knap?.runKnapsack(maxWeight: Int(slider.value))
                let itens = knap?.getSelectedItens()
                
                textLabel.text = "Itens Selecionados:"
                if itens?.count == 0 {
                    textLabel.text?.append("\nNenhum item")
                } else {
                    for i in itens! {
                        textLabel.text?.append("\n\(i.value) - (\(i.weight) P)")
                    }
                }
                
                resultLabel.text = "Resultado: \(result)"
                toReset = true
                
            }
        }
    }
    
}
