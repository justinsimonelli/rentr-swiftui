//
//  RenterFetcher.swift
//  rentr
//
//  Created by Justin Simonelli on 11/9/19.
//  Copyright © 2019 Justin Simonelli. All rights reserved.
//
import SwiftUI

class RenterFetcher:  {
    private static let renterUrlString = "https://github.com/justinsimonelli/rentr-swiftui/raw/master/rentr/data/rentr.json"
    
    init() {
        guard let renterUrl = URL(string: RenterFetcher.renterUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: renterUrl) { [weak self] (data, _, error) in
            if let error = error {
                self?.state = .fetched(.failure(.error(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                self?.state = .fetched(.failure(.error("Malformed response data")))
                return
            }
            let root = try! JSONDecoder().decode(Root.self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.state = .fetched(.success(root))
            }
        }.resume()
    }
}
