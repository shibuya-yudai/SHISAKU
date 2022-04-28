//
//  Node.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/29.
//

import Foundation

struct Node {
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
    
    func getDegree() -> Int {
        return self.edgeList.count
    }
    func getOutDegree() -> Int {
        var count:Int = 0
        for edge in self.edgeList {
            if(edge.isDirectional()){
                count += 1
            }
        }
        return count
    }
    
    //node
    mutating func updateName(newName: String) {
        self.name = newName
    }
    mutating func updateDescription(newDescription: String) {
        self.description = newDescription
    }
    
    func equals(node: Node) -> Bool{
        return self.id == node.id
    }
    
    //edge
    @discardableResult
    mutating func createEdge(endNodeId: UUID, directional: Bool = false) -> Edge {
        let edge = Edge(endNodeId: endNodeId ,directional: directional)
        edgeList.append(edge)
        return edge
    }

    @discardableResult
    mutating func deleteEdge(edgeId: UUID) -> Bool {
        for (i, edge) in self.edgeList.enumerated(){
            if(edge.getEdgeId() == edgeId){
                self.edgeList.remove(at: i)
                return true
            }
        }
        return false
    }
    

    

}
