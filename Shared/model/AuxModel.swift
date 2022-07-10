//
//  AuxModel.swift
//  JogoDaForca
//
//  Created by Mvengeance on 10/07/22.
//

import Foundation
import SwiftUI

class Aux: NSObject, ObservableObject {
    var dica: String
    var palavra: String
 
    init(palavra: String, dica: String) {
        self.dica = dica
        self.palavra = palavra
    }
    
    
}

