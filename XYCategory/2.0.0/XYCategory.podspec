Pod::Spec.new do |s|
  s.name             = 'XYCategory'
  s.version          = '2.0.0'
  s.summary          = '底层工具Category'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'irobbin1024' => 'longbin.lai@quvideo.com' }
  s.source           = { :git => 'https://github.com/QuVideoDeveloper/XYCategory.git', :tag => s.version.to_s }
  s.source_files = "#{s.name}/Classes/**/*"
  
  s.ios.deployment_target = '9.0'

  s.default_subspec = 'Full'

  s.subspec 'Full' do |sf|
    sf.dependency 'XYCategories/Foundation'
    sf.dependency 'XYCategories/UIKit'
    sf.source_files = 'XYCategories/Classes/XYCategory.h'
  end

  s.subspec 'Foundation' do |sf|
    sf.source_files = 'XYCategories/Classes/Foundation/**/*'
  end

  s.subspec 'UIKit' do |su|
    su.source_files = 'XYCategories/Classes/UIKit/**/*'
  end

  s.frameworks = 'Accelerate', 'UIKit', 'Foundation', 'AdSupport', 'CoreTelephony'
end
