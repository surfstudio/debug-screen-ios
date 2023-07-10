import DebugScreen

final class CopiedTextItem: CopiedText {

    // MARK: - Properties

    /// Description, that will be shown on screen.
    let title: String
    /// Useful value, that will be copied on cell select.
    /// For example, token or some key.
    let value: String

    // MARK: - Initialization

    init(title: String, value: String) {
        self.title = title
        self.value = value
    }

}
