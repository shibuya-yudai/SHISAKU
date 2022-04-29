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
        XCTAssertTrue(node == node)
        XCTAssertTrue(node != anotherNode)
        
        // update node
        node.updateName(newName: "new_node_0")
        node.updateDescription(newDescription: "new node description")
        XCTAssertTrue(node.getName() == "new_node_0")
        XCTAssertTrue(node.getDescription() == "new node description")
        
        
        
    }
    
    func testEdge() throws {
        let uuid0 = UUID()
        let uuid1 = UUID()
        let uuid2 = UUID()
        
        let edge0 = Edge(startNodeId: uuid0, endNodeId: uuid1)
        let edge1 = Edge(startNodeId: uuid1, endNodeId: uuid2, directionalPattern: 1)
        let edge2 = Edge(startNodeId: uuid1, endNodeId: uuid2, directionalPattern: 2)
        
        XCTAssertFalse(edge0.isDirectional())
        XCTAssertTrue( edge1.isDirectional())
        XCTAssertTrue( edge2.isDirectional())
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
