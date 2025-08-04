platform :ios, '17.2'

target 'DynamoxQuiz' do
  use_frameworks!

  pod 'RxSwift', '~> 6.5'
  pod 'RxCocoa', '~> 6.5'
  pod 'SnapKit', '~> 5.6'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.2'
    end
  end
end
