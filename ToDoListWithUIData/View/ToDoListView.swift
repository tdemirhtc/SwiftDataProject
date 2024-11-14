//
//  ToDoListView.swift
//  ToDoListWithUIData
//
//  Created by Hatice Taşdemir on 11.11.2024.
//listscreen içinee konulacak bu. başka bir ekranda da kullanılabilir

import SwiftUI

struct ToDoListView: View {
    
    let toDos: [ToDo] //bunun içine kayıt edeceğim.
    @Environment (\.modelContext) private var context //contexti kullanarak aldığım verileri
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                //herbirhstack navigation link içinde
                NavigationLink(value: toDo){
                    HStack{
                        Text(toDo.name)
                        Spacer()
                        Text(toDo.priority.description)
                        //description ile stringe çevirebiliriz.
                        
                    }
                }
              
            }.onDelete(perform: { indexSet in
                //seçilen todoyu veriyor bu kod
                indexSet.forEach { index in
                  let toDo =  toDos[index]
                    context.delete(toDo)
                    do {
                        try context.save()
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            })
                
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
        }
    }


#Preview {
    ToDoListView(toDos: [ToDo(name: "", priority: 123)]).modelContainer(for:[ToDo.self])
}
