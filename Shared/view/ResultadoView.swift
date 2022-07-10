//
//  ResultadoView.swift
//  JogoDaForca (iOS)
//
//  Created by Mvengeance on 10/07/22.
//

import SwiftUI

struct ResultadoView: View {
    @EnvironmentObject var game : Forca
    @Environment(\.presentationMode) var presentationMod
    
    var body: some View {
        if(self.game.ganhou()) {
            Text("GANHOU!")
        }
        else {
            Text("PERDEU!")
        }
        
        Button {
            self.game.reset()
            self.presentationMod.wrappedValue.dismiss()
        } label: {
            Label("Jogar novamente", systemImage: "")
        }

    }
}

struct ResultadoView_Previews: PreviewProvider {
    static var previews: some View {
        ResultadoView()
    }
}
