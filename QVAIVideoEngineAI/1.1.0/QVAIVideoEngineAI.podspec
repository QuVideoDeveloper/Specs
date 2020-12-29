#
# Be sure to run `pod lib lint QVAIVideoEngineAI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

#
Pod::Spec.new do |s|
    def self.smart_version
    tag = `git describe --abbrev=0 --tags 2>/dev/null`.strip
    if $?.success? then tag else "0.0.1" end
end
  s.name             = 'QVAIVideoEngineAI'
  s.version          = "1.1.0"
  s.summary          = 'A short description of QVAIVideoEngineAI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'git@github.com:QuVideoDeveloper/QVAIVideoEngineAI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sunshine' => 'cheng.xia@quvideo.com' }
  s.source           = { :git => 'git@github.com:QuVideoDeveloper/QVAIVideoEngineAI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  
  s.xcconfig = { "ENABLE_BITCODE" => "NO" }


#公共Class
s.subspec 'Core' do |ce|
    ce.source_files = 'QVAIVideoEngineAI/Classes/Core/**/*'
    ce.public_header_files = 'QVAIVideoEngineAI/Classes/Core/Public/**/*.h'
    ce.private_header_files = 'QVAIVideoEngineAI/Classes/Core/Private/Include/*.h'
end
#公共.a
  s.subspec 'CommonLibs' do |sa|
      sa.vendored_libraries = 'QVAIVideoEngineAI/Libs/Common/*.a'
  end
#裁剪
  s.subspec 'Crop' do |crop|
      crop.dependency 'QVAIVideoEngineAI/Core'
      crop.dependency 'QVAIVideoEngineAI/CommonLibs'
      crop.source_files = 'QVAIVideoEngineAI/Classes/Crop/**/*'
      crop.public_header_files = 'QVAIVideoEngineAI/Classes/Crop/Public/**/*.h'
      crop.private_header_files = 'QVAIVideoEngineAI/Classes/Crop/Private/Include/*.h'

      crop.vendored_libraries = 'QVAIVideoEngineAI/Libs/Crop/*.a'
    
    crop.resource_bundles = {
      'Crop' => ['QVAIVideoEngineAI/Libs/Crop/Fdmodels/**/*.*']
    }
  end
#人体分割
  s.subspec 'SegmentAI' do |sgtAI|
      sgtAI.dependency 'QVAIVideoEngineAI/Core'
      sgtAI.dependency 'QVAIVideoEngineAI/CommonLibs'
      sgtAI.source_files = 'QVAIVideoEngineAI/Classes/SegmentAI/**/*'
      sgtAI.public_header_files = 'QVAIVideoEngineAI/Classes/SegmentAI/Public/**/*.h'
      sgtAI.private_header_files = 'QVAIVideoEngineAI/Classes/SegmentAI/Private/Include/*.h'
    
      sgtAI.vendored_libraries = 'QVAIVideoEngineAI/Libs/SegmentAI/*.a'
   
   sgtAI.resource_bundles = {
       'SegmentAI' => ['QVAIVideoEngineAI/Libs/SegmentAI/Fdmodels/**/*.*']
     }
  end

#人脸检测AI组库 FaceLandmark
  s.subspec 'FaceLandmark' do |facelk|
      facelk.dependency 'QVAIVideoEngineAI/Core'
      facelk.dependency 'QVAIVideoEngineAI/CommonLibs'
      facelk.source_files = 'QVAIVideoEngineAI/Libs/FaceLandmark/Classs/**/*'
      facelk.public_header_files = 'QVAIVideoEngineAI/Libs/FaceLandmark/Classs/public/*.h'
      facelk.private_header_files = 'QVAIVideoEngineAI/Libs/FaceLandmark/Classs/Include/*.h'
      facelk.vendored_libraries = 'QVAIVideoEngineAI/Libs/FaceLandmark/Libs/*.a'
  
      facelk.resource_bundles = {
        'FaceLandmark' => ['QVAIVideoEngineAI/Libs/FaceLandmark/Fdmodels/**/*.*']
      }
end

#人脸检测金矿的库 libdtdetector
  s.subspec 'Dtlibs' do |dtlibs|
      dtlibs.dependency 'QVAIVideoEngineAI/FaceLandmark'
      dtlibs.source_files = 'QVAIVideoEngineAI/Libs/Dtlibs/Classs/**/*'
      dtlibs.public_header_files = 'QVAIVideoEngineAI/Libs/Dtlibs/Classs/public/*.h'
      dtlibs.private_header_files = 'QVAIVideoEngineAI/Libs/Dtlibs/Classs/Include/*.h'
      dtlibs.vendored_libraries = 'QVAIVideoEngineAI/Libs/Dtlibs/Libs/*.a'
end

#转场点/卡点检测算法 XYAIMShotDet_v1.0.1
  s.subspec 'ShotDets' do |shotDets|
      shotDets.source_files = 'QVAIVideoEngineAI/Libs/ShotDet/Classs/**/*'
      shotDets.public_header_files = 'QVAIVideoEngineAI/Libs/ShotDet/Classs/public/*.h'
      shotDets.private_header_files = 'QVAIVideoEngineAI/Libs/ShotDet/Classs/Include/*.h'
      shotDets.vendored_libraries = 'QVAIVideoEngineAI/Libs/ShotDet/Libs/*.a'
end

#人脸性别检测
  s.subspec 'FaceAttribute' do |facelAb|
    facelAb.dependency 'QVAIVideoEngineAI/Core'
    facelAb.dependency 'QVAIVideoEngineAI/CommonLibs'
    facelAb.dependency 'QVAIVideoEngineAI/FaceLandmark'
    facelAb.source_files = 'QVAIVideoEngineAI/Libs/FaceAttribute/Classs/**/*'
    facelAb.public_header_files = 'QVAIVideoEngineAI/Libs/FaceAttribute/Classs/public/*.h'
    facelAb.private_header_files = 'QVAIVideoEngineAI/Libs/FaceAttribute/Classs/Include/*.h'
    facelAb.vendored_libraries = 'QVAIVideoEngineAI/Libs/FaceAttribute/Libs/*.a'
  
    facelAb.resource_bundles = {
        'FaceAttribute' => ['QVAIVideoEngineAI/Libs/FaceAttribute/Fdmodels/**/*.*']
      }
end

  # s.resource_bundles = {
  #   'QVAIVideoEngineAI' => ['QVAIVideoEngineAI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
