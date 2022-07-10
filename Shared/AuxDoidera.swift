//
//  AuxDoidera.swift
//  JogoDaForca
//
//  Created by Mvengeance on 10/07/22.
//

import Foundation

class AuxDoidera:NSObject, ObservableObject {
    var palavra: String
    var dica:String
    
    init(palavra:String, dica:String){
        self.palavra = palavra
        self.dica = dica
    }
}
