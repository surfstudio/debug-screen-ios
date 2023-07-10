# ``DebugScreen/TableSection``

@Metadata {
    @DocumentationExtension(mergeBehavior: override)
}

Representation of main screen table section.

## Overview

All debug screen elements grouped into sections. Every section object provides information about its title and included blocks.

Also framework have a special predefined builder to control the logger.

## Topics

### Create section
- ``init(title:blocks:)``

### Properties
- ``title``
- ``blocks``

### Build logger section
- ``logger(with:)``
