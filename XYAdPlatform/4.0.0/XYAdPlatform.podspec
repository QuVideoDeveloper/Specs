Pod::Spec.new do |s|
  s.name             = 'XYAdPlatform'
  s.version          = '4.0.0'
  s.summary          = 'XiaoYing - XYAdPlatform'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYAdPlatform'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SandsLee' => 'shuzhi.li@quvideo.com' }
  s.source           = { :git => 'https://github.com/QuVideoDeveloper/XYAdPlatform.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = "#{s.name}/Classes/**/*"
  
  s.dependency 'XYCategory'
  s.dependency 'XYAdConfig'
  s.dependency 'XYAdCore/AdCore'
  s.dependency 'XYMediEventAdapter'
end
