//
//  ContentView.swift
//  Shared
//
//  Created by Mvengeance on 08/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PalaDica.palavra, ascending: true)],
        animation: .default)
    private var palasDicas: FetchedResults <PalaDica>
    
    @State private var palavra      : String = ""
    @State private var dica         : String = ""
    @FocusState private var keyboard: Bool
    private var listObjectPalaDica  = Array<PalaDica>()
    var listAuxDoideraObject = Array<AuxDoidera>()
    
    @ObservedObject private var game: Forca
    
    var body: some View {
        
//        Forca(palaDica: listAuxDoideraObject)
//        List {
//            ForEach(palasDicas) { palaDica in
//                listObjectPalaDica.append(palaDica)
//            }
//        }
//        List{
//            ForEach(palasDicas) { palaDica in
//                AuxDoidera(palavra: palaDica.palavra!, dica: palaDica.dica!)
//            }
//        }
        
        NavigationView {
            VStack{
                TextField("Palavra", text: self.$palavra)
                    .padding()
                    .focused(self.$keyboard)
                TextField("Dica", text: self.$dica)
                    .padding()
                    .focused(self.$keyboard)
                HStack{
                    Spacer()
                    Button {
                        let palaDica = PalaDica(context: viewContext)
                        palaDica.palavra = self.palavra
                        palaDica.dica = self.dica

                        do {
                            try viewContext.save()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    } label: {
                        Label("Cadastrar", systemImage: "")
                    }
                    Spacer()
                    NavigationLink {
                        JogarView()
                    } label: {
                        Label("Jogar", systemImage: "")
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("Cadastro Palavras")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .keyboard) {
                Button {
                    self.keyboard = false
                } label: {
                    Label("Fechar", systemImage: "")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
