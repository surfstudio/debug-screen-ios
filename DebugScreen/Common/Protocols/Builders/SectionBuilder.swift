//
//  SectionBuilder.swift
//  
//
//  Created by Ilya Klimenyuk on 30.05.2023.
//

/// Abstract protocol for debug screen section builder instance
public protocol SectionBuilder {
    /// Implement this function for build section that you need
    func build() -> TableSection
}
