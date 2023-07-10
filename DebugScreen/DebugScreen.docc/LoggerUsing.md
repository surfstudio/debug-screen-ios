# How to use logger

Using logger to get all events logs.

## Overview

Library has a logger service. It allows you to duplicate informational messages and error messages that are displayed in the Xcode console into a file.

### Enable / Disable logger

To enable the logger, run the following command:
```swift
DebugScreenConfiguration.shared.logCatcherService.isActive = true
```

To disable logger, set `isActive` property into `false`:
```swift
DebugScreenConfiguration.shared.logCatcherService.isActive = false
```

> Note: By default logger is disabled!

### Logging settings

By default logger write info and error messages into file. But you can on / off any of this options.

To disable catching info messages, set ``LogCatcherService/writeInfoMessages`` property of ``LogCatcherService`` into `false`:
```swift
DebugScreenConfiguration.shared.logCatcherService.writeInfoMessages = false
```

To disable catching error messages, set ``LogCatcherService/writeErrorMessages`` property of ``LogCatcherService`` into `false`:
```swift
DebugScreenConfiguration.shared.logCatcherService.writeErrorMessages = false
```

### Manage logs

To open log file call ``DebugScreenPresenterService/openLogFile()`` function:
```swift
DebugScreenPresenterService.shared.openLogFile()
```

> Note: Log file can be opened only when Debug Dashboard is active!

To get a list of logs in string form, you can use the function ``LogCatcherService/logs()``:
```swift
let logs = DebugScreenConfiguration.shared.logCatcherService.logs()
```

In order to clear the log file, you can call the function ``LogCatcherService/clearLogFile(_:)``:
```swift
DebugScreenConfiguration.shared.logCatcherService.clearLogFile { [weak self] isSuccess in
    let message = isSuccess ?
        "Clear complete" :
        "Some problems with clear log file"
    DebugScreenPresenterService.shared.showAlert(with: message)
}
```
The only parameter of this function - closure `onClearComplete: ((Bool) -> Void)?` will be called after clear process end and returns true / false according to operation result. Default value of this parameter - nil.

At the moment, errors related to the setup of constraints are not written to the log file. The log file won't include messages containing the following keywords:
- LayoutConstraints
- UIViewAlertForUnsatisfiableConstraints

However, they will still be displayed in the Xcode console.
