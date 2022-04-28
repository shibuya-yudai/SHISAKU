//
//  SHISAKUTests.swift
//  SHISAKUTests
//
//  Created by 澁谷悠大 on 2022/04/28.
//

import XCTest
@testable import SHISAKU

class SHISAKUTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNode() throws {
        // create node
        var node = Node(name: "node_0")
        let anotherNode = Node(name: "anotherNode")
        // initial status of node
        XCTAssertTrue(node.getName() == "node_0")
        XCTAssertTrue(node.getDescription() == "")
        XCTAssertTrue(node.getEdgeList().isEmpty)
        XCTAssertTrue(node.getDegree() == 0)
        XCTAssertTrue(node.getOutDegree() == 0)
        XCTAssertTrue(node.equals(node: node))
        XCTAssertFalse(node.equals(node: anotherNode))
        
        // update node
        node.updateName(newName: "new_node_0")
        node.updateDescription(newDescription: "new node description")
        XCTAssertTrue(node.getName() == "new_node_0")
        XCTAssertTrue(node.getDescription() == "new node description")
        
        // create edge
        let edge1 = node.createEdge(endNodeId: anotherNode.getId()) // 無向グラフ
        let edge2 = node.createEdge(endNodeId: anotherNode.getId(), directional: true) // 有向グラフ
        
        // initial status of edge
        XCTAssertTrue(edge1.getEndNodeId() == anotherNode.getId())
        XCTAssertTrue(edge2.getEndNodeId() == anotherNode.getId())
        XCTAssertFalse(edge1.isDirectional())
        XCTAssertTrue(edge2.isDirectional())
        
        XCTAssertTrue(node.getDegree() == 2)
        XCTAssertTrue(node.getOutDegree() == 1)
        
        // delete edge 1
        XCTAssertTrue(node.deleteEdge(edgeId: edge1.getEdgeId()))
        XCTAssertTrue(node.getDegree() == 1)
        XCTAssertTrue(node.getOutDegree() == 1)
        
        // delete edge 2
        XCTAssertTrue(node.deleteEdge(edgeId: edge2.getEdgeId()))
        XCTAssertTrue(node.getDegree() == 0)
        XCTAssertTrue(node.getOutDegree() == 0)
        
        // delete fake edge
        let fakeUuid = UUID()
        XCTAssertFalse(node.deleteEdge(edgeId: fakeUuid))
        
        
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // node test
        var network = NetWork()
        let node0 = network.createNode(name: "node0")
        let node1 = network.createNode(name: "node1")
        //実際はusecase以下にUUIDしか流れないので、uuidからedgeを生成する
        let node0Uuid = node0.getId()
        let node1Uuid = node1.getId()
        let fakeUuid  = UUID()
        
        let edge1 = network.createEdge(startNodeId: node0Uuid, endNodeId: node1Uuid)
        let edge2 = network.createEdge(startNodeId: node0Uuid, endNodeId: fakeUuid)
        let edge3 = network.createEdge(startNodeId: fakeUuid,  endNodeId: node1Uuid)
        XCTAssertTrue(edge1?.getEndNodeId() == node1Uuid)
        XCTAssertTrue(edge2 == nil)
        XCTAssertTrue(edge3 == nil)
        
        
        
    }
    /**
     func testPerformanceExample() throws {
         // This is an example of a performance test case.
         self.measure {
             // Put the code you want to measure the time of here.
         }
     }
     */
}
