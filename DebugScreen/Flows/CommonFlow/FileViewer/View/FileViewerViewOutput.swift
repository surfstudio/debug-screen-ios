//
//  FileViewerViewOutput.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 19.05.2023.
//

import QuickLook

protocol FileViewerViewOutput: QLPreviewControllerDataSource {
    func viewLoaded()
}
