//
//  Edge.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/29.
//

import Foundation

struct Edge {
    private var edgeId = UUID()
    private var endNodeId: UUID
    private var directional: Bool

    init(endNodeId: UUID, directional: Bool = false){
        self.endNodeId = endNodeId
        self.directional = directional
    }
    func getEdgeId() -> UUID {
        return edgeId
    }
    func getEndNodeId() -> UUID {
        return self.endNodeId
    }
    func isDirectional() -> Bool {
        return self.directional
    }
}
