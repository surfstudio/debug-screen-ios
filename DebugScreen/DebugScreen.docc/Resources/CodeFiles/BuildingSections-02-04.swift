import DebugScreen
import UIKit

final class ActionsSectionBuilder: SectionBuilder {

    // MARK: - Methods

    func build() -> TableSection {
        var blocks: [MainTableBlock] = []

        let defaultAction = getAction(style: .secondary)
        let destructiveAction = getAction(style: .destructive)
        let openScreenAction = getOpenScreenAction()

        blocks = [
            .action(model: defaultAction),
            .action(model: destructiveAction),
            .action(model: openScreenAction)
        ]

        return .init(title: L10n.Actions.header, blocks: blocks)
    }

}

// MARK: - Private Methods

private extension ActionsSectionBuilder {

    func getAction(style: ActionStyle) -> DebugScreenAction {
        let title = style == .secondary ?
            L10n.Actions.secondaryTitle :
            L10n.Actions.destructiveTitle
        let actionName = style == .secondary ? "Secondary" : "Destructive"

        let action = DebugScreenAction(title: title, style: style) {
            debugPrint("✅ \(actionName) action complete")
        }

        return action
    }

    func getOpenScreenAction() -> DebugScreenAction {
        let action = DebugScreenAction(title: L10n.Actions.openScreenTitle) {
            let view = DestinationViewController()
            DebugScreenPresenterService.shared.showCustomScreen(view)
        }
        return action
    }

}
