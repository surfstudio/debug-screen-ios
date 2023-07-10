//
//  LogCatcherService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 30.10.2020.
//

import Foundation

/// Allows you to catch and get all logs from the console output.
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

    /// Flag that indicates that the logger is active.
    /// Default value is `false`.
    public var isActive = false
    /// Flag that indicates that info messages will be written to the log file.
    /// Default value is `true`.
    public var writeInfoMessages = true
    /// Flag that indicates that error messages will be written to the log file.
    /// Default value is `true`.
    public var writeErrorMessages = true

    // MARK: - Properties

    var logFilePath: String {
        return logPath
    }

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
        setupInitialState()
    }

    public init() {
        self.logPath = NSTemporaryDirectory().appending("\(Constants.defaultLogName)")
        setupInitialState()
    }

    // MARK: - Public Methods

    /// Returns you all saved logs.
    /// - Returns: Full logs list from file.
    public func logs() -> String? {
        return try? String(contentsOfFile: logPath)
    }

    /// Clear log file.
    /// - Parameter onClearComplete: Calls on finish log file clear, contains operation result.
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

    func setupInitialState() {
        clearLogFile()
        setStreamCatcher(stream: Stream.stdErr(), pipe: stdErrPipe, logPath: logPath)
        setStreamCatcher(stream: Stream.stdOut(), pipe: stdOutPipe, logPath: logPath)
    }

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
                self?.isActive == true,
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
        (stream.id == STDOUT_FILENO && writeInfoMessages) || (stream.id == STDERR_FILENO && writeErrorMessages)
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
