//
//  ResponseModel.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import Foundation
// MARK: - YoutubeResponse

struct ResponseModel : Decodable {
    
    let kind : String?
    let etag : String?
    let items : [Items]?


    enum CodingKeys: String, CodingKey {

        case kind = "kind"
        case etag = "etag"
        case items = "items"
        case pageInfo = "pageInfo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        etag = try values.decodeIfPresent(String.self, forKey: .etag)
        items = try values.decodeIfPresent([Items].self, forKey: .items)
    
    }

}


struct Items : Decodable {
    let kind : String?
    let etag : String?
    let id : String?
    let snippet : Snippet?

    enum CodingKeys: String, CodingKey {

        case kind = "kind"
        case etag = "etag"
        case id = "id"
        case snippet = "snippet"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        etag = try values.decodeIfPresent(String.self, forKey: .etag)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        snippet = try values.decodeIfPresent(Snippet.self, forKey: .snippet)
    }

}

struct Snippet : Decodable {
    let publishedAt : String?
    let channelId : String?
    let title : String?
    let description : String?
    let thumbnails : Thumbnails?
    let channelTitle : String?
    let playlistId : String?
    let position : Int?
    let resourceId : ResourceId?
    let videoOwnerChannelTitle : String?
    let videoOwnerChannelId : String?

    enum CodingKeys: String, CodingKey {

        case publishedAt = "publishedAt"
        case channelId = "channelId"
        case title = "title"
        case description = "description"
        case thumbnails = "thumbnails"
        case channelTitle = "channelTitle"
        case playlistId = "playlistId"
        case position = "position"
        case resourceId = "resourceId"
        case videoOwnerChannelTitle = "videoOwnerChannelTitle"
        case videoOwnerChannelId = "videoOwnerChannelId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        channelId = try values.decodeIfPresent(String.self, forKey: .channelId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        thumbnails = try values.decodeIfPresent(Thumbnails.self, forKey: .thumbnails)
        channelTitle = try values.decodeIfPresent(String.self, forKey: .channelTitle)
        playlistId = try values.decodeIfPresent(String.self, forKey: .playlistId)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        resourceId = try values.decodeIfPresent(ResourceId.self, forKey: .resourceId)
        videoOwnerChannelTitle = try values.decodeIfPresent(String.self, forKey: .videoOwnerChannelTitle)
        videoOwnerChannelId = try values.decodeIfPresent(String.self, forKey: .videoOwnerChannelId)
    }

}


struct ResourceId : Decodable {
    let kind : String?
    let videoId : String?

    enum CodingKeys: String, CodingKey {

        case kind = "kind"
        case videoId = "videoId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decodeIfPresent(String.self, forKey: .kind)
        videoId = try values.decodeIfPresent(String.self, forKey: .videoId)
    }

}


struct Thumbnails : Decodable {
    let high : High?

    enum CodingKeys: String, CodingKey {
        case high = "high"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    
        high = try values.decodeIfPresent(High.self, forKey: .high)
    }

}

struct High : Decodable {
    let url : String?
    let width : Int?
    let height : Int?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case width = "width"
        case height = "height"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
    }

}
