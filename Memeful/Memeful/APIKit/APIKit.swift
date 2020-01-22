//
//  APIKit.swift
//  Memeful
//
//  Created by Sunmoon on 23/01/20.
//  Copyright © 2020 Ravichandra. All rights reserved.
//
/*
 https://api.imgur.com/oauth2/addclient
 Client ID:
 705d1626bf00932
 Client secret:
 bb586c7e662adf54b02453a2846359e9e67a5660
 */
 
import Foundation


class APIKit: NSObject {
    static var shared = APIKit()
    override init() {
        super.init()
    }
    
    func getGalary(completion: @escaping ((MemeList?) -> Void)){
        var urlRequest:URLRequest = URLRequest(url: URL(string: "https://api.imgur.com/3/gallery/hot/time/day/1")!)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("Client-ID 705d1626bf00932", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: urlRequest){data,response,error in
            print(response as Any)
            if let data = data {
               do {
//                  let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let memesList:MemeList = try JSONDecoder().decode(MemeList.self, from: data)
                    print(memesList.data.first?.title as Any)
                    completion(memesList)
               } catch let error {
                  print(error)
               }
            }
            
        }
        task.resume()
    }
}
