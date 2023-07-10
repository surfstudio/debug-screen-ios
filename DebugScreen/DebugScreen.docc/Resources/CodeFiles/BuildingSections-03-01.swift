import DebugScreen
import Foundation

final class UserDefaultsFeatureToggle: FeatureToggle {

    // MARK: - Properties

    /// Toggle's name, will be shown on screen.
    let title: String

    /// Toggle's status.
    /// You can add needed action inside `set` block.
    /// It will be triggered on `valueChanged` event.
    var isEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: key)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }

    }

    // MARK: - Private Properties

    private let key: String

    // MARK: - Initialization

    init(title: String, key: String) {
        self.title = title
        self.key = key
    }

}
