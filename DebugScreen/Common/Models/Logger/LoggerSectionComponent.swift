//
//  LoggerSectionComponent.swift
//  DebugScreen
//
//  Created by Ilya Klimenyuk on 01.06.2023.
//

/// All available logger sections ready-to-use components.
public enum LoggerSectionComponent {
    /// Toggle, that activate / deactive logger.
    case loggerActivationToggle
    /// Toggle, that activate / deactivate writing info logs to file.
    case enableLogInfoToggle
    /// Toggle, that activate / deactivate writing errors logs to file.
    case enableLogErrorsToggle
    /// Button, that will open log file action list.
    case logFileActionList
    /// Button, that open log file.
    case logFileOpenAction
    /// Button, that clear log file.
    case logFileClearAction
}
