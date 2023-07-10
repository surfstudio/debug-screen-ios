# ``DebugScreen/SectionBuilder``

@Metadata {
    @DocumentationExtension(mergeBehavior: override)
}

Abstract protocol for debug screen section builder instance.

## Overview

You'll need to create instance, that implements this protocol for needed section.
For example, builder for section with ``CopiedText`` element may look like this:
 ```swift
 import DebugScreen

 final class CopiedTextSectionBuilder: SectionBuilder {

     // MARK: - Methods

     func build() -> TableSection {
         let item = CopiedTextItem(title: "SSH key", value: "kjdhgaieagf8yhfb8445u_SSH_key")
         return .init(title: "Copied Text", blocks: [.copiedText(model: item)])
     }

 }
 ```

## Topics

### Build the section

- ``build()``
