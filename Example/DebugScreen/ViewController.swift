//
//  ViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 10/29/2020.
//  Copyright (c) 2020 Anton Shelar. All rights reserved.
//

import UIKit
import DebugScreen

class ViewController: UIViewController {

    var pipe = Pipe()
    var logPath: String?
    let service = LogCatcherService()
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.service.setStdErrCatcherEnabled()
        self.service.setStdOutCatcherEnabled()

        print("___ ERROR!!! ___")

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.textView.text = self.service.logs()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

