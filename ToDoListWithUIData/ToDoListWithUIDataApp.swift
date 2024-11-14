//
//  ToDoListWithUIDataApp.swift
//  ToDoListWithUIData
//
//  Created by Hatice Taşdemir on 11.11.2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoListWithUIDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
               ListScreen()
            }
            
        }.modelContainer(for: [ToDo.self])
    }
}



