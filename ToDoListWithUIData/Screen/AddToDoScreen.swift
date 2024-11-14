//
//  ContentView.swift
//  ToDoListWithUIData
//
//  Created by Hatice Taşdemir on 11.11.2024.
//modeli nasıl entegre edeceğiz buraya ve formdan aldığımız name priority değerleini nasıl sdata kullanarak kayırt ederiz

import SwiftUI
import SwiftData

struct AddToDoScreen: View {
    //env kullanarak data contexti bize gelecek otomatik
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var name : String = ""
    @State private var priority : Int?
    
    private var isFormValid : Bool{
        
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    var body: some View {
        NavigationStack{
            //alt alta textfieldları sıralayan görünüm:
            Form {
               
                TextField("name",text: $name)
                //eğer değer istiyorsak value parametresine binding yapıyoruz.
                TextField("priority", value: $priority, format: .number)
            }.navigationTitle("Add ToDos")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss() //tıklanınca vieew kapanacak
                        }
                               , label: {
                            Text("Dismiss")
                        })
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            //priority optinal tanımlandığı için int mi diye kontrol: bu kod ile optional olmaktan çıkarmış olurum
                            guard let priority = priority else {return}
                            let toDo = ToDo(name: name, priority: priority)
                            //contexte save demek.
                            context.insert(toDo)
                            
                            do{
                                try context.save()
                            }catch {
                                print(error.localizedDescription)
                            }
                            dismiss()
                        }
                               , label: {
                            Text("Save")
                        }).disabled(!isFormValid)
                    }
                }
        }
    }
}

#Preview {
    AddToDoScreen().modelContainer(for: [ToDo.self])
        
}
