# DebugScreen

[![CI](https://github.com/surfstudio/debug-screen-ios/actions/workflows/main.yml/badge.svg)](https://github.com/surfstudio/debug-screen-ios/actions/workflows/main.yml)
[![Documentation](https://github.com/surfstudio/debug-screen-ios/blob/master/docs/badge.svg)](https://surfstudio.github.io/debug-screen-ios/)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-blue.svg)](https://github.com/apple/swift-package-manager)

[![DebugScreen](https://i.ibb.co/PtrBh4f/Group-48095986.png)](https://github.com/surfstudio/debug-screen-ios)

## About

Библиотека для быстрого создания и кастомизации экрана отладки приложения.

## Screenshots

![DebugScreenScreenshot](https://i.ibb.co/4NDCqQK/Group-48095985.png)

## Installation

#### Swift Package Manager

- В XCode пройдите в `File > Swift Packages > Add Package Dependency`
- Введите URL репозитория `https://github.com/surfstudio/DebugScreen.git`

## Features

При создании библиотеки преследовались следующие цели: 

- создать готовый и кастомизируемый шаблон для экрана отладки приложения
- упростить взаимодействие с экраном отладки
- передать в него самые востребованные функции
- ускорить разработку приложения 

Для этого были реализованы следующие фичи:

- **CacheActionsProvider** - Отчистка кэша приложения
- **SelectServerActionsProvider** - Выбор сервера
- **FeatureToggleActionsProvider** - Добавление FeatureToggles (бизнесовых и девелоперских)
- **LogCatcherService** - Запись логов

## Example

Все вышеперечисленное можно увидеть в Example-проекте. Для его корректного запуска и конфигурации скачайте репозиторий и выполните команду `make init` перед тем как его запустить.

## Usage

Для настройки внешнего вида и возможностей экрана отладки необходимо задать на старте приложения его провайдеры, например:
```swift
DebugScreenConfiguration.shared.cacheCleanerActionsProvider = ActionsProvider()
DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
DebugScreenConfiguration.shared.featureToggleActionsProvider = FeatureToggleProvider()
```

Сам экран отладки появляется, если потрясти телефон.

### CacheActionsProvider

<details>
<summary>Подробное описание</summary>
    
Очистка кеша. Для использования необходимо
- создать свой класс, реализующий протокол CacheCleanerActionsProvider
- определить его единственный метод `func actions() -> [CacheCleanerAction]`

CacheCleanerAction определяет заголовок, который будет показан на экране, а также блок кода, который будет вызван при выборе данного action. Пример:

```swift
CacheCleanerAction(title: "Clear score", block: {
    RatingService.clearScore()
    RatingService.didRate = false
})
```
</details>

### SelectServerActionsProvider

<details>
<summary>Подробное описание</summary>
    
Выбор сервера. Для использования необходимо
- создать свой класс, реализующий протокол SelectServerActionsProvider
- определить метод `func servers() -> [SelectServerAction]`, возвращающий список доступных к выбору серверов
- определить метод `func didSelectServer(_ server: SelectServerAction)`, который будет вызван при выборе того или иного сервера

Пример использования:

```swift
final class ServersProvider: SelectServerActionsProvider {

    private var serverActions = [
        SelectServerAction(
            url: URL(string: "https://surf.ru/address/prod"),
            title: "Production",
            isActive: false
        ),
        SelectServerAction(
            url: URL(string: "https://surf.ru/address/test"),
            title: "Test server",
            isActive: true
        ),
        SelectServerAction(
            url: URL(string: "https://surf.ru/address/stage"),
            title: "Stage server (with long long long description)",
            isActive: false
        )
    ]

    func servers() -> [SelectServerAction] {
        return serverActions
    }

    func didSelectServer(_ server: SelectServerAction) {
        serverActions = serverActions.map {
            .init(url: $0.url, title: $0.title, isActive: $0.url == server.url)
        }
        // do something usefull
    }

}
```
</details>

### FeatureToggleActionsProvider

<details>
<summary>Подробное описание</summary>
    
Работа с FeatureToggles. Для использования необходимо
- создать свой класс, реализующий протокол FeatureToggleActionsProvider
- определить метод `func actions() -> [FeatureToggleModel]`, возвращающий список доступных к изменению настроек
- определить метод `func handleAction(with text: String, newValue: Bool)`, который будет вызван при изменении той или иной настройки

#### Полезная практика

Есть бизнесовые и девелоперские FeatureToggles:
- Бизнесовые - те FeatureToggles, на которые делается проверка в коде для разрешения какой-либо реализации.
- Девелоперские - те FeatureToggles, изменения которых обрабатываются глобально во всём коде. Например, отключение анимации. Эти FeatureToggle не проверяются в коде.

Поэтому рекомендуется иметь под рукой список всех FeatureToggles, но при этом хранить значения бизнесовых FeatureToggles отдельно, например:

```swift
/// All feature toggles
enum FeatureToggleKey: String {
    case feature1
    case feature2
    case feature3
    case business1 = "PushNotifications"
}

/// Business FeatureToggles, only true/false, without handling
enum BusinessFeatureToggle {
    static var isPushNotificationsAvailable = false
}
```

В таком случае реализация метода `func actions() -> [FeatureToggleModel]` провайдера может выглядеть следующим образом:
```swift
func actions() -> [FeatureToggleModel] {
    return [
        FeatureToggleModel(text: FeatureToggleKey.feature1.rawValue, value: true),
        FeatureToggleModel(text: FeatureToggleKey.feature2.rawValue, value: false),
        FeatureToggleModel(text: FeatureToggleKey.business1.rawValue, value: BusinessFeatureToggle.isPushNotificationsAvailable)
    ]
}
```

А так может выглядеть обработка изменения того или иного FeatureToggle. Для девелоперских прописываются обработчики действий. Для бизнесовых изменяется значение переменной:
```swift
func handleAction(with text: String, newValue: Bool) {
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
</details>

### Логирование

<details>
<summary>Подробное описание</summary>
    
Для записи логов указать в настройках:
```swift
DebugScreenConfiguration.shared.logCatcherService.setStdErrCatcherEnabled()
DebugScreenConfiguration.shared.logCatcherService.setStdOutCatcherEnabled()
```

Для их получения можно вызвать
```swift
let log = DebugScreenConfiguration.shared.logCatcherService.logs()
```
</details>

## Changelog

Список всех изменений можно посмотреть в этом [файле](./Changelog.md).

## License

[MIT License](./LICENSE)
