//
//  SpaceXAPIHandler.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 12/28/22.
//

import Foundation
protocol SpaceXApiHandlerProtocol{
    func getData(Urlstrings: ServerUrls, completion: @escaping(Data?) -> ())
}
class SpaceXAPIHandler: SpaceXApiHandlerProtocol{
    func getData(Urlstrings: ServerUrls, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: Urlstrings.rawValue)else{
            return
        
    }
    let request = URLRequest(url: url)
    let session = URLSession.shared
        let task  = session.dataTask(with:request) { data, response, error in
            if error != nil{
                return
            }
            guard let data = data else{
                completion(nil)
                return
            }
            completion(data)
        }
        task.resume()
    }
    
}

