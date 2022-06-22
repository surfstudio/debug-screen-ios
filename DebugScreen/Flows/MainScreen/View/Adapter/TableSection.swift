//
//  TableSection.swift
//  DebugScreen
//
//  Created by Евгений Васильев on 22.06.2022.
//

struct TableSection {
    let title: String
    let blocks: [MainTableBlock]
}

enum MainTableBlock {
    case featureToggle(model: FeatureToggleModel)
    case cacheCleaner(models: [CacheCleanerAction])
    case selectServer(model: SelectServerAction)
}