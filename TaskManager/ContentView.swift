//
//  ContentView.swift
//  TaskManager
//
//  Created by Joel Lacerda on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("filter") var filter = false
    
    @State var tasks: TaskList = TaskList([])
    
    @State var text: String = ""
    
    let url = URL.documentsDirectory.appending(path: "tasks.json")
    
    var body: some View {
        NavigationStack {
           
            List($tasks.list, editActions: .delete) { $task in
                HStack {
                    Text(task.title)
                    Spacer()
                    Button {
                        task.toggleMarked()
                    } label: {
                        if (task.isDone) {
                            Image(systemName: "checkmark.circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                    }
                }
            }
            .navigationTitle("Tarefas")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: tasks.list) {
                saveTasks()
            }
            .onAppear() {
                loadTasks()
            }
        
            HStack {
                TextField("Crie uma nova tarefa", text: $text)
                    .autocorrectionDisabled()
                Spacer()
                Button {
                    if (!text.isEmpty) {
                        tasks.addTask(text)
                        text = ""
                    }
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                }
            }
            .padding()
            
            
        }
    }
    
    func saveTasks() {
        let tarefas = tasks.list
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(tarefas)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadTasks() {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let task = try decoder.decode([Task].self, from: data)
            tasks.list = task
        } catch {
            print(error)
        }
    }
}



#Preview {
    ContentView()
}
