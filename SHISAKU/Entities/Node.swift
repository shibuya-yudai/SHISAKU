//
//  Node.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/29.
//

import Foundation

struct Node : Equatable{
    private let id = UUID()
    private var edgeList: [Edge] = []
    private var name: String
    private var description: String = ""

    init(name: String = "node"){
        self.name = name
    }
    //getter
    func getName() -> String {
        return self.name
    }
    func getDescription() -> String {
        return self.description
    }
    func getId() -> UUID {
        return id
    }
    func getEdgeList() -> [Edge] {
        return self.edgeList
    }
    
    
    mutating func updateName(newName: String) {
        self.name = newName
    }
    mutating func updateDescription(newDescription: String) {
        self.description = newDescription
    }
}
