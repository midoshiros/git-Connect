//
//  Extensions.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 23/11/2025.
//
import Foundation

extension Encodable { // encode object mode - decode as [:]
    
    func asDictionary() -> [String: Any] {
        
        guard let data = try? JSONEncoder().encode(self)   else { return [:] }
        
        
        do { // conver the json (encoded,bytes)  to swift
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }
        
        catch {
            return [:]
        }
        
        
    }

    
}
