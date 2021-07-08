source 'https://cdn.cocoapods.org/'
platform :ios, '11.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

abstract_target 'BasePods' do
  # pods
  pod 'Alamofire', '4.8.1'
  pod 'AlamofireImage', '3.5.0'
  pod 'PureLayout', '3.1.4'

  # targets
  target 'PropertyFinder'
  target 'PropertyFinderTests'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
