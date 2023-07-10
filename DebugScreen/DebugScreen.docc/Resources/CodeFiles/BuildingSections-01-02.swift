import DebugScreen
import Foundation

final class ServersSelectionList: SelectionList {

    // MARK: - Properties

    /// Items list.
    let items: [SelectionListItem]
    /// Current selected item.
    var selectedItem: SelectionListItem?
    /// Action, triggered on select item.
    let onSelectAction: ((SelectionListItem) -> Void)?

    // MARK: - Initialization

    init(items: [SelectionListItem],
         selectedItem: SelectionListItem?,
         onSelectAction: ((SelectionListItem) -> Void)?) {
        self.items = items
        self.selectedItem = selectedItem
        self.onSelectAction = onSelectAction
    }

}
