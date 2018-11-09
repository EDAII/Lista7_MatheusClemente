//
//  Knapsack.swift
//  lista7eda2
//
//  Created by Matheus Azevedo on 09/11/18.
//  Copyright © 2018 Matheus Azevedo. All rights reserved.
//

import Foundation

struct KnapItem {
    let value: Int
    let weight: Int
}

class Knapsack {
    private var memo: Array<Array<Int>>
    private var taken: Array<Array<Bool>>
    
    private var itens: Array<KnapItem>
    
    var maxWeight: Int = 0
    
    init() {
        let arrayInt = Array(repeating: -1, count: 1000)
        let arrayBool = Array(repeating: false, count: 1000)

        self.memo = Array(repeating: arrayInt, count: 1000)
        self.taken = Array(repeating: arrayBool, count: 1000)
        self.itens = Array()
        
    }
    
    
    func addItem(_ item: KnapItem) {
        itens.append(item)
    }
    
    func runKnapsack(maxWeight: Int) {
        self.maxWeight = maxWeight
        print("RESULTADO KNAPSACK - \(doKnapsack(index: itens.count - 1, weight: maxWeight))")
    }
    
    private func doKnapsack(index: Int, weight: Int) -> Int {
        //Se nao existe ou nao cabe, nao é adicionado
        if index<0 || weight <= 0 {return 0}
        
        //Se o valor ja tiver sido testado
        if memo[index][weight] != -1 {return memo[index][weight]}
        
        //Se o item estoura a capacidade, nao é adicionado
        if itens[index].weight > weight {
            memo[index][weight] = doKnapsack(index: index - 1, weight: weight)
            return memo[index][weight]
        }
        
        //Caso contrario, decide a melhor opção entre adicionar o item ou nao
        return max(doKnapsack(index: index - 1, weight: weight), doKnapsack(index: index - 1, weight: weight - itens[index].weight) + itens[index].value)
    }
}
