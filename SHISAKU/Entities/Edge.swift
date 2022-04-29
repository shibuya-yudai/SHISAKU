//
//  Edge.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/29.
//

import Foundation

struct Edge : Equatable{
    private var edgeId = UUID()
    private var startNodeId: UUID
    private var endNodeId: UUID
    private var directionalPattern: Int

    @discardableResult
    init(startNodeId: UUID, endNodeId: UUID, directionalPattern: Int = 0){
        self.startNodeId = startNodeId
        self.endNodeId = endNodeId
        self.directionalPattern = directionalPattern
    }
    
    func getEdgeId() -> UUID {
        return edgeId
    }
    func getStartNodeId() -> UUID {
        return self.startNodeId
    }
    func getEndNodeId() -> UUID {
        return self.endNodeId
    }
    func isDirectional() -> Bool {
        switch directionalPattern {
        case 0:  return false // 無向グラフの場合
        default: return true  // 有向グラフの場合
        }
    }
}
