//
//  User.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import Foundation

struct User: Codable {
    let id: String
    let userName: String
    let email: String
    let joined: TimeInterval
}
