//
//  APIManager.swift
//  translade
//
//  Created by Mauricio Rojas Vindas on 1/6/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    class func getLanguages(){
        DispatchQueue.global(qos: .userInitiated).async {
            Alamofire.request("\(Constants.API_URL)languages", method: .get, parameters: nil, encoding: URLEncoding.default, headers: [Constants.API_HEADER_HEY: Constants.API_KEY]).responseJSON {
                (response) in
                switch response.result{
                case .success:
                    if let dictionary = response.result.value as? [String: AnyObject] {
                        createLanguagesAvailableAnswer(dictionary: dictionary[Constants.LENGUAGE_KEY] as! [String: AnyObject])
                    }
                    //print("Sirvio")
                    break
                case .failure(let error):
                    print("ERROR \(error)")
                    break
                }
            }
        }
        
        
    }
    class func createTranslate(originalLanguages: String, destinationLanguages: String, textToTranslate: String, completion: @escaping (_ textTranslated: String?)-> Void){
        
        
        let urlString = generateURLToTranslate(originalLanguages: originalLanguages, destinationLanguages: destinationLanguages, textToTranslate: textToTranslate)
        
        Alamofire.request(urlString,  method: .get, parameters: nil, encoding: URLEncoding.default, headers: [Constants.API_HEADER_HEY: Constants.API_KEY]).responseJSON {
            (response) in
            switch response.result{
            case .success:
            if let dictionary = response.result.value as? [String: AnyObject], let textToTranslatedArray = dictionary[Constants.TEXT_TRANSLATED_KEY] as? [String], let textToTranslate = textToTranslatedArray.first{
                completion(textToTranslate)
            }
            else{
                completion(nil)
            }
            break
        case .failure:
            completion(nil)
            }
        }
    }
    
    class func generateURLToTranslate(originalLanguages: String, destinationLanguages: String, textToTranslate: String) -> String{
        
        var urlString = "\(Constants.API_URL)translate/\(originalLanguages)/\(destinationLanguages)/\(textToTranslate)"
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)!
        return urlString
        
    }
    
    
    class func createLanguagesAvailableAnswer(dictionary : [String: AnyObject])
    {
        //print(dictionary)
        var languagesArray = [[String: String]]()
        for (key, value) in dictionary {
            if let value = value as? String{
                let distionaryWithNewFormat = [Constants.DIRS_KEY: key, Constants.LENGUAGE_KEY: value]
                languagesArray.append(distionaryWithNewFormat)
            }
            else{
                sendErrorNotification()
                return
            }
        }
        languagesArray = languagesArray.sorted { $0[Constants.LENGUAGE_KEY]! < $1[Constants.LENGUAGE_KEY]!}
        
        let result = [Constants.LENGUAGE_KEY: languagesArray]
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(Constants.GET_LENGUAGES_NOTIFICATION), object: nil, userInfo: result)
        }
        
    }
    class func sendErrorNotification(){
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
        }
    }
}
