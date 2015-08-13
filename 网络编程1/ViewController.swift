//
//  ViewController.swift
//  网络编程1
//
//  Created by goofygao on 8/13/15.
//  Copyright (c) 2015 goofygao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLSessionDownloadDelegate {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      let url = NSURL(string: "http://farm3.staticflickr.com/2485/3840459705_9f489262bd_z.jpg?zz=1")
        //配置默认模式
     let sessionConfigtion = NSURLSessionConfiguration.defaultSessionConfiguration()
      let session = NSURLSession(configuration: sessionConfigtion, delegate: self, delegateQueue: nil)
        var task = session.downloadTaskWithURL(url!)
        task.resume()
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL)
    {
           var data = NSData(contentsOfURL: location)
            var image1 = UIImage(data: data!)
        image.image = image1
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        var pre:Double = Double(totalBytesWritten)/Double(totalBytesExpectedToWrite)
        print(pre)
    }
    

}

