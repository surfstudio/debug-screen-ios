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
      /// ОК
      internal static let ok = L10n.tr("Localizable", "Common.Actions.ok")
    }
  }

  internal enum DebugScreenCoordinator {
    /// Отмена
    internal static let cancelAction = L10n.tr("Localizable", "DebugScreenCoordinator.cancelAction")
  }

  internal enum MainPresenter {
    /// Функции
    internal static let featuresTitle = L10n.tr("Localizable", "MainPresenter.featuresTitle")
    /// Нажимаемый текст
    internal static let selectedTextTitle = L10n.tr("Localizable", "MainPresenter.selectedTextTitle")
    /// Выбрать сервер
    internal static let serverTitle = L10n.tr("Localizable", "MainPresenter.serverTitle")
    internal enum Logger {
      /// Ошибки
      internal static let errorMessages = L10n.tr("Localizable", "MainPresenter.Logger.errorMessages")
      /// Logger
      internal static let header = L10n.tr("Localizable", "MainPresenter.Logger.header")
      /// Информация
      internal static let infoMessages = L10n.tr("Localizable", "MainPresenter.Logger.infoMessages")
      internal enum ClearLogs {
        /// Ошибка при очистке файла логов. Попробуйте позже
        internal static let error = L10n.tr("Localizable", "MainPresenter.Logger.ClearLogs.error")
        /// Очистка завершена
        internal static let success = L10n.tr("Localizable", "MainPresenter.Logger.ClearLogs.success")
      }
      internal enum LogFile {
        /// Очистить
        internal static let clearActionTitle = L10n.tr("Localizable", "MainPresenter.Logger.LogFile.clearActionTitle")
        /// Файл логов
        internal static let header = L10n.tr("Localizable", "MainPresenter.Logger.LogFile.header")
        /// Открыть
        internal static let openActionTitle = L10n.tr("Localizable", "MainPresenter.Logger.LogFile.openActionTitle")
      }
    }
  }

  internal enum MainViewController {
    /// Debug Screen
    internal static let debugTitle = L10n.tr("Localizable", "MainViewController.debugTitle")
  }

  internal enum SelectionTableCell {
    /// Активен
    internal static let statusTitle = L10n.tr("Localizable", "SelectionTableCell.statusTitle")
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
