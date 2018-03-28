//
//  NetworkAPI.swift
//  TestClean
//
//  Created by Evyasaf on 3/11/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Moya
import RxSwift

protocol NetworkClient {
    
    func fetchItems() -> Observable<[ItemModel]>
    
}

class NetworkClientHandler: NetworkClient {
    
    static let shared: NetworkClient = { NetworkClientHandler() }()
    
    private let provider: MoyaProvider<MyTargetType>
    
    private init() {
        provider = MoyaProvider<MyTargetType>(callbackQueue: DispatchQueue.global(),
                                              manager: MoyaProvider<MyTargetType>.defaultAlamofireManager(),
                                              plugins: [NetworkLoggerPlugin(verbose: true)],
                                              trackInflights: false)
    }
    
    // MARK: NetworkClient Implementation
    
    func fetchItems() -> Observable<[ItemModel]> {
        return provider.rx
            .request(.fetch)
            .map([ItemModel].self)
            .asObservable()
    }
    
}
