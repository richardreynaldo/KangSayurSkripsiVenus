# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'KangSayurSkripsiVenus' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KangSayurSkripsiVenus
  pod 'Firebase/Analytics'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'Firebase/Auth'

  target 'KangSayurSkripsiVenusTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'KangSayurSkripsiVenusUITests' do
    # Pods for testing
  end

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
  end
 end
end
