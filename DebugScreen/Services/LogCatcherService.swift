//
//  LogCatcherService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 30.10.2020.
//

import Foundation

/// Service, that allows you to catch and get all logs from the console output
public final class LogCatcherService {

    // MARK: - Nested Types

    private struct Stream {
        let id: Int32
        let file: UnsafeMutablePointer<FILE>

        static func stdOut() -> Stream {
            return Stream(id: STDOUT_FILENO, file: stdout)
        }

        static func stdErr() -> Stream {
            return Stream(id: STDERR_FILENO, file: stderr)
        }
    }

    // MARK: - Constants

    private enum Constants {
        static let defaultLogName = "logs.txt"
    }

    // MARK: - Public Properties

    public var logFilePath: String {
        return logPath
    }

    /// LogCatcher write info messages to logFile on `true` value
    public var stdOutCatchingEnabled = true
    /// LogCatcher write error messages to logFile on `true` value
    public var stdErrCatchingEnabled = true

    // MARK: - Private Properties

    /// Pipe to consume the messages on STDOUT
    private let stdOutPipe = Pipe()
    /// Pipe to consume the messages on STDERR
    private let stdErrPipe = Pipe()
    /// Pipe to output messages back to STDOUT
    private let consolePipe = Pipe()

    private let logPath: String

    // MARK: - Initialization

    init(logPath: String) {
        self.logPath = logPath
        clearLogFile()
    }

    /// Initialization log service in debug screen
    public init() {
        self.logPath = NSTemporaryDirectory().appending("\(Constants.defaultLogName)")
        clearLogFile()
    }

    // MARK: - Public Methods

    /// Start logger and configure cathers
    public func start() {
        setStreamCatcher(stream: Stream.stdErr(), pipe: stdErrPipe, logPath: logPath)
        setStreamCatcher(stream: Stream.stdOut(), pipe: stdOutPipe, logPath: logPath)
    }

    /// Returns you all saved logs
    public func logs() -> String? {
        return try? String(contentsOfFile: logPath)
    }

    /// Clear log file
    public func clearLogFile(_ onClearComplete: ((Bool) -> Void)? = nil) {
        do {
            try "".write(toFile: self.logPath, atomically: true, encoding: .utf8)
            onClearComplete?(true)
        } catch {
            assertionFailure()
            onClearComplete?(false)
        }
    }

}

// MARK: - Private Methods

private extension LogCatcherService {

    private func setStreamCatcher(stream: LogCatcherService.Stream, pipe: Pipe, logPath: String) {
        setvbuf(stream.file, nil, _IONBF, 0)

        /// copying the STDOUT file descriptor into our console pipe's file descriptor
        /// this is so we can write the strings back to STDOUT, so it can show up on the xcode console
        dup2(STDOUT_FILENO, consolePipe.fileHandleForWriting.fileDescriptor)

        /// copying the STDOUT / STDERR file descriptor into stdout / stderr pipe's file descriptor
        dup2(pipe.fileHandleForWriting.fileDescriptor, stream.id)

        pipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            let str: String? = String(data: data, encoding: .utf8)

            /// write the data back into the output pipe, the console pipe's write file descriptor points to STDOUT.
            /// this allows the logs to show up on the Xcode console
            self?.consolePipe.fileHandleForWriting.write(data)

            guard
                self?.isNeedCatchStream(stream) == true,
                self?.isLayoutMessage(str) == false
            else {
                return
            }

            /// write data into file
            if FileManager.default.fileExists(atPath: logPath) {
                if let writeHandle = FileHandle(forWritingAtPath: logPath) {
                    writeHandle.seekToEndOfFile()
                    writeHandle.write(data)

                    self?.addSeparatorLine(with: writeHandle)

                    writeHandle.synchronizeFile()
                    writeHandle.closeFile()
                } else {
                    assertionFailure()
                }
            } else {
                do {
                    try str?.write(toFile: logPath, atomically: true, encoding: .utf8)
                } catch {
                    assertionFailure()
                }
            }
        }
    }

    func addSeparatorLine(with file: FileHandle) {
        let separatorLine = "\n" + "********************" + "\n" + "\n"
        let data = Data(separatorLine.utf8)

        file.seekToEndOfFile()
        file.write(data)
    }

    private func isNeedCatchStream(_ stream: LogCatcherService.Stream) -> Bool {
        (stream.id == STDOUT_FILENO && stdOutCatchingEnabled) || (stream.id == STDERR_FILENO && stdErrCatchingEnabled)
    }

    func isLayoutMessage(_ message: String?) -> Bool {
        guard let message = message else {
            return false
        }

        /// Message, contains any of this key words won't be write into log file
        let keyWords = ["LayoutConstraints", "UIViewAlertForUnsatisfiableConstraints"]

        for keyWord in keyWords {
            if message.contains(keyWord) {
                return true
            }
        }

        return false
    }

}
