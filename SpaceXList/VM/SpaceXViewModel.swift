//
//  ViewModel.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 1/6/23.
//

import Foundation

protocol ViewModelProtocol{
    func didGetLaunchData()
}
protocol SpaceViewModelProtocol{
    func collectdatafromApi()
    func getNumofRows() -> Int
    func getLaunchIndex(for index:Int) -> SpaceXModel?
    func decodeJSONData(data: Data) ->[SpaceXModel]?
}
class SpaceXViewModel: SpaceViewModelProtocol{
   
    
    let SpaceXApiHandler = SpaceXAPIHandler()
    
    var arrx =  [SpaceXModel]()
    var delegate:ViewModelProtocol?
    
    func collectdatafromApi(){
        
        SpaceXApiHandler.getData(Urlstrings: .Launches) { data in
            guard let data = data else{
                return
            }
            guard let array = self.decodeJSONData(data: data) else {
                return
            }
            self.arrx = array
            self.delegate?.didGetLaunchData()
        }
    }
    
    func decodeJSONData(data: Data) -> [SpaceXModel]? {
        let decoder = JSONDecoder()
        do{
            let SpaceData = try decoder.decode([SpaceXModel].self, from: data)
            return SpaceData
        }catch{
            print (error)
            return nil
        }
    }
    
    
    func getNumofRows() -> Int{
        return arrx.count
    }
    
    func getLaunchIndex(for index:Int) -> SpaceXModel?{
        if index < arrx.count && index > -1{
            return arrx[index] }
        return nil
    }
    
    
}


