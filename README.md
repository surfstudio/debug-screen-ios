# DebugScreen

[![CI](https://github.com/surfstudio/debug-screen-ios/actions/workflows/main.yml/badge.svg)](https://github.com/surfstudio/debug-screen-ios/actions/workflows/main.yml)
[![Version](https://img.shields.io/cocoapods/v/DebugScreen.svg?style=flat)](https://cocoapods.org/pods/DebugScreen)
[![License](https://img.shields.io/cocoapods/l/DebugScreen.svg?style=flat)](https://cocoapods.org/pods/DebugScreen)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-blue.svg)](https://github.com/apple/swift-package-manager)

## About

Библеотека для простого и удобного способа создания, и кастомизации экрана отладки приложения.

## Screenshots

![DebugScreenScreenshots](https://i.ibb.co/TKQSVkb/2022-06-28-18-08-44.png)
![DebugScreenScreenshots](https://i.ibb.co/FYjkqG2/2022-06-28-18-08-52.png)

## Installation

#### Swift Package Manager

- В XCode пройдите в `File > Swift Packages > Add Package Dependency`
- Введите URL репозитория `https://github.com/surfstudio/DebugScreen.git`

## Features

При создании библиотеки преследовались следующие цели: 

- создать готовый и кастомизируемый шаблон для отладки приложения
- упростить взаимодействие с экраном отладки
- передать в него самые востребованные функции
- ускорить разработку приложения 

Для этого были реализованы следующие фичи:

- **CacheActionsProvider** - Отчистка кэша приложения
- **SelectServerActionsProvider** - Выбор сервера
- **FeatureToggleActionsProvider** - Добавление FeatureToggles (бизнесовых и девелоперских)
- **LogCatcherService** - Запись логов
- Экран настроек появляется, если потрясти телефон.

## Example

Все вышеперечисленное можно увидеть в Example-проекте. Для его корректного запуска и конфигурации скачайте репозиторий и выполните команду `make init` перед тем как его запустить.

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

## Changelog

Список всех изменений можно посмотреть в этом [файле](./CHANGELOG.md).

## License

[MIT License](./LICENSE)
