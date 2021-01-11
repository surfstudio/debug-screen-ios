//
//  LogViewerViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 28.12.2020.
//

import UIKit

final class LogViewerViewController: UIViewController {

    // MARK: - Public Properties

    var output: LogViewerViewOutput?

    // MARK: - Private Properties

    @IBOutlet private weak var stdOutCaptureStatusLabel: UILabel!
    @IBOutlet private weak var stdErrCaptureStatusLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var autoscrollSwitch: UISwitch!

    private var isAutoscrollEnabled: Bool = true

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()

        configureNavigationBar()
        configureTextView()

        autoscrollSwitch.isOn = isAutoscrollEnabled
    }

}

// MARK: - LogViewerViewInput

extension LogViewerViewController: LogViewerViewInput {

    func setLogText(_ text: String?) {
        textView.text = text

        if textView.text.count > 0 && isAutoscrollEnabled {
            textView.scrollRangeToVisible(NSMakeRange(textView.text.count - 1, 1))
        }
    }

    func setStdOutCaptureStatus(_ isEnabled: Bool) {
        stdOutCaptureStatusLabel.text = "stdout capture " + (isEnabled ? "ENABLED" : "DISABLED")
    }

    func setStdErrCaptureStatus(_ isEnabled: Bool) {
        stdErrCaptureStatusLabel.text = "stderr capture " + (isEnabled ? "ENABLED" : "DISABLED")
    }

}

// MARK: - Private Methods

private extension LogViewerViewController {

    func configureNavigationBar() {
        title = "Logs"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(didTapShareLogsButton))
    }

    func configureTextView() {
        textView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 12.0
    }

}

// MARK: - Actions

private extension LogViewerViewController {

    @objc
    private func didTapShareLogsButton() {
        output?.shareLogs()
    }

    @IBAction func didTapClearLogsButton(_ sender: Any) {
        output?.clearLogs()
    }

    @IBAction func didChangeAutoscrollValue(_ sender: Any) {
        isAutoscrollEnabled = autoscrollSwitch.isOn
    }

}
