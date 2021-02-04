//
//  URLSession+NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Jeff Kang on 2/4/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

extension URLSession: NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = self.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
