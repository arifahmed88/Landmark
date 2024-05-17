//
//  ViewModel.swift
//  Landmark
//
//  Created by ArifAhmed on 17/5/24.
//

import Foundation

class ViewModel{
    var landMarkList:[LandMarkInfo] = []
    let jsonHelper = JsonHelper()
    
    init() {
    }
    
    func updateData(complition:()->Void){
        self.landMarkList = jsonHelper.loadJsonData() ?? []
        complition()
    }
    
}
