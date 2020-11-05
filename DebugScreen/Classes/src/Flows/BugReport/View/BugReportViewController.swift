//
//  BugReportViewController.swift
//  DebugScreen
//
//  Created by Anton Shelar on 03.11.2020.
//

import UIKit
import SurfUtils

class BugReportViewController: UIViewController, KeyboardObservable {

    // MARK: - Public properties

    var output: BugReportViewOutput?

    // MARK: - Private properties

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var sendButton: UIButton!
    @IBOutlet private weak var sendButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Report a bug"

        output?.configureAdapter(tableView: tableView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        subscribeOnKeyboardNotifications()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)

        unsubscribeFromKeyboardNotifications()
    }
}

// MARK: - BugReportViewInput

extension BugReportViewController: BugReportViewInput { }

// MARK: - CommonKeyboardPresentable

extension BugReportViewController: CommonKeyboardPresentable {

    func keyboardWillBeShown(keyboardHeight: CGFloat, duration: TimeInterval) {
        sendButtonBottomConstraint.constant = keyboardHeight

        view.layoutIfNeeded()
    }

    func keyboardWillBeHidden(duration: TimeInterval) {
        sendButtonBottomConstraint.constant = 0.0

        view.layoutIfNeeded()
    }

}

// MARK: - Private methods

private extension BugReportViewController {

    @IBAction func didTapSendButton(_ sender: Any) {
        output?.sendReport()
    }
}
