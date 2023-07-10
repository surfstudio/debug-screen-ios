# Configure content of debug screen

Learn the main framework abilities to build debug screen for your app.

## Overview

Components of DebugScreen are separated by sections. You can combine components of different types inside one section.

To configure DebugScreen section you'll need to follow next steps:
- add instances, that implements protocols of needed components (in other words, create models for your blocks).
- add instances, that implements ``SectionBuilder`` protocol. It has only one function ``SectionBuilder/build()``, inside which you can configure section the way you want.
- build sections and set them into DebugScreen ``DebugScreenConfiguration/sections`` property.

> Important: Every section need its own builder!

Common way of content configuration may look like this:
```swift
func configureDebugScreen() {
    DebugScreenConfiguration.shared.logCatcherService.isActive = true
    configureDebugScreenSections()
}

func configureDebugScreenSections() {
    let serverSelectionSection = ServerSelectionSectionBuilder().build()
    let actionsSection = ActionsSectionBuilder().build()
    let togglesSection = TogglesSectionBuilder().build()
    let copiedTextSection = CopiedTextSectionBuilder().build()

    DebugScreenConfiguration.shared.sections = [serverSelectionSection,
                                                actionsSection,
                                                togglesSection,
                                                copiedTextSection]
}
```

Here we are implement builders for every needed section, build them and then add into sections array.

> Note: Sections will be displayed on the screen in the same order as they are in the array!

You can learn how to create your own DebugScreen with [Meet DebugScreen](<doc:DebugScreen>) tutorial.
