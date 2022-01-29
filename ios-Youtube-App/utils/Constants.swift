//
//  Constants.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import Foundation
struct Constants{
    
    static var tableVioewCell = "tableViewCell"
    static var API_KEY = "AIzaSyCk-hKmkhEDvuLNL6NtiCVnoUKWrCM4Qec"
    static var PLAY_LIST_ID = "PLzGHKb8i9vTxodrArxXFPziklf0iqFdC5"
    static var URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&&maxResults=100&playlistId=\(Constants.PLAY_LIST_ID)&key=\(Constants.API_KEY)"
}
