//
//  ViewController.swift
//  WindowsFrameworkTesting
//
//  Created by Salma on 1/2/20.
//  Copyright © 2020 Salma. All rights reserved.
//

import UIKit
import WindowsFrameWork

class ViewController: UIViewController {

    @IBAction func saveClicked(_ sender: Any) {
        presentModalStatusView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentModalStatusView() {
        let statusView = SFStatusView(frame: self.view.bounds)
        let downloadImage = UIImage(named: "saved") ?? UIImage()
        statusView.set(image: downloadImage)
        statusView.set(headline: "Saving")
        view.addSubview(statusView)
    }
}

