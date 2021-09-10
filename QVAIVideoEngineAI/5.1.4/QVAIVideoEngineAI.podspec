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
  s.version          = "5.1.4"
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

  s.ios.deployment_target = '9.0'

  
  s.xcconfig = { "ENABLE_BITCODE" => "NO" }

  s.weak_frameworks = 'CoreML'
  s.libraries =  'c++'
  s.dependency 'XYApiServiceRouter'

#公共Class
s.subspec 'Core' do |ce|
    ce.source_files = 'QVAIVideoEngineAI/Classes/Core/**/*'
    ce.public_header_files = 'QVAIVideoEngineAI/Classes/Core/Public/**/*.h'
    ce.private_header_files = 'QVAIVideoEngineAI/Classes/Core/Private/Include/*.*'
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
#分割代码 core
  s.subspec 'SegmentAI' do |sgtAI|
      sgtAI.dependency 'QVAIVideoEngineAI/Core'
      sgtAI.dependency 'QVAIVideoEngineAI/CommonLibs'
      sgtAI.source_files = 'QVAIVideoEngineAI/Classes/SegmentAI/**/*'
      sgtAI.public_header_files = 'QVAIVideoEngineAI/Classes/SegmentAI/Public/**/*.h'
      sgtAI.private_header_files = 'QVAIVideoEngineAI/Classes/SegmentAI/Private/Include/*.h'
    
      sgtAI.vendored_libraries = 'QVAIVideoEngineAI/Libs/SegmentAI/*.a'
  end

#人体分割
  s.subspec 'PortraitSeg' do |portrait|
    portrait.dependency 'QVAIVideoEngineAI/SegmentAI'
    portrait.resource_bundles = {
       'PortraitSeg' => ['QVAIVideoEngineAI/Libs/SegmentAI/PortraitSeg/**/*.*']
     }
  end

#衣服分割
  s.subspec 'ClothSeg' do |cloth|
    cloth.dependency 'QVAIVideoEngineAI/SegmentAI'
    cloth.resource_bundles = {
       'ClothSeg' => ['QVAIVideoEngineAI/Libs/SegmentAI/ClothSegM/**/*.*']
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


#人脸信息检测
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

#人头分割
  s.subspec 'HeadSeg' do |head|
    head.dependency 'QVAIVideoEngineAI/Core'
    head.dependency 'QVAIVideoEngineAI/CommonLibs'
    head.dependency 'QVAIVideoEngineAI/SegmentAI'
    head.dependency 'QVAIVideoEngineAI/FaceLandmark'
    head.source_files = 'QVAIVideoEngineAI/Libs/HeadSeg/Classs/**/*'
    head.public_header_files = 'QVAIVideoEngineAI/Libs/HeadSeg/Classs/public/*.h'
    head.private_header_files = 'QVAIVideoEngineAI/Libs/HeadSeg/Classs/Include/*.h'
    head.vendored_libraries = 'QVAIVideoEngineAI/Libs/HeadSeg/Libs/*.a'

  head.resource_bundles = {
        'HeadSeg' => ['QVAIVideoEngineAI/Libs/HeadSeg/Models/**/*.*']
      }
end


#人体骨骼
  s.subspec 'HumanPose' do |humanP|
      humanP.dependency 'QVAIVideoEngineAI/Core'
      humanP.dependency 'QVAIVideoEngineAI/CommonLibs'
      humanP.dependency 'QVAIVideoEngineAI/Crop'
      humanP.source_files = 'QVAIVideoEngineAI/Libs/HumanPose/Classs/**/*'
      humanP.public_header_files = 'QVAIVideoEngineAI/Libs/HumanPose/Classs/public/*.h'
      humanP.private_header_files = 'QVAIVideoEngineAI/Libs/HumanPose/Classs/Include/*.h'
      humanP.vendored_libraries = 'QVAIVideoEngineAI/Libs/HumanPose/Libs/*.a'
  
  humanP.resource_bundles = {
        'HumanPose' => ['QVAIVideoEngineAI/Libs/HumanPose/Models/**/*.*']
      }
end

#人脸渐变
  s.subspec 'Facemorphing' do |faceM|
    faceM.dependency 'QVAIVideoEngineAI/Core'
    faceM.dependency 'QVAIVideoEngineAI/CommonLibs'
    faceM.dependency 'QVAIVideoEngineAI/FaceLandmark'
    faceM.source_files = 'QVAIVideoEngineAI/Libs/Facemorphing/Classs/**/*'
    faceM.public_header_files = 'QVAIVideoEngineAI/Libs/Facemorphing/Classs/public/*.h'
    faceM.private_header_files = 'QVAIVideoEngineAI/Libs/Facemorphing/Classs/Include/*.h'
    faceM.vendored_libraries = 'QVAIVideoEngineAI/Libs/Facemorphing/Libs/*.a'
  
    faceM.resource_bundles = {
        'HumanPose' => ['QVAIVideoEngineAI/Libs/Facemorphing/Models/**/*.*']
      }
end

#图片分类
  s.subspec 'ImageCls' do |imageC|
    imageC.dependency 'QVAIVideoEngineAI/Core'
    imageC.dependency 'QVAIVideoEngineAI/CommonLibs'
    imageC.source_files = 'QVAIVideoEngineAI/Libs/ImageCls/Classs/**/*'
    imageC.public_header_files = 'QVAIVideoEngineAI/Libs/ImageCls/Classs/public/*.h'
    imageC.private_header_files = 'QVAIVideoEngineAI/Libs/ImageCls/Classs/Include/*.h'
    imageC.vendored_libraries = 'QVAIVideoEngineAI/Libs/ImageCls/Libs/*.a'
  
  imageC.resource_bundles = {
        'ImageCls' => ['QVAIVideoEngineAI/Libs/ImageCls/Models/**/*.*']
      }
end


#BeatDetection 节拍检查
s.subspec 'BeatDetection' do |beatDet|
  beatDet.frameworks = 'Accelerate'
  beatDet.dependency 'QVAIVideoEngineAI/Core'
  beatDet.dependency 'QVAIVideoEngineAI/CommonLibs'
  beatDet.source_files = 'QVAIVideoEngineAI/Libs/BeatDetection/Classs/**/*'
  beatDet.public_header_files = 'QVAIVideoEngineAI/Libs/BeatDetection/Classs/public/*.h'
  beatDet.private_header_files = 'QVAIVideoEngineAI/Libs/BeatDetection/Classs/Include/*.h'
  beatDet.vendored_libraries = 'QVAIVideoEngineAI/Libs/BeatDetection/Libs/*.a'

  beatDet.resource_bundles = {
    'BeatDetection' => ['QVAIVideoEngineAI/Libs/BeatDetection/Models/**/*.*']
  }
end

#目标跟踪算法
s.subspec 'SingleTrack' do |sTrack|
  sTrack.dependency 'QVAIVideoEngineAI/Core'
  sTrack.dependency 'QVAIVideoEngineAI/CommonLibs'
  sTrack.source_files = 'QVAIVideoEngineAI/Libs/SingleTrack/Classs/**/*'
  sTrack.public_header_files = 'QVAIVideoEngineAI/Libs/SingleTrack/Classs/public/*.h'
  sTrack.private_header_files = 'QVAIVideoEngineAI/Libs/SingleTrack/Classs/Include/*.h'
  sTrack.vendored_libraries = 'QVAIVideoEngineAI/Libs/SingleTrack/Libs/*.a'
  
  sTrack.resource_bundles = {
    'SingleTrack' => ['QVAIVideoEngineAI/Libs/SingleTrack/Models/**/*.*']
  }
end

#视频裁剪
s.subspec 'VideoCrop' do |vCrop|
  vCrop.dependency 'QVAIVideoEngineAI/Core'
  vCrop.dependency 'QVAIVideoEngineAI/CommonLibs'
  vCrop.dependency 'QVAIVideoEngineAI/ShotDets'
  vCrop.dependency 'QVAIVideoEngineAI/SingleTrack'
  vCrop.dependency 'QVAIVideoEngineAI/Crop'
  vCrop.source_files = 'QVAIVideoEngineAI/Libs/VideoCrop/Classs/**/*'
  vCrop.public_header_files = 'QVAIVideoEngineAI/Libs/VideoCrop/Classs/public/*.h'
  vCrop.private_header_files = 'QVAIVideoEngineAI/Libs/VideoCrop/Classs/Include/*.h'
  vCrop.vendored_libraries = 'QVAIVideoEngineAI/Libs/VideoCrop/Libs/*.a'
end

##迪士尼卡通特效 弃用
#s.subspec 'Cartoon' do |ctoon|
#  ctoon.dependency 'QVAIVideoEngineAI/Core'
#  ctoon.dependency 'QVAIVideoEngineAI/CommonLibs'
#  ctoon.dependency 'QVAIVideoEngineAI/PortraitSeg'
#  ctoon.dependency 'QVAIVideoEngineAI/FaceLandmark'
#  ctoon.source_files = 'QVAIVideoEngineAI/Libs/Cartoon/Classs/**/*'
#  ctoon.public_header_files = 'QVAIVideoEngineAI/Libs/Cartoon/Classs/public/*.h'
#  ctoon.private_header_files = 'QVAIVideoEngineAI/Libs/Cartoon/Classs/Include/*.h'
#  ctoon.vendored_libraries = 'QVAIVideoEngineAI/Libs/Cartoon/Libs/*.a'
#
#  ctoon.resource_bundles = {
#    'Cartoon' => ['QVAIVideoEngineAI/Libs/Cartoon/Models/**/*.*']
#  }
#end

##AR
#  s.subspec 'AR' do |ar|
#    ar.source_files = 'QVAIVideoEngineAI/Libs/AR/Classs/**/*'
#    ar.public_header_files = 'QVAIVideoEngineAI/Libs/AR/Classs/public/*.h'
#    ar.private_header_files = 'QVAIVideoEngineAI/Libs/AR/Classs/Include/*.h'
#    ar.vendored_libraries = 'QVAIVideoEngineAI/Libs/AR/Libs/*.a'
#end

  # s.resource_bundles = {
  #   'QVAIVideoEngineAI' => ['QVAIVideoEngineAI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
