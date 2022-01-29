//
//  Constants.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import Foundation
struct Constants{
    
    static var tableVioewCell = "tableViewCell"
    static var API_KEY = "Input your API key"
    static var PLAY_LIST_ID = "PLzGHKb8i9vTxodrArxXFPziklf0iqFdC5"
    static var URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&&maxResults=100&playlistId=\(Constants.PLAY_LIST_ID)&key=\(Constants.API_KEY)"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    
    static var dateFormat = "EEEE, MMM d, yyyy"
    static var serverDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
}
