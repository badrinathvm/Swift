//
//  ViewController.swift
//  Practice
//
//  Created by Badarinath Venkatnarayansetty on 7/20/17.
//  Copyright © 2017 Badarinath Venkatnarayansetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var nameFields : [String] = ["Name1", "Name2", "Name3"]
    var descriptionFields : [String] = ["Description1","Description2", "Description3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.tableView.register(ReuseCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameFields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! ReuseCell
        cell.nameField.text = nameFields[indexPath.row]
        cell.descriptionField.text = descriptionFields[indexPath.row]
        cell.imageField.downloadImg(url: "https://www.apple.com/euro/ios/ios8/a/generic/images/og.png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func downloadImage() -> Data{
        let urlData:String = "https://www.apple.com/euro/ios/ios8/a/generic/images/og.png"
        let url = NSURL(string: urlData)
        let data = NSData(contentsOf: url as! URL)
        return data as! Data
    }
}

extension UIImageView{
    
    func getDataFromURL(_ url: String, completion: @escaping ((_ data: NSData?) -> Void)){
        URLSession.shared.dataTask(with: NSURL(string: url) as! URL) { (data, response, error) in
            completion(NSData(data: data!))
        }.resume()
    }
    
    func downloadImg(url:String){
        getDataFromURL(url) { (data) in
            self.contentMode = .scaleAspectFit
            self.image = UIImage(data: data! as Data)
        }
    }
}

