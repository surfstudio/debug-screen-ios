//
//  LogCatcherService.swift
//  DebugScreen
//
//  Created by Anton Shelar on 30.10.2020.
//

import Foundation

public final class LogCatcherService {

    // MARK: - Private properties

    private let stdErrPipe = Pipe()
    private let stdOutPipe = Pipe()
    private let logPath: String
    private static let defaultLogName: String = "log"

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

    // MARK: - Initialization

    init(logPath: String) {
        self.logPath = logPath

        clearLogfile()
    }

    public init() {
        self.logPath = NSTemporaryDirectory().appending("\(LogCatcherService.defaultLogName)")

        clearLogfile()
    }

    // MARK: - Public methods

    public func setStdErrCatcherEnabled() {
        setStreamCatcher(stream: Stream.stdErr(), pipe: stdErrPipe, logPath: logPath)
    }

    public func setStdOutCatcherEnabled() {
        setStreamCatcher(stream: Stream.stdOut(), pipe: stdOutPipe, logPath: logPath)
    }

    public func logs() -> String? {
        return try? String(contentsOfFile: logPath)
    }
}

// MARK: - Private methods

private extension LogCatcherService {

    func clearLogfile() {
        do {
            try "".write(toFile: self.logPath, atomically: true, encoding: .utf8)
        } catch {
            assertionFailure()
        }
    }

    private func setStreamCatcher(stream: LogCatcherService.Stream, pipe: Pipe, logPath: String) {
        setvbuf(stream.file, nil, _IONBF, 0)
        dup2(pipe.fileHandleForWriting.fileDescriptor, stream.id)

        pipe.fileHandleForReading.readabilityHandler = { [weak self] handle in
            let data = handle.availableData
            let str: String? = String(data: data, encoding: .utf8)

            if FileManager.default.fileExists(atPath: logPath) {
                if let writeHandle = FileHandle(forWritingAtPath: logPath) {
                    writeHandle.seekToEndOfFile()
                    writeHandle.write(data)
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

}
