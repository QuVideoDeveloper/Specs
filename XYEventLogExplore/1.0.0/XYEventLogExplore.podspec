
Pod::Spec.new do |s|

  def self.smart_version
    tag = `git describe --abbrev=0 --tags 2>/dev/null`.strip
    if $?.success? then tag else "0.0.1" end
  end

  s.name             = 'XYEventLogExplore'
  s.version          = "1.0.0"
  s.summary          = 'XiaoYing - XYEventLogExplore.'

  s.description      = <<-DESC
XiaoYing pod 库 - XYEventLogExplore
                       DESC

  s.homepage         = 'git@github.com:QuVideoDeveloper/XYEventLogExplore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'irobbin1024' => 'longbin.lai@quvideo.com' }
  s.source           = { :git => 'git@github.com:QuVideoDeveloper/XYEventLogExplore.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'XYEventLogExplore/Classes/**/*'
  
  s.resource_bundles = {
    'XYEventLogExplore' => ['XYEventLogExplore/Recourse/**/*.*']
  }

  s.dependency 'GCDWebServer'
  s.dependency 'YYModel'
  
end
