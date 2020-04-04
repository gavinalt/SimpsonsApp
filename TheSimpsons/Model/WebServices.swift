//
//  WebServices.swift
//  TheSimpsons
//
//  Created by Gavin Li on 4/3/20.
//  Copyright © 2020 Gavin Li. All rights reserved.
//

import Foundation

class WebServices {
    //
    // MARK: - Class Methods
    //
    static func loadData(completionHandler: @escaping ([CharacterProfile]?, Bool?) -> Void) {
        Network.loadJSONFile(named: "", type: JsonResponse.self) { (result, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            
            completionHandler(result?.RelatedTopics, true)
        }
    }
}
