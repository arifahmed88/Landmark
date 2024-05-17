//
//  JsonHelper.swift
//  Landmark
//
//  Created by ArifAhmed on 17/5/24.
//

import Foundation

class JsonHelper {
    
    let fileName = "landmarkData"
    
    func loadJsonData() -> [LandMarkInfo]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
               do {
                   let data = try Data(contentsOf: url)
                   let decoder = JSONDecoder()
                   let jsonData = try decoder.decode([LandMarkInfo].self, from: data)
                   return jsonData
               } catch {
                   print("error:\(error)")
               }
           }
        return nil
    }
}
