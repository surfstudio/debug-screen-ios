//
//  SelectServerViewOutput.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import Foundation

protocol SelectServerViewOutput {

    func viewLoaded()
    func serverSelected(action: SelectServerAction)

}
