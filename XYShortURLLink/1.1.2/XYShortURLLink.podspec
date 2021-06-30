Pod::Spec.new do |s|
  s.name             = 'XYShortURLLink'
  s.version          = '1.1.2'
  s.summary          = '长、短链转换服务'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYShortURLLink'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gitsource' => 'gitsource@quvideo.com' }
  s.source           = { :git => 'git@github.com:QuVideoDeveloper/XYShortURLLink.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = "#{s.name}/Classes/**/*"
  s.dependency 'XYAPIAdapter'
end
