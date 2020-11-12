#
# Be sure to run `pod lib lint XYOpenUDID.podspec' to ensure this is a
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

  s.name             = 'XYOpenUDID'
  s.version          = "1.0.0"
  s.summary          = 'OpenUDID 组件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
好用的获取OpenUDID组件
                       DESC

  s.homepage         = 'https://github.com/QuVideoDeveloper/XYOpenUDID.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SandsLee' => 'shuzhi.li@quvideo.com' }
  s.source           = { :git => 'git@github.com:QuVideoDeveloper/XYOpenUDID.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'XYOpenUDID/Classes/**/*'

  # mrc
  s.requires_arc = false
  s.requires_arc = ['XYOpenUDID/Classes/ARC/**/*']
  
  # s.resource_bundles = {
  #   'XYOpenUDID' => ['XYOpenUDID/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
