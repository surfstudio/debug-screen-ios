...

// MARK: - Private Methods

private extension AppDelegate {

    func configureDebugScreen() {
        /// Activate logger at start if you want to write logs
        /// Also you can do it with `loggerActivationToggle`
        /// at logger section (if you'll add this element to sections list)
        DebugScreenConfiguration.shared.logCatcherService.isActive = true
        configureDebugScreenSections()
    }

    func configureDebugScreenSections() {
        let serverSelectionSection = ServerSelectionSectionBuilder().build()
        let actionsSection = ActionsSectionBuilder().build()
        let togglesSection = TogglesSectionBuilder().build()
        let copiedTextSection = CopiedTextSectionBuilder().build()

        DebugScreenConfiguration.shared.sections = [serverSelectionSection,
                                                    actionsSection,
                                                    togglesSection,
                                                    copiedTextSection]
    }

}
