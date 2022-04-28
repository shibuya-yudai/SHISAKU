//
//  Network.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/28.
//
import Foundation

struct NetWork {
    var nodeList: [Node]
    var relationPatterns: [Int]
    
    init(nodeList: [Node] = [], relationPatterns: [Int] = []){
        self.nodeList = nodeList
        self.relationPatterns = relationPatterns
    }
    
    //Create Node and Edge
    @discardableResult
    mutating func createNode(name: String) -> Node{
        let node = Node(name: name)
        self.nodeList.append(node)
        return node
    }
    
    func createEdge(startNodeId: UUID, endNodeId: UUID) -> Edge?{
        var startNode = getNodeFromUUID(uuid: startNodeId)
        if(isExsistsNodeFromUUID(uuid: endNodeId)){
            ///startNodeがnilの時はそのままnilが返却される
            return startNode?.createEdge(endNodeId: endNodeId)
        }
        return nil
    }
    
    mutating func deleteNode(nodeId: UUID) -> Bool{
        for (i, node) in self.nodeList.enumerated(){
            if(node.getId() == nodeId){
                self.nodeList.remove(at: i)
                return true
            }
        }
        return false
    }
    
    /**
    //Function
    func isLinked(Node, Node) {
        
    }
    
    func connectedNodes(Node) {
        
    }
     
     func getStringRelation(edgeId: UUID) -> String {
         let edge = getEdgeFromUUID(uuid: edgeId)
         if(edge != nil){
             if( edge!.isDirectional()){
                 return self.getName() + "-->" +
             }
         }
         return ""
     }
    */
}

// UUIDを使ってNodeとEdgeの検索をするとき
extension NetWork {
    //input node UUID
    func getNodeFromUUID(uuid: UUID) -> Node? {
        for node in self.nodeList {
            if(node.getId() == uuid){
                return node
            }
        }
        return nil
    }
    func isExsistsNodeFromUUID(uuid: UUID) -> Bool {
        for node in self.nodeList {
            if(node.getId() == uuid){
                return true
            }
        }
        return false
    }
    
    //input edge UUID
    func getEdgeFromUUID(uuid: UUID) -> Edge? {
        for node in self.nodeList {
            for edge in node.getEdgeList(){
                if(edge.getEdgeId() == uuid){
                    return edge
                }
            }
        }
        return nil
    }
    func isExsistsEdgeFromUUID(uuid: UUID) -> Bool {
        for node in self.nodeList {
            for edge in node.getEdgeList(){
                if(edge.getEdgeId() == uuid){
                    return true
                }
            }
        }
        return false
    }
}



