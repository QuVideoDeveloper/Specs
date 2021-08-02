Pod::Spec.new do |s|
  s.name             = 'XYAdConfig'
  s.version          = '2.0.0'
  s.summary          = 'XiaoYing - XYAdConfig'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYAdConfig'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XXY' => 'xinyuan.xu@gmail.com' }
  s.source           = { :git => 'https://github.com/QuVideoDeveloper/XYAdConfig.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = "#{s.name}/Classes/**/*"
  
  s.dependency 'XYCategory'
  s.dependency 'XYAPIAdapter'
end
