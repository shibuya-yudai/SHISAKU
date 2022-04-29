//
//  RepositoryProtcol.swift
//  SHISAKU
//
//  Created by 澁谷悠大 on 2022/04/30.
//

import Foundation

/**
 ユーザ情報へアクセスする手段を纏めたインターフェース(プロトコル）
 利用する側は、どこに保存されているかは意識しない。
 */

protocol NetworkRepository {
    func store(network: NetWork)
    func network() -> NetWork
    func delete()
}


