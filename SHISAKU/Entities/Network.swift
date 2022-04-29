//
//  Network.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/28.
//
import Foundation

class NetWork {
    private var nodeList: [Node]
    private var edgeList: [Edge]
    private var relationPatterns: [Int]
    
    init(nodeList: [Node] = [], edgeList: [Edge] = [], relationPatterns: [Int] = []){
        self.nodeList = nodeList
        self.edgeList = edgeList
        self.relationPatterns = relationPatterns
    }
    
    func getNodeList() -> [Node] {
        return self.nodeList
    }
    func getEdgeList() -> [Edge] {
        return self.edgeList
    }
    

    /**
    //Function
    func isLinked(Node, Node) {
        
    }
    */
}

// Node 関連
extension NetWork {
    //CRUD Node
    @discardableResult
    func createNode(name: String) -> Node{
        let node = Node(name: name)
        self.nodeList.append(node)
        return node
    }
    
    func deleteNode(node: Node) -> Bool{
        // 対象nodeを含むedgeを先に削除
        deleteEdgesContainNode(node: node)
        // nodeの削除
        for (i, nodeInList) in self.nodeList.enumerated(){
            if(nodeInList.getId() == node.getId()){
                self.nodeList.remove(at: i)
                return true
            }
        }
        return false
    }
    
    // nodeの次数
    func countDegree(node: Node) -> Int {
        var countDegree = 0
        for edge in self.edgeList {
            if(edge.getStartNodeId() == node.getId() ||
               edge.getEndNodeId()   == node.getId()   ){
                countDegree += 1
            }
        }
        return countDegree
    }
    // nodeの入次数
    func countInDegree(node: Node) -> Int {
        var countDegree = 0
        for edge in self.edgeList {
            if(edge.getEndNodeId()   == node.getId()   ){
                countDegree += 1
            }
        }
        return countDegree
    }
    // nodeの出次数
    func countOutDegree(node: Node) -> Int {
        var countDegree = 0
        for edge in self.edgeList {
            if(edge.getStartNodeId() == node.getId()){
                countDegree += 1
            }
        }
        return countDegree
    }
}

// Edge 関連
extension NetWork {
    //CRUD Edge
    @discardableResult
    func createEdge(startNode: Node, endNode: Node, directionalPattern: Int = 0) -> Edge{
        let edge = Edge(startNodeId: startNode.getId(), endNodeId: endNode.getId(), directionalPattern: directionalPattern)
        edgeList.append(edge)
        return edge
    }
    
    func deleteEdge(edge: Edge) -> Bool{
        for (i, edgeInList) in self.edgeList.enumerated(){
            if(edgeInList.getEdgeId() == edge.getEdgeId()){
                self.edgeList.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func deleteEdgesContainNode(node: Node) {
        var deletedIndexList: [Int] = []
        //削除するedgeのインデックスをリストに保持
        for (i, edgeInList) in self.edgeList.enumerated(){
            if(edgeInList.getStartNodeId() == node.getId() ||
               edgeInList.getEndNodeId()   == node.getId()   ){
                deletedIndexList.append(i)
            }
        }
        //リストの後ろ側から順にエッジを削除
        for i in deletedIndexList.reversed() {
            self.edgeList.remove(at: i)
        }
    }
    
}


