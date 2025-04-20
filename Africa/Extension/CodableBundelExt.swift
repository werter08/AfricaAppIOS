//
//  CodableBundelExt.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Cant get url from \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cant get data from \(file)")
        }
      
        
        do {
            let decoder = JSONDecoder()
            let loaded = try decoder.decode(T.self, from: data)
            
            return loaded
        }catch {
            fatalError("Cant load a data from \(file)")
        }
    }
}
