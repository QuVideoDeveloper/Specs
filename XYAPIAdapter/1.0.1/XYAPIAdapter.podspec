Pod::Spec.new do |s|
  s.name             = 'XYAPIAdapter'
  s.version          = '1.0.1'
  s.summary          = '底层使用上层API的适配器'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYAPIAdapter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'irobbin1024' => 'longbin.lai@quvideo.com' }
  s.source           = { :git => 'https://github.com/QuVideoDeveloper/XYAPIAdapter.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'XYAPIAdapter/Classes/**/*'
end
