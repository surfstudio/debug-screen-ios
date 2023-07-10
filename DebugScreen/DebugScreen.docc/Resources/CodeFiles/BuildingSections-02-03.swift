import DebugScreen
import UIKit

final class ActionsSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        return .init(title: L10n.Actions.header, blocks: [])
    }

}
