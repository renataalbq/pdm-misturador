//
//  FormIView.swift
//  Misturador
//
//  Created by Taqtile on 16/12/22.
//

import SwiftUI
import CoreData

struct FormView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var nomeCor:String = ""
    @State var red:Double = 0
    @State var green:Double = 0
    @State var blue:Double = 0
    @Environment(\.presentationMode) var presentationMode

    

    var body: some View {
        VStack{
            Spacer()
            TextField("Nome", text: self.$nomeCor )
            Spacer()
            Slider(value: $red, in: 0...1, step: 0.01).colorMultiply(.red)
            Slider(value: $blue, in: 0...1, step: 0.01).colorMultiply(.blue)
            Slider(value: $green, in: 0...1, step: 0.01).colorMultiply(.green)

            Spacer()
            
            Rectangle().foregroundColor(Color(red: self.red, green: self.green, blue: self.blue)).frame(width: 200, height: 100)
            Spacer()
            
        }
        .navigationTitle("Formulário")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Salvar"){
                let cor = Cor(context: viewContext)
                cor.nome = self.nomeCor
                cor.red = self.red
                cor.blue = self.blue
                cor.green = self.green
        

                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        }
}

struct FormIView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
