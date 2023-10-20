//
//  Task.swift
//  TaskManager
//
//  Created by Joel Lacerda on 22/09/23.
//

import SwiftUI

struct Task: Identifiable {
    
    var id = UUID()
    var title: String
    var isDone: Bool
    
    mutating func toggleMarked() {
        isDone.toggle()
    }
    
    init(_ title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}

extension Task: Codable { }

extension Task: Equatable { }
