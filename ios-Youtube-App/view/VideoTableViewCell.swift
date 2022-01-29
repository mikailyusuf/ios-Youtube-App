//
//  VideoTableViewCell.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var title: UILabel!
    var video:Items?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Items) {
           
           self.video = v
           
           // Ensure that we have a video
           guard self.video != nil else {
               return
           }
           
           // Set the title
        self.title.text = video?.snippet?.title
           
        self.date.text = Helpers.convertToString(dateString: video?.snippet?.publishedAt! ?? "")
    
           
           // Set the thumbnail
        guard self.video!.snippet?.thumbnails?.high?.url != "" else {
               return
           }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache((self.video!.snippet?.thumbnails?.high?.url)!) {
                 
                 // Set the thumbnail imageview
                 self.imageThumbnail.image = UIImage(data: cachedData)
                 return
             }
        
        
        // Download the thumbnail data
               let url = URL(string: (self.video!.snippet?.thumbnails?.high?.url)!)
               
               // Get the shared URL Session object
               let session = URLSession.shared
               
               // Create a data task
               let dataTask = session.dataTask(with: url!) { (data, response, error) in
                   
                   if error == nil && data != nil {
                       
                       // Save the data in the cache
                       CacheManager.setVideoCache(url!.absoluteString, data)
                       
                       // Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                       if url!.absoluteString != self.video!.snippet?.thumbnails?.high?.url {
                           
                           // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                           return
                       }
                       
                       // Create the image object
                       let image = UIImage(data: data!)
                       
                       // Set the imageview
                       DispatchQueue.main.async {
                           self.imageThumbnail.image = image
                       }
                       
                   }
                   
               }
               // Start data task
               dataTask.resume()
        
        
        
    }

    
}
