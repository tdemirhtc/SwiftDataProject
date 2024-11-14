//
//  ListView.swift
//  ToDoListWithUIData
//
//  Created by Hatice Taşdemir on 11.11.2024.
//liste yaptığımız ekran bu

import SwiftUI
import SwiftData

struct ListScreen: View {
    
    @Query(sort: \ToDo.name, order: .forward)private var toDos : [ToDo]
    //contentde addtoscreenin gösterilip gösterilmediğini lkontrol eden  bu bool değişkeni
    @State private var isAddToDoPresented : Bool = false
    var body: some View {
        
            ToDoListView(toDos: toDos)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("add ToDo"){
                        isAddToDoPresented = true
                    }
                }
                //ispresented gösteriliyor mu, content de ne gösterliecek demek
            }).sheet(isPresented: $isAddToDoPresented, content: {
                NavigationStack{
                    AddToDoScreen()
                }
            })
        }
    
}

#Preview {
    ListScreen().modelContainer(for: [ToDo.self])
}
