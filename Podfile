# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'kinniku-swift' do
  use_frameworks!
  
  pod 'TwitterKit'
  pod 'InteractiveSideMenu'
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Messaging'
  pod 'Firebase/Firestore'
  pod 'SDWebImage'
  pod 'Unbox'
end

post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-kinniku-swift/Pods-kinniku-swift-acknowledgements.plist', 'kinniku-swift/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
