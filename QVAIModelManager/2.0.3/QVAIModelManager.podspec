#
# Be sure to run `pod lib lint QVAIModelManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  def self.smart_version
  tag = `git describe --abbrev=0 --tags 2>/dev/null`.strip
  if $?.success? then tag else "0.0.1" end
end
  s.name             = 'QVAIModelManager'
  s.version          = "2.0.3"
  s.summary          = 'A short description of QVAIModelManager.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Sunshine/QVAIModelManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sunshine' => 'cheng.xia@quvideo.com' }
  s.source           = { :git => 'git@github.com:QuVideoDeveloper/QVAIModelManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  #依赖了QVAIVideoEngineAI 需要设置 ENABLE_BITCODE NO
  s.xcconfig = { "ENABLE_BITCODE" => "NO" }

  s.source_files = 'QVAIModelManager/Classes/**/*'
  s.dependency 'AFNetworking'
  s.dependency 'SSZipArchive'
  s.dependency 'YYModel'
  s.dependency 'QVAIVideoEngineAI/Core'
  s.dependency 'XYApiServiceRouter'

  
  # s.resource_bundles = {
  #   'QVAIModelManager' => ['QVAIModelManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
