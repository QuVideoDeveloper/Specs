Pod::Spec.new do |s|
  s.name        = 'XYToolKit'
  s.version     = '1.0.0'
  s.summary     = '中台工具类'
  s.homepage    = 'https://github.com/QuVideoDeveloper/XYToolKit'
  s.license     = { :type => 'GPL', :file => 'LICENSE' }
  s.author      = { 'gitsource' => 'gitsource@quvideo.com' }
  s.source      = { :git => "https://github.com/QuVideoDeveloper/XYToolKit.git", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = "#{s.name}/Classes/**/*"
  s.frameworks = "Photos"
end
