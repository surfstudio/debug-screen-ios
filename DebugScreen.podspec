Pod::Spec.new do |spec|
  spec.name             = 'DebugScreen'
  spec.version          = '2.0.0'
  spec.summary          = 'A library for quickly creating and customizing an application`s debug screen.'
  spec.description      = <<-DESC
Allows you to customize your DebugScreen as you want! Available features: server selection, feature toggle managment, custom actions.
                       DESC
  spec.homepage         = 'https://github.com/surfstudio/debug-screen-ios'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }

  spec.author           = { 'Surf' => 'chausov@surf.dev' }

  spec.platform       = :ios, "13.0"
  spec.swift_version  = '5.0'

  spec.source       = { :git => "https://github.com/surfstudio/debug-screen-ios.git", :tag => spec.version.to_s }
  spec.source_files = "DebugScreen/**/*.{swift,strings}"
  spec.resources    = "DebugScreen/**/*.{xib,xcassets}"
end
