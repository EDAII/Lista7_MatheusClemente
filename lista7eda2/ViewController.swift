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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knap = Knapsack()
        testKnapsack()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func testKnapsack() {
        
        
        //cria 10 itens randomicos
        for _ in 1...10 {
            let newTestItem = KnapItem(value: Int.random(in: 1..<100), weight: Int.random(in: 1...10))
            print("\(newTestItem.value) - \(newTestItem.weight)")
            knap?.addItem(newTestItem)
        }
        
        knap?.runKnapsack(maxWeight: 10)
    }

}

