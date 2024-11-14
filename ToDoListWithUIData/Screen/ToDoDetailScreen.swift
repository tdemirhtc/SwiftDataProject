//
//  ToDoDetailScreen.swift
//  ToDoListWithUIData
//
//  Created by Hatice Taşdemir on 11.11.2024.
//update etme

import SwiftUI

struct ToDoDetailScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name : String = "" //bu view açıldığında bu state varlar textfieldlara bağlı old için bu state var name ve priortylerin bana verilen aşağıdaki let todo : todo ile eşit olması gerekiyor.
    @State private var priority : Int?
    let toDo : ToDo
    
    var body: some View {
        Form {
            
            TextField("name",text: $name)
            TextField("priority", value: $priority, format: .number)
            Button("Update") {
                
                guard let priority = priority else {return}
                //bana verilen isimi güncel olan isimine eşitleyeceğim.
                toDo.name = name
                toDo.priority = priority
                
                do {
                    try context.save()
                }catch{
                    print(error.localizedDescription)
                }
                dismiss()
            }
        }.onAppear(perform: {
            name = toDo.name
            priority = toDo.priority
        })
    }
}


