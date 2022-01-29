//
//  DetailViewController.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var videoTitle: UILabel!
    
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var videoDate: UILabel!
    var video:Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        videoTitle.text = ""
        videoDate.text = ""
        videoDescription.text = ""
        
        // Check if there's a video
              guard video != nil else {
                  return
              }
        
        
        // Create the embed URL
        let embedUrlString = Constants.YT_EMBED_URL + (video?.snippet?.resourceId?.videoId)!
              // Load it into the webview
              let url = URL(string: embedUrlString)
              let request = URLRequest(url: url!)
              webView.load(request)
              
              // Set the title
        videoTitle.text = video!.snippet?.title
        videoDate.text = Helpers.convertToString(dateString: video?.snippet?.publishedAt ?? "")
              
              // Set the description
        videoDescription.text = video?.snippet?.description
    }
    

}
