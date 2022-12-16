//
//  ItemListView.swift
//  Misturador
//
//  Created by Taqtile on 16/12/22.
//

import SwiftUI

struct ItemListView: View {
    var cor: Cor
    
    var body: some View {
        HStack{
            Circle().foregroundColor(Color(red: cor.red, green: cor.green, blue: cor.blue))
            NavigationLink(destination: Text(cor.nome ?? "")) {
                Text(cor.nome ?? "")
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(cor: Cor())
    }
}
