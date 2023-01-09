//
//  SpaceXApiMock.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 1/8/23.
//

import Foundation

class SpaceXApiMockManager:SpaceXApiHandlerProtocol{
    func getData(Urlstrings: ServerUrls, completion: @escaping(Data?) -> ())
    let spaceXModel1 = SpaceXModel(id: 1, name: "Jace", details: "No payload in their", date_utc: "2/3/23", upcoming: true, success: true, rocket: "Fox Sybaruan Dragon")
    let spaceXModel2 = SpaceXModel(id: 2, name: "Franklin", details: "Send people and cargo to the International space station", date_utc: "2/13/15", upcoming: false, success: true, rocket: "Falcon Dragon 69")
    let spaceXarray = [spaceXModel1,spaceXModel2]
    
    do {
        let data = try JSONEncoder().encode(spaceXarray)
        completion(data)
    }catch{
        print("failed to decode \(error)")
        completion(nil)
    }
    
    
    
}
