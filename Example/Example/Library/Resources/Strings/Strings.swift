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
