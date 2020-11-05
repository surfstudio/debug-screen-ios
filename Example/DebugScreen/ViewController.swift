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
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("___ ERROR!!! ___")

        DebugScreenConfiguration.shared.cacheCleanerActionsProvider = ActionsProvider()
        DebugScreenConfiguration.shared.logCatcherService.setStdErrCatcherEnabled()
        DebugScreenConfiguration.shared.logCatcherService.setStdOutCatcherEnabled()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            //self.textView.text = self.service.logs()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class ActionsProvider: CacheCleanerActionsProvider {
    func actions() -> [CacheCleanerAction] {
        return [
            CacheCleanerAction(title: "First action", block: {

            }),
            CacheCleanerAction(title: "Second action", block: {

            })
        ]
    }
}
