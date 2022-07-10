//
//  JogoForca.swift
//  JogoDaForca (iOS)
//
//  Created by Mvengeance on 08/07/22.
//

import Foundation
import SwiftUI

class Forca: ObservableObject {
    @Published var palavra          : String
    @Published var dica             : String
    @Published var letrasUsadas     : Array<String>
    @Published var tentativas       : Int
    @Published var acertos          : Int
    @Published var palavraEscondida : Array<String>
    
    init() {
        self.palavra = ""
        self.dica = ""
        self.letrasUsadas = Array<String>()
        self.tentativas = 6
        self.acertos = 0
        self.palavraEscondida = Array<String>()
    }

    func ganhou() -> Bool {
        return self.acertos == self.palavra.count
    }
    
    func perdeu() -> Bool {
        return self.tentativas == 0
    }
    
    func ocultarPalavra() {
        for _ in self.palavra {
            self.palavraEscondida.append("_")
            
        }
    }
    
    func sortear(banco: FetchedResults<PalaDica>) {
        let index = Int.random(in: 0...banco.count - 1)
        self.palavra = banco[index].palavra!
        self.dica = banco[index].dica!
    }

    func iniciarJogo(banco: FetchedResults<PalaDica>) {
        self.sortear(banco: banco)
        self.ocultarPalavra()
    }
    
    func testarLetra(letra: String) -> Bool {
        if (self.letrasUsadas.contains(letra.uppercased())){
            return false
        } else{
            self.letrasUsadas.append(letra)
            return true
        }
    }
    
    func arriscarLetra(letra: String) {
        if (!letra.isEmpty){
            var existe = false
            
            if (self.testarLetra(letra: letra)){
               var count = 0
                for c in self.palavra {
                    if (letra.uppercased() == c.uppercased()){
                        self.acertos += 1
                        self.palavraEscondida[count] = letra
                        existe = true
                    }
                    count += 1
                }
            }
            
            if (!existe){
                self.tentativas -= 1
            }
                
        }
        
    }
}
