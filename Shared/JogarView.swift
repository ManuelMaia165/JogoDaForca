//
//  JogarView.swift
//  JogoDaForca (iOS)
//
//  Created by Mvengeance on 08/07/22.
//

import SwiftUI
import CoreData

struct JogarView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMod
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PalaDica.palavra, ascending: true)],
        animation: .default)
    var palasDicas: FetchedResults<PalaDica>
    
    @ObservedObject var game = Forca()
    @State var letra : String = ""
    
    var body: some View {
        Button {
            iniciarJogo()
        } label: {
            Label("Iniciar jogo", systemImage: "")
        }
        
        Form {
            Section("Exibição") {
                HStack {
                    Spacer()
                    Image("hangman0\(6 - self.game.tentativas)")
                       .resizable()
                       .scaledToFit()
                       .frame(height: 140)
                   Spacer()

                }
            }
            
            Section("Entrada"){
                Text("Dica: \(self.game.dica)")
                Text("Palavra: \(self.game.palavraEscondida.joined(separator: "  "))")
                Text("Letras usadas: \(self.game.letrasUsadas.joined(separator: "  "))")
                TextField("Digite uma letra", text: self.$letra)
                Button {
                    self.game.arriscarLetra(letra: self.letra)
                } label: {
                    Label("Arriscar", systemImage: "")
                }

            }
        }
    }
    
    public func iniciarJogo() {
        self.game.iniciarJogo(banco: palasDicas)
    }
}

struct JogarView_Previews: PreviewProvider {
    static var previews: some View {
        JogarView()
    }
}
