//
//  Model.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import Foundation


protocol ModelDelegate {
    
    func videosFetched(_ videos:[Items])
}


struct Model{
    var delegate:ModelDelegate?
    
    func fetchVideos(){
        let url = URL(string: Constants.URL)!

           let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
             if let error = error {
                 print("AN ERROR OCCURED FROM GETTING DATA \(error)")
               return
             }

               if let data = data,
                      let youtubeResponse = try? JSONDecoder().decode(ResponseModel.self, from: data) {
                
                   if let item = youtubeResponse.items{
                       
                       DispatchQueue.main.async {
                           self.delegate?.videosFetched(item)
                       }
                      
                      // completionHandler(item)
                   }

               }
                   
                   else{
                       print("AN ERROR OCCURED FROM PARSING \(data.debugDescription)")
                   }
                   
               }
        
           )
           
                        
         task.resume()
                                                 
    }
 
}
