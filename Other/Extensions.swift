//
//  Extensions.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 4/5/2567 BE.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
