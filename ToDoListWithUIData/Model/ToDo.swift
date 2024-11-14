//
//  ToDo.swift
//  ToDoListWithUIData
//
//  Created by Hatice Taşdemir on 11.11.2024.
//
//bu sınıfın swiftdata ile bağlantılı olacağını ve veritabanında bu sınıftan oluşturulan objelerin tutulacağını import swift data ve @model diyerek yaparız.
import Foundation
import SwiftData

@Model //classı swift data içinde tutulacak duruma getirir.
//burada yapılacak işlemler vc aktarılacağı için final denilir 
final class ToDo{
    //hangi propleri tutmak istersek onu yazacağzı bu sınıfa
    var name : String
    var priority : Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
