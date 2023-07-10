import DebugScreen
import Foundation

final class ServersSelectionListItem: SelectionListItem {

    // MARK: - Properties

    /// Item's name, that will be displayed on selection list item.
    let name: String
    /// Items's value
    let value: Any?

    // MARK: - Initialization

    init(name: String, value: Any?) {
        self.name = name
        self.value = value
    }

}
