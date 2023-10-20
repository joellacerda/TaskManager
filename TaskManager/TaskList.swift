//
//  TaskList.swift
//  TaskManager
//
//  Created by Joel Lacerda on 22/09/23.
//

import SwiftUI

struct TaskList {
    var list: [Task]
    
    mutating func addTask(_ title: String) {
        list.append(Task(title))
    }
    
    mutating func removeTask(index: Int) {
        list.remove(at: index)
    }
    
    init(_ list: [Task]) {
        self.list = list
    }
}
