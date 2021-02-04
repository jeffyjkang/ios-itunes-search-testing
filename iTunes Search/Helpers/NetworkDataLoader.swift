//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Jeff Kang on 2/4/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    // Question: What do we need for data in/ data out? (Search)
    // Input: URL Request
    // Output: Data or an error
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
