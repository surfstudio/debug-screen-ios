import DebugScreen

final class DebugScreenActionList: ActionList {

    // MARK: - Properties

    /// Text, that will be displayed on action button.
    let title: String
    /// Text, that will be displayer on top of action sheet.
    let message: String?
    /// Action sheet actions.
    /// Cancel action added by default, don't need to implement it yourself.
    let actions: [Action]

    // MARK: - Initialization

    init(title: String, message: String?, actions: [Action]) {
        self.title = title
        self.message = message
        self.actions = actions
    }

}
