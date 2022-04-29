//
//  NetworkRepositoryImpl.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/30.
//

import Foundation

// Data層のRepositoryは、データの保存先は意識しない。

class NetworkRepositoryImpl : NetworkRepository{
    func store(network: NetWork) {
        return NetworkDataStore.store(network: network)
    }

    func network() -> NetWork {
        return NetworkDataStore.network()
    }

    func delete() {
        return NetworkDataStore.delete()
    }
}

