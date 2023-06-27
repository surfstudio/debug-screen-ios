import DebugScreen

final class DebugScreenAction: Action {

    // MARK: - Properties

    /// Text, that will be displayed on action button.
    let title: String
    /// Action style, that affects on the action button appearance.
    /// Apprearance can be primary, secondary, destructive. Default value is `primary`.
    let style: ActionStyle
    /// Action block, that will be triggered on button tap.
    let block: (() -> Void)?

    // MARK: - Initialization

    init(title: String, style: ActionStyle = .primary, block: (() -> Void)?) {
        self.title = title
        self.style = style
        self.block = block
    }

}
