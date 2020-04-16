# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
flutter_application_path = '/Users/ronds/Documents/github/FlutterDemo/flutter_demo'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
target 'iOSDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  install_all_flutter_pods(flutter_application_path)
  
  # Pods for iOSDemo
  # Facebook YogaKit https://github.com/facebook/yoga/tree/master/YogaKit
  pod 'YogaKit', '~> 1.7'
  
  # ReactiveCocoa
  pod 'ReactiveObjC','~>3.1.1'
  
  # Masonry 布局框架
  pod 'Masonry','~>1.1.0'
  
  
  target 'iOSDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iOSDemoUITests' do
    # Pods for testing
  end

end
