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
    
    @Environment (\.presentationMode) var presentationMode
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PalaDica.palavra, ascending: true)],
        animation: .default)
    var palasDicas: FetchedResults<PalaDica>
    
//    @ObservedObject var game: Forca
    @State var letra : String = ""
    
    var body: some View {
        Text("Hello")
//        Form {
//            Section("Exibição"){
//                HStack{
//                    Spacer()
//                    Image("hangman\(6 - self.game.tentativas)")
//                       .resizable()
//                       .scaledToFit()
//                       .frame(height: 140)
//                   Spacer()
//
//                }
//            }
//            Section("Entrada"){
//                Text("Dica: \(self.game.dica)")
//                Spacer()
//                Text("\(self.game.palavraEscondida.joined(separator: " "))")
//                Spacer()
//                TextField("Digite uma letra", text: self.$letra)
//                Spacer()
//            }
//        }
    }
}

struct JogarView_Previews: PreviewProvider {
    static var previews: some View {
        JogarView()
    }
}
