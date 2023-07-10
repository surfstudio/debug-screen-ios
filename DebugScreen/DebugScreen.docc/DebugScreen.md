# ``DebugScreen``

Framework for quickly creating and customizing an application`s debug screen.

## Overview

DebugScreen provides components for creating debug screen blocks to manage your application settings. You can add all necessary actions with ``Action`` protocol and combine them into ``ActionList``. Also you can add ``FeatureToggle`` for disable / enable some functionality of your app. You can implement ``SelectionList`` for server or other selection options. ``CopiedText`` component can be used for copy some text on tap.

Framework provides ``LogCatcherService``, which write all necessary events to log file. Also you can open custom screens from main menu with built-in ``DebugScreenPresenterService``.

So, library allows you to customize debug screen as you want.

![A technology icon representing the DebugScreen framework.](debug_screen_demo.png)

## Topics

### Tutorials
- <doc:DebugScreen>

### Essentials
- <doc:ConfigureDebugScreenContent>
- <doc:OpenDebugScreen>
- <doc:LoggerUsing>

### Configure debug screen
- ``DebugScreenConfiguration``

### Services
- ``DebugScreenPresenterService``
- ``LogCatcherService``

### Building the sections
- ``MainTableBlock``
- ``DebugScreen/SectionBuilder``
- ``DebugScreen/TableSection``

### Actions
- ``Action``
- ``ActionStyle``
- ``ActionList``

### Copied text and toggles
- ``CopiedText``
- ``FeatureToggle``

### Selection list
- ``SelectionList``
- ``SelectionListItem``

### Additional components
- ``LoggerSectionComponent``
