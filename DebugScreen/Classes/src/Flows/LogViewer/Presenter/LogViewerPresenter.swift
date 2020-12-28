//
//  LogViewerPresenter.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import Foundation

final class LogViewerPresenter: LogViewerModuleOutput {

    // MARK: - Public Properties

    weak var view: LogViewerViewInput?
    var shareLogsBlock: ((String) -> Void)?

    // MARK: - Private Properties

    private let service: LogCatcherService

    // MARK: - Initialization

    init(service: LogCatcherService) {
        self.service = service
    }

}

// MARK: - LogViewerModuleInput

extension LogViewerPresenter: LogViewerModuleInput { }

// MARK: - LogViewerViewOutput

extension LogViewerPresenter: LogViewerViewOutput {

    func viewLoaded() {
        configureCaptureStatusInfo()
        configureLogObserver()
    }

    func shareLogs() {
        if service.logsObservable.value.isEmpty {
            return
        }

        shareLogsBlock?(service.logsObservable.value)
    }

    func clearLogs() {
        service.logsObservable.value = ""
    }

}

// MARK: - Private Methods

private extension LogViewerPresenter {

    func configureCaptureStatusInfo() {
        view?.setStdErrCaptureStatus(service.stdErrCaptureEnabled)
        view?.setStdOutCaptureStatus(service.stdOutCaptureEnabled)
    }

    func configureLogObserver() {
        service.logsObservable.addObserver(self) { [weak self] (logs: String) in
            DispatchQueue.main.async {
                self?.view?.setLogText(logs)
            }
        }
    }

}
