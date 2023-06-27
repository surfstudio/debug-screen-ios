# How to open debug screen

Learn how to run Debug Dashboard.

## Overview

Debug screen can be opened two ways - programmatically or on device shake.

### Programmatically

For programmatically opening you'll need to call next function:
```swift
DebugScreenPresenterService.shared.showDebugScreen()
```

### On device shake

For open debug screen on device shake you'll need to activate this feature next way:
```swift
DebugScreenConfiguration.shared.isEnabledOnShake = true
```

> Note: By default this property is `false`.
