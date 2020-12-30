//
//  SystemInfoService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 29.12.2020.
//

import Foundation
import Photos
import UserNotifications
import AVKit


final class SystemInfoService {

    static let shared = SystemInfoService()

    private init() { }

    func cameraPermission() -> AVAuthorizationStatus {
        return AVCaptureDevice.authorizationStatus(for: .video)
    }

}
