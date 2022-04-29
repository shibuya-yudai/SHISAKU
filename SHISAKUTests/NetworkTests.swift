//
//  NetworkTests.swift
//  SHISAKUTests
//
//  Created by 澁谷悠大 on 2022/04/29.
//

import XCTest
@testable import SHISAKU

class NetworkTests: XCTestCase {
    var network = NetWork()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNodeInitialize() throws {
        let node0 = network.createNode(name: "node0")
        XCTAssertTrue(network.getNodeList().contains(node0))
    }
    func testEdgeInitialize() throws {
        let node0 = network.createNode(name: "node0")
        let node1 = network.createNode(name: "node1")
        let node2 = network.createNode(name: "node2")
        
        let edge0 = network.createEdge(startNode: node0, endNode: node1)
        let edge1 = network.createEdge(startNode: node1, endNode: node2, directionalPattern: 1)
        
        // edgelistに生成したedgeが含まれているか
        XCTAssertTrue(network.getEdgeList().contains(edge0))
        
        // 生成したedgeは指定nodeのuuidを保持しているか
        XCTAssertTrue(edge0.getStartNodeId() == node0.getId())
        XCTAssertTrue(edge0.getEndNodeId() == node1.getId())
        
        // 生成したedgeは無向・有向グラフの判定ができるか
        XCTAssertFalse(edge0.isDirectional())
        XCTAssertTrue(edge1.isDirectional())
    }
    
    func testNodeDegree() throws {
        let node0 = network.createNode(name: "node0")
        let node1 = network.createNode(name: "node1")
        let node2 = network.createNode(name: "node2")
        network.createEdge(startNode: node0, endNode: node1)
        network.createEdge(startNode: node1, endNode: node2, directionalPattern: 1)
        
        // nodeの次数
        XCTAssertTrue(network.countDegree(node: node1) == 2)
        XCTAssertTrue(network.countInDegree(node: node1) == 1)
        XCTAssertTrue(network.countOutDegree(node: node1) == 1)
    }
    
    func testGetConnectedNode() throws {
        let node0 = network.createNode(name: "node0")
        let node1 = network.createNode(name: "node1")
        let node2 = network.createNode(name: "node2")
        network.createEdge(startNode: node0, endNode: node1)
        network.createEdge(startNode: node1, endNode: node2, directionalPattern: 1)
        
        let connectedNodesWithNode0 = network.connectedNodes(node: node0)
        let connectedNodesWithNode1 = network.connectedNodes(node: node1)
        let connectedNodesWithNode2 = network.connectedNodes(node: node2)
        
        XCTAssertTrue(connectedNodesWithNode0 == [node1])
        XCTAssertTrue(connectedNodesWithNode1 == [node0, node2])
        XCTAssertTrue(connectedNodesWithNode2 == [node1])
        
    }
    
    func testDeleteFunction() throws {
        let node0 = network.createNode(name: "node0")
        let node1 = network.createNode(name: "node1")
        let node2 = network.createNode(name: "node2")
        let edge0 = network.createEdge(startNode: node0, endNode: node1)
        let edge1 = network.createEdge(startNode: node1, endNode: node2, directionalPattern: 1)
        
        // 削除系
    
        // nodeをnodeListから削除できるか
        XCTAssertTrue(network.deleteNode(node: node0))
        XCTAssertFalse(network.getNodeList().contains(node0))
    
        // 削除されるnodeUuidを含むedgeを削除できているか
        XCTAssertFalse(network.getEdgeList().contains(edge0))
        
        // edgeをedgeListから削除できるか
        XCTAssertTrue(network.deleteEdge(edge: edge1))
        XCTAssertFalse(network.getEdgeList().contains(edge1))
        
    }
}
