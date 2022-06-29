# DebugScreen

[![CI Status](https://img.shields.io/travis/Anton Shelar/DebugScreen.svg?style=flat)](https://travis-ci.org/Anton Shelar/DebugScreen)
[![Documentation](https://github.com/surfstudio/debug-screen-ios/blob/main/docs/badge.svg)](https://surfstudio.github.io/debug-screen-ios/)
[![Version](https://img.shields.io/cocoapods/v/DebugScreen.svg?style=flat)](https://cocoapods.org/pods/DebugScreen)
[![License](https://img.shields.io/cocoapods/l/DebugScreen.svg?style=flat)](https://cocoapods.org/pods/DebugScreen)
[![Platform](https://img.shields.io/cocoapods/p/DebugScreen.svg?style=flat)](https://cocoapods.org/pods/DebugScreen)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DebugScreen is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DebugScreen'
```

## Author

Anton Shelar, shelaranton@gmail.com

## License

DebugScreen is available under the MIT license. See the LICENSE file for more info.

## Как пользоваться

Экран настроек появляется, если потрясти телефон.

Доступные функции:

cacheCleanerActionsProvider - очистка кэша.
selectServerActionsProvider - выбор сервера.
featureToggleActionsProvider - добавление FeatureToggles (бизнесовых и девелоперских).
logCatcherService - запись логов.

В библиотеку функции передаются через DebugScreenConfiguration.shared

### CacheActionsProvider

Очистка кеша. Реализуется наследованием от CacheCleanerActionsProvider.
В CacheCleanerAction проставляется функционал в block, пример использования:

```CacheCleanerAction(title: "Clear score", block: {
RatingService.clearScore()
RatingService.didRate = false
})
```

### SelectServerActionsProvider

Выбор сервера. Реализуется наследованием от SelectServerActionsProvider.
В SelectServerAction задаются url и выбирается основной, пример использования:

```SelectServerAction(url: URL(string: "https://surf.ru")!, title: "Surf", isActive: true)
...
func didSelectServer(_ server: SelectServerAction) {
Urls._base = server.url.absoluteString
}
```

### FeatureToggleActionsProvider

Работа с FeatureToggles. Реализуется наследованием от FeatureToggleActionsProvider.

#### Полезная практика

Есть бизнесовые и девелоперские FeatureToggles. 
Бизнесовые - чисто true/false, на них делается проверка в коде для разрешения какой-либо реализации.
Девелоперские - те FeatureToggles, изменения которых обрабатываются глобально во всём коде. Например, отключение анимации. Эти FeatureToggle не проверяются в коде.

Поэтому есть список всех FeatureToggles, отдельно хранятся бизнесовые FeatureToggles для проверки их в коде.

FeatureToggleKey - enum с перечислением всех кейсов FeatureToggles и их названиями. Тут и бизнесовые, и девелоперские.
```enum FeatureToggleKey: String {
case feature1
case feature2
case business1 = "PushNotifications"
}
```

BusinessFeatureToggle - enum со статическими FeatureToggles на true/false. 
```enum BusinessFeatureToggle {
static var isPushNotificationsAvailable = false
}
```

В таком случае actions провайдера будут выглядеть следующим образом:
``` func actions() -> [FeatureToggleModel] {
return [
    FeatureToggleModel(text: FeatureToggleKey.feature1.rawValue, value: true),
    FeatureToggleModel(text: FeatureToggleKey.feature2.rawValue, value: false),
    FeatureToggleModel(text: FeatureToggleKey.business1.rawValue, value: BusinessFeatureToggle.isPushNotificationsAvailable)
]
}
```

Также идёт обработка события выбора FeatureToggle. Для девелоперских прописываются обработчики действий. Для бизнесовых изменяется значение переменной:
```func handleAction(with text: String, newValue: Bool) {
        guard let featureToggle = FeatureToggleKey(rawValue: text) else {
            return
        }

        switch featureToggle {
        case .feature1:
            doAction1()
        case .feature2:
            doAction2()
        case .business1:
            BusinessFeatureToggle.isPushNotificationsAvailable = newValue
        }
    }

    func doAction1() { }
    func doAction2() { }
```

### Логирование

Для записи логов указать в настройках:
```DebugScreenConfiguration.shared.logCatcherService.setStdErrCatcherEnabled()
DebugScreenConfiguration.shared.logCatcherService.setStdOutCatcherEnabled()
```
