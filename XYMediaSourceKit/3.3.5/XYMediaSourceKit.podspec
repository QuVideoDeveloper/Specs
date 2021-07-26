Pod::Spec.new do |s|
  s.name      = 'XYMediaSourceKit'
  s.version   = '3.3.5'
  s.summary   = '归因服务组件'
  s.homepage  = 'https://github.com/QuVideoDeveloper/XYMediaSourceKit'
  s.license   = { :type => 'MIT', :file => 'LICENSE' }
  s.author    = { 'gitsource' => 'gitsource@quvideo.com' }
  s.source    = { :git => 'git@github.com:QuVideoDeveloper/XYMediaSourceKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  # 默认为分享归因子pod
  s.default_subspec = 'WebShareTrackKit'

  # 核心子pod
  s.subspec 'Core' do |core|
    core.source_files = 'XYMediaSourceKit/Classes/Core/**/*'
  end

  # 自归因平台（目前主要是抖音、快手）
  s.subspec 'MineTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/WebShareTrackKit'
    ss.source_files = 'XYMediaSourceKit/Classes/MineTrackKit/**/*'
  end

  # UAC归因平台
  s.subspec 'UACTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/WebShareTrackKit'
    ss.source_files = 'XYMediaSourceKit/Classes/UACTrackKit/**/*'
    #s.dependency 'XYCommonAPIManager/Report'
  end

  # Apple Store归因平台
  s.subspec 'ASTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/WebShareTrackKit'
    ss.source_files = 'XYMediaSourceKit/Classes/ASTrackKit/**/*'
    ss.frameworks = 'iAd'
  end

  # Facebook归因平台
  s.subspec 'FBTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/WebShareTrackKit'
    ss.source_files = 'XYMediaSourceKit/Classes/FBTrackKit/**/*'
    ss.dependency 'FBSDKCoreKit', '>=9.3.0'
  end

  # 分享归因(默认带有,因为设备注册之后必须要有一次sourceReport)
  s.subspec 'WebShareTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/Core'
    ss.source_files = 'XYMediaSourceKit/Classes/WebShareTrackKit/**/*'
  end

  # TikTok归因平台
  s.subspec 'TikTokTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/WebShareTrackKit'
    ss.source_files = 'XYMediaSourceKit/Classes/TikTokTrackKit/**/*'
    ss.dependency 'XYAppsFlyerKit', '>=6.2.5'
  end

  # AppsFlyerPush归因平台
  s.subspec 'AFPushTrackKit' do |ss|
    ss.dependency 'XYMediaSourceKit/WebShareTrackKit'
    ss.source_files = 'XYMediaSourceKit/Classes/AFPushTrackKit/**/*'
    ss.dependency 'XYAppsFlyerKit', '>=6.2.5'
  end

  # 换量
  s.subspec 'OneLink' do |ss|
    ss.dependency 'XYMediaSourceKit/Core'
    ss.dependency 'XYOpenUDID'
    ss.dependency 'XYMediEventAdapter'
    ss.source_files = 'XYMediaSourceKit/Classes/OneLink/**/*'
  end

  # 短链
  s.subspec 'ShortURLLInk' do |ss|
    ss.dependency 'XYMediaSourceKit/Core'
    ss.source_files = 'XYMediaSourceKit/Classes/ShortURLLInk/**/*'
    ss.dependency 'XYShortURLLink'
  end

  s.dependency 'XYCategory'
  s.dependency 'AFNetworking'
  s.dependency 'YYModel'
  s.dependency 'XYAPIAdapter'

  
end
