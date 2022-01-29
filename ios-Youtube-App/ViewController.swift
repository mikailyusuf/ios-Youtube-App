//
//  ViewController.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var items: [Items] = []
    
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        
        model.fetchVideos()
//        model.fetchVideos{ [weak self] (items) in
//
//                self?.items = items
//                self?.tableView.reloadData()
//
//          }
    }
    
    
    func videosFetched(_ videos: [Items]) {
        items = videos
       tableView.reloadData()
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableVioewCell, for: indexPath) as! VideoTableViewCell
        
        let video = items[indexPath.row]
        cell.setCell(video)
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
      }

}

