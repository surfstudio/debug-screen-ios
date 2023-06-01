// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Common {
    internal enum Actions {
      /// Отмена
      internal static let cancel = L10n.tr("Localizable", "Common.Actions.cancel")
      /// ОК
      internal static let ok = L10n.tr("Localizable", "Common.Actions.ok")
    }
  }

  internal enum Logger {
    /// Очистить файл логов
    internal static let clearLogFileActionTitle = L10n.tr("Localizable", "Logger.clearLogFileActionTitle")
    /// Ошибки
    internal static let enableLogErrorMessagesTitle = L10n.tr("Localizable", "Logger.enableLogErrorMessagesTitle")
    /// Информация
    internal static let enableLogInfoMessagesTitle = L10n.tr("Localizable", "Logger.enableLogInfoMessagesTitle")
    /// Записывать логи
    internal static let enableToggleTitle = L10n.tr("Localizable", "Logger.enableToggleTitle")
    /// Логгер
    internal static let header = L10n.tr("Localizable", "Logger.header")
    /// Открыть файл логов
    internal static let openLogFileActionTitle = L10n.tr("Localizable", "Logger.openLogFileActionTitle")
    internal enum ClearLogsAlert {
      /// Ошибка при очистке файла логов. Попробуйте позже
      internal static let error = L10n.tr("Localizable", "Logger.ClearLogsAlert.error")
      /// Очистка выполнена
      internal static let success = L10n.tr("Localizable", "Logger.ClearLogsAlert.success")
    }
    internal enum LogFile {
      /// Файл логов
      internal static let header = L10n.tr("Localizable", "Logger.LogFile.header")
      internal enum ActionsList {
        /// Очистить
        internal static let clearActionTitle = L10n.tr("Localizable", "Logger.LogFile.ActionsList.clearActionTitle")
        /// Открыть
        internal static let openActionTitle = L10n.tr("Localizable", "Logger.LogFile.ActionsList.openActionTitle")
      }
    }
  }

  internal enum MainPresenter {
    internal enum CopyTextAction {
      /// Текст скопирован
      internal static let complete = L10n.tr("Localizable", "MainPresenter.copyTextAction.complete")
    }
  }

  internal enum MainViewController {
    /// Debug Screen
    internal static let debugTitle = L10n.tr("Localizable", "MainViewController.debugTitle")
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
