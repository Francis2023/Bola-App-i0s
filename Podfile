platform :ios, '13.0'

target 'BankingApp' do
   use_frameworks!

   # Pods for BankingApp

    #Firebase Pod
   pod 'Firebase/Analytics'
   pod 'Firebase/Auth'
   pod 'Firebase/Firestore'
   pod 'FirebaseFirestoreSwift', '~> 7.0-beta'
   
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if Gem::Version.new('8.0') > Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'])
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
      end
    end
  end
end