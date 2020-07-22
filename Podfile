# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Hymnal-CACI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  	pod 'Alamofire'
	pod 'MBProgressHUD'
	pod 'RxSwift'
	pod 'RxCocoa'
	pod 'Firebase/Core'
  	pod 'Firebase/Analytics'
	pod 'Firebase/Firestore'
	pod 'FirebaseFirestoreSwift'
	

  target 'Hymnal-CACITests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Hymnal-CACIUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
          installer.pods_project.build_configurations.each do |config|
              config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
              config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
          end
  end

end


