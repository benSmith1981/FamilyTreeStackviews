//
//  FamilyTreeDataService.swift
//  Family Tree
//
//  Created by ben on 27/06/2017.
//  Copyright © 2017 ben. All rights reserved.
//

import Foundation
import Alamofire

class FamilyTreeDataService {
    
    public static func parseFamilyTree(){
        if let pathURL = Bundle.main.url(forResource: "familyTree", withExtension: "json"){
            Alamofire.request(pathURL).validate().responseJSON { (response) in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    if let jsonDict = response.result.value as? NSDictionary,
                        let familyTree = Json4Swift_Base.init(dictionary: jsonDict){
                        
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "familyTreeNotification"),
                                                        object: self,
                                                        userInfo: ["results" :  familyTree])
                    }
                case .failure(let error):
                    print(error)
                }
                

            }
        }
    }
    
}
