// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum ActionsProvider {
    internal enum FirstAction {
      /// Заголовок первого экшена
      internal static let header = L10n.tr("Localizable", "ActionsProvider.FirstAction.header")
      /// Первое сообщение
      internal static let message = L10n.tr("Localizable", "ActionsProvider.FirstAction.message")
      /// Первый экшен
      internal static let title = L10n.tr("Localizable", "ActionsProvider.FirstAction.title")
    }
    internal enum SecondAction {
      /// Заголовок второго экшена
      internal static let header = L10n.tr("Localizable", "ActionsProvider.SecondAction.header")
      /// Второе сообщение
      internal static let message = L10n.tr("Localizable", "ActionsProvider.SecondAction.message")
      /// Второй экшен
      internal static let title = L10n.tr("Localizable", "ActionsProvider.SecondAction.title")
    }
  }

  internal enum SelectServerActionsProvider {
    internal enum FirstServer {
      /// Продовый
      internal static let title = L10n.tr("Localizable", "SelectServerActionsProvider.FirstServer.title")
    }
    internal enum SecondServer {
      /// Тестовый
      internal static let title = L10n.tr("Localizable", "SelectServerActionsProvider.SecondServer.title")
    }
    internal enum ThirdServer {
      /// Stage сервер (с очень очень очень длинным описанием)
      internal static let title = L10n.tr("Localizable", "SelectServerActionsProvider.ThirdServer.title")
    }
  }

  internal enum SelectableTextProvider {
    internal enum FirstText {
      /// Ключ SSH
      internal static let title = L10n.tr("Localizable", "SelectableTextProvider.FirstText.title")
    }
    internal enum SecondText {
      /// Токен
      internal static let title = L10n.tr("Localizable", "SelectableTextProvider.SecondText.title")
    }
    internal enum ThirdText {
      /// Данные для копирования
      internal static let title = L10n.tr("Localizable", "SelectableTextProvider.ThirdText.title")
    }
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
