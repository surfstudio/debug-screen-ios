// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum ActionList {
    /// Стандартное
    internal static let defaultActionTitle = L10n.tr("Localizable", "ActionList.defaultActionTitle")
    /// Выберите действие
    internal static let message = L10n.tr("Localizable", "ActionList.message")
    /// Список действий
    internal static let title = L10n.tr("Localizable", "ActionList.title")
  }

  internal enum Actions {
    /// Удаление
    internal static let destructiveTitle = L10n.tr("Localizable", "Actions.destructiveTitle")
    /// Действия
    internal static let header = L10n.tr("Localizable", "Actions.header")
    /// Открытие экрана
    internal static let openScreenTitle = L10n.tr("Localizable", "Actions.openScreenTitle")
    /// Вспомогательное
    internal static let secondaryTitle = L10n.tr("Localizable", "Actions.secondaryTitle")
  }

  internal enum CopiedText {
    /// Ключ SSH
    internal static let firstTextTitle = L10n.tr("Localizable", "CopiedText.firstTextTitle")
    /// Копируемый текст
    internal static let header = L10n.tr("Localizable", "CopiedText.header")
    /// Токен
    internal static let secondTextTitle = L10n.tr("Localizable", "CopiedText.secondTextTitle")
    /// Данные для копирования
    internal static let thirdTextTitle = L10n.tr("Localizable", "CopiedText.thirdTextTitle")
  }

  internal enum DestinationController {
    /// Это новый экран!
    internal static let contentText = L10n.tr("Localizable", "DestinationController.contentText")
    /// Новый экран
    internal static let title = L10n.tr("Localizable", "DestinationController.title")
  }

  internal enum FeatureToggles {
    /// Показывать касания
    internal static let firstToggleTitle = L10n.tr("Localizable", "FeatureToggles.firstToggleTitle")
    /// Переключатели
    internal static let header = L10n.tr("Localizable", "FeatureToggles.header")
    /// Использовать SSH
    internal static let secondToggleTitle = L10n.tr("Localizable", "FeatureToggles.secondToggleTitle")
    /// Открыть листинг foodtech/ecom каталога перед просмотром
    internal static let thirdToggleTitle = L10n.tr("Localizable", "FeatureToggles.thirdToggleTitle")
  }

  internal enum InfoTable {
    /// Информация о приложении
    internal static let aboutApp = L10n.tr("Localizable", "InfoTable.AboutApp")
    /// Информация об устройстве
    internal static let aboutDevice = L10n.tr("Localizable", "InfoTable.AboutDevice")
    /// Произвольные данные
    internal static let custom = L10n.tr("Localizable", "InfoTable.Custom")
    /// Информационные таблицы
    internal static let header = L10n.tr("Localizable", "InfoTable.header")
  }

  internal enum MenuItems {
    /// Открыть экран
    internal static let disclosureTitle = L10n.tr("Localizable", "MenuItems.disclosureTitle")
    /// Пункты меню
    internal static let header = L10n.tr("Localizable", "MenuItems.header")
    /// Многострочный пункт меню
    /// с очень длинным описанием, которое занимает несколько строк
    internal static let multilineTitle = L10n.tr("Localizable", "MenuItems.multilineTitle")
    /// Информационный пункт (без действия)
    internal static let noActionTitle = L10n.tr("Localizable", "MenuItems.noActionTitle")
    /// Простое действие
    internal static let simpleTitle = L10n.tr("Localizable", "MenuItems.simpleTitle")
  }

  internal enum NestedScreens {
    /// Вложенные экраны
    internal static let header = L10n.tr("Localizable", "NestedScreens.header")
    /// Вложенность экранов
    internal static let nestedTitle = L10n.tr("Localizable", "NestedScreens.nestedTitle")
    /// Настройки
    internal static let settingsTitle = L10n.tr("Localizable", "NestedScreens.settingsTitle")
    internal enum Nested {
      /// Информация
      internal static let deepInfoSectionTitle = L10n.tr("Localizable", "NestedScreens.Nested.deepInfoSectionTitle")
      /// Действие глубокого уровня
      internal static let deepMenuItemTitle = L10n.tr("Localizable", "NestedScreens.Nested.deepMenuItemTitle")
      /// Действия
      internal static let deepMenuSectionTitle = L10n.tr("Localizable", "NestedScreens.Nested.deepMenuSectionTitle")
      /// Глубокий уровень
      internal static let deepScreenTitle = L10n.tr("Localizable", "NestedScreens.Nested.deepScreenTitle")
      /// Действие среднего уровня
      internal static let middleMenuItemTitle = L10n.tr("Localizable", "NestedScreens.Nested.middleMenuItemTitle")
      /// Действия
      internal static let middleMenuSectionTitle = L10n.tr("Localizable", "NestedScreens.Nested.middleMenuSectionTitle")
      /// Глубже
      internal static let nestedScreenSectionTitle = L10n.tr("Localizable", "NestedScreens.Nested.nestedScreenSectionTitle")
    }
    internal enum Settings {
      /// API ключи
      internal static let copiedTextSectionTitle = L10n.tr("Localizable", "NestedScreens.Settings.copiedTextSectionTitle")
      /// API ключ
      internal static let copiedTextTitle = L10n.tr("Localizable", "NestedScreens.Settings.copiedTextTitle")
      /// Показывать касания
      internal static let firstToggleTitle = L10n.tr("Localizable", "NestedScreens.Settings.firstToggleTitle")
      /// Использовать SSH
      internal static let secondToggleTitle = L10n.tr("Localizable", "NestedScreens.Settings.secondToggleTitle")
      /// Переключатели
      internal static let togglesSectionTitle = L10n.tr("Localizable", "NestedScreens.Settings.togglesSectionTitle")
    }
  }

  internal enum ServerSelection {
    /// Продовый
    internal static let firstServerTitle = L10n.tr("Localizable", "ServerSelection.firstServerTitle")
    /// Выбор сервера
    internal static let header = L10n.tr("Localizable", "ServerSelection.header")
    /// Тестовый
    internal static let secondServerTitle = L10n.tr("Localizable", "ServerSelection.secondServerTitle")
    /// Моковый (с очень очень очень длинным описанием)
    internal static let thirdServerTitle = L10n.tr("Localizable", "ServerSelection.thirdServerTitle")
  }

  internal enum StartController {
    /// Surf
    internal static let companyNameLabel = L10n.tr("Localizable", "StartController.companyNameLabel")
    /// Встряхни меня!
    internal static let shakeMeLabel = L10n.tr("Localizable", "StartController.shakeMeLabel")
    /// поддержка shake
    internal static let shakeSupportTitleLabel = L10n.tr("Localizable", "StartController.shakeSupportTitleLabel")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
