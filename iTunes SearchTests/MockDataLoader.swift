//
//  MockDataLoader.swift
//  iTunes SearchTests
//
//  Created by Jeff Kang on 2/4/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

@testable import iTunes_Search

class MockDataLoader: NetworkDataLoader {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
//    init(data: Data?, response: URLResponse?, error: Error?) {
//        self.data = data
//        self.response = response
//        self.error = error
//    }
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        // We don't need the URLSession to get the dta, instead we can get the data from the MockJSON file
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.response, self.error)
        }
    }
}
