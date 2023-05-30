# DebugScreen

[![CI](https://github.com/surfstudio/debug-screen-ios/actions/workflows/main.yml/badge.svg)](https://github.com/surfstudio/debug-screen-ios/actions/workflows/main.yml)
[![Documentation](https://github.com/surfstudio/debug-screen-ios/blob/master/docs/badge.svg)](https://surfstudio.github.io/debug-screen-ios/)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-blue.svg)](https://github.com/apple/swift-package-manager)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/DebugScreen.svg?style=flat)](https://cocoapods.org)

[![DebugScreen](https://i.ibb.co/PtrBh4f/Group-48095986.png)](https://github.com/surfstudio/debug-screen-ios)

## About

Библиотека для быстрого создания и кастомизации экрана отладки приложения.

## Screenshots

![DebugScreenScreenshot](https://i.ibb.co/4NDCqQK/Group-48095985.png)

## Installation

#### Swift Package Manager

- В XCode пройдите в `File > Swift Packages > Add Package Dependency`
- Введите URL репозитория `https://github.com/surfstudio/DebugScreen.git`

#### CocoaPods:

Добавьте в свой Podfile следующую строку, затем запустите `pod install`

```ruby
pod 'DebugScreen'
```

## Features

При создании библиотеки преследовались следующие цели: 

- создать готовый и кастомизируемый шаблон для экрана отладки приложения
- упростить взаимодействие с экраном отладки
- передать в него самые востребованные функции
- ускорить разработку приложения 

Для этого были реализованы следующие фичи:

- **ActionsProvider** - Позволяет выполнить кастомные действия по нажатию на кнопки экрана
- **SelectServerActionsProvider** - Выбор сервера
- **FeatureToggleActionsProvider** - Добавление FeatureToggles (бизнесовых и девелоперских)
- **SelectableTextProvider** - Позволяет добавить на экран тапабельный текст и задать действие при тапе по нему

## Example

Все вышеперечисленное можно увидеть в Example-проекте. Для его корректного запуска и конфигурации скачайте репозиторий и выполните команду `make init` перед тем как его запустить.

## Usage

Для настройки внешнего вида и возможностей экрана отладки необходимо задать на старте приложения его провайдеры, например:
```swift
DebugScreenConfiguration.shared.actionsProvider = ActionsProvider()
DebugScreenConfiguration.shared.selectServerActionsProvider = ServersProvider()
DebugScreenConfiguration.shared.featureToggleActionsProvider = FeatureToggleProvider()
```

Сам экран отладки появляется, если потрясти телефон.

### ActionsProvider

<details>
<summary>Подробное описание</summary>
    
Позволяет выполнить какие-либо действия. Для использования необходимо
- создать свой класс, реализующий протокол ActionsProvider
- определить его единственный метод `func actions() -> [ActionsProviderModel]`
- каждый ActionsProviderModel под капотом держит массив ActionModel

ActionModel определяет заголовок, который будет показан на экране, а также блок кода, который будет вызван при выборе данного action. Пример:

```swift
ActionModel(title: "Clear score", block: {
    RatingService.clearScore()
    RatingService.didRate = false
})
```
</details>

### SelectServerActionsProvider

<details>
<summary>Подробное описание</summary>
    
Для использования необходимо
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
    
Для использования необходимо
- создать свой класс, реализующий протокол FeatureToggleActionsProvider
- определить метод `func actions() -> [FeatureToggleModel]`, возвращающий список доступных к изменению настроек
- для каждой настройки определить closure, который будет вызываться при переключении свитчера

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
    let featureActions = [
        FeatureToggleModel(text: FeatureToggleKey.feature1.rawValue, value: true) { [weak self] newValue in
            self?.doAction1(with: newValue)
        },
        FeatureToggleModel(text: FeatureToggleKey.feature2.rawValue, value: false) { [weak self] newValue in
            self?.doAction2(with: newValue)
        },
        FeatureToggleModel(
            text: FeatureToggleKey.business1.rawValue,
            value: BusinessFeatureToggle.isPushNotificationsAvailable
        ) { [weak self] newValue in
            BusinessFeatureToggle.isPushNotificationsAvailable = newValue
        }
    ]

    return featureActions
}
```

Для девелоперских FeatureToggle в closure вызываются обработчики действий, а для бизнесовых - изменяется значение переменной.

</details>

### SelectableTextProvider

<details>
<summary>Подробное описание</summary>

Для использования необходимо
- создать свой класс, реализующий протокол SelectableTextProvider
- определить метод `func texts() -> [SelectableTextModel]`, возвращающий список тапабельных элементов
- определить метод `func didSelectText(_ text: SelectableTextModel)`, который будет вызван при выборе того или иного элемента

Пример использования:

```swift
final class TextsProvider: SelectableTextProvider {

    private var selectedText: [SelectableTextModel] = [
        .init(title: "SSH key", value: SSHKeyService().key),
        .init(title: "Token", value: TokenService().token)
    ]

    func texts() -> [SelectableTextModel] {
        return selectedText
    }

    func didSelectText(_ model: SelectableTextModel) {
        // copy model.value in buffer
    }

}
```
</details>

### Логирование

<details>
<summary>Подробное описание</summary>
    
Сервис позволяет дублировать в файл информационные сообщения и сообщения об ошибках, которые выводятся в консоль Xcode.  
Для включения логгера необходимо вызывать следующую функцию:
```swift
DebugScreenConfiguration.shared.logCatcherService.start()
```

Для получения списка логов в строковом виде можно воспользоваться функцией `logs()`:
```swift
let logs = DebugScreenConfiguration.shared.logCatcherService.logs()
```

Для того, чтобы очистить файл с логами, можно вызвать функцию `clearLogFile`:
```swift
DebugScreenConfiguration.shared.logCatcherService.clearLogFile { [weak self] isSuccess in
    let text = isSuccess ?
        L10n.MainPresenter.Logger.ClearLogs.success :
        L10n.MainPresenter.Logger.ClearLogs.error
    self?.onAlertShow?(text)
}
```


Единственный параметр этой функции - closure `onClearComplete: ((Bool) -> Void)?` будет вызван после завершения очистки и вернет true / false в зависимости от успешности операции. По умолчанию значение этого параметра - nil.

Также управлять логгером можно непосредственно на самом Debug экране:
- включение / отключение записи в файл информационных сообщений (print statements etc.)
- включение / отключение записи в файл сообщений об ошибках
- просмотр файла логов с возможностью им поделиться
- очистка файла

На данный момент в файл с логами не пишутся ошибки, связанные с установкой констрейнтов. В log-файл не попадут сообщения, содержащие следующие ключевые слова:
- LayoutConstraints
- UIViewAlertForUnsatisfiableConstraints

При этом в консоли они по-прежнему будут отображаться.

## Changelog

Список всех изменений можно посмотреть в этом [файле](./Changelog.md).

## License

[MIT License](./LICENSE)
