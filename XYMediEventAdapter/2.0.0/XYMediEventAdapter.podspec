Pod::Spec.new do |s|
  s.name             = 'XYMediEventAdapter'
  s.version          = '2.0.0'
  s.summary          = '底层使用上层埋点发送功能的适配器'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYMediEventAdapter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'irobbin1024' => 'longbin.lai@quvideo.com' }
  s.source           = { :git => 'https://github.com/QuVideoDeveloper/XYMediEventAdapter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = "#{s.name}/Classes/**/*"
end
