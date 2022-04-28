//
//  Network.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/28.
//
import Foundation

class NetWork {
    var nodeList: [Node]
    var edgeList: [Edge]
    var relationPatterns: [Int]
    var adjacencyMatrix: [[Int]]
    
    init(nodeList: [Node] = [], edgeList: [Edge] = [], relationPatterns: [Int] = []){
        self.nodeList = nodeList
        self.edgeList = edgeList
        self.relationPatterns = relationPatterns
        self.adjacencyMatrix = []
    }
    
    //CRUD Node and Edge
    func createNode(name: String) -> Node {
        let node = Node(name: name)
        self.nodeList.append(node)
        return node
    }
    
    func createEdge(startNode:Node, endNode:Node) -> Edge {
        let edge = Edge(startNode: startNode, endNode: endNode)
        edgeList.append(edge)
        return edge
    }
    
    func setAdjacencyMatrix() {
        for edge in self.edgeList {
            for node in self.nodeList {
                var boolList:[Int] = []
                
                if (edge.isDirectional()){
                    //有向グラフのとき
                    if (node.equals(node: edge.getStartNode())){
                        boolList.append(1)
                    }else if(node.equals(node: edge.getEndNode())){
                        boolList.append(-1)
                    }else{
                        boolList.append(0)
                    }
                } else {
                    //無向グラフのとき
                    if(node.equals(node: edge.getStartNode()) &&
                       node.equals(node: edge.getEndNode()) ) {
                        boolList.append(1)
                    }else {
                        boolList.append(0)
                    }
                }
                // 行列に列を追加
            }
        }
    }
    /**
    func readNode(nodeId){
        
    }
    
    func readEdge(edgeId){
        
    }
    
    func updateNode(Node){
        
    }
    
    func updateEdge(Edge){
        
    }
    
    func deleteNode(Node){
        
    }
    
    func deleteEdge(Edge){
        
    }
    
    //Function
    func isLinked(Node, Node) {
        
    }
    
    func countDegree(Node) {
        
    }
    
    func countInDegree(Node) {
        
    }
    
    func countOutDegree(Node) {
        
    }
    
    func connectedNodes(Node) {
        
    }
    */
}


class Node {
    private let id = UUID()
    private var name: String

    init(name: String = "node"){
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getId() -> String {
        return id.uuidString
    }
    
    func equals(node: Node) -> Bool{
        return self.id == node.id
    }

}
class Edge {
    private var id = UUID()
    private var startNode: Node
    private var endNode: Node
    private var directional: Bool

    init(startNode: Node, endNode: Node, directional: Bool = false){
        self.startNode = startNode
        self.endNode = endNode
        self.directional = directional
    }
    
    func getId() -> String {
        return id.uuidString
    }
    
    func getStartNode() -> Node {
        return self.startNode
    }
    func getEndNode() -> Node {
        return self.endNode
    }
    func isDirectional() -> Bool {
        return self.directional
    }
}
