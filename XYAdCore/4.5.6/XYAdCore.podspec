Pod::Spec.new do |s|
  s.name             = 'XYAdCore'
  s.version          = '4.5.6'
  s.summary          = 'XiaoYing - XYAdCore.'
  s.homepage         = 'https://github.com/QuVideoDeveloper/XYAdCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SandsLee' => 'shuzhi.li@quvideo.com' }
  s.source           = { :git => 'git@github.com:QuVideoDeveloper/XYAdCore.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  # 默认子pod
  s.default_subspec = 'AdCore'

  # 核心pod
  s.subspec 'AdCore' do |core|
    core.source_files = 'XYAdCore/Classes/*',
                'XYAdCore/Classes/Define/*',
                'XYAdCore/Classes/Default/*',
                'XYAdCore/Classes/AdCore/**/*',
                'XYAdCore/Classes/Common/*',
                'XYAdCore/Classes/Model/*',
                'XYAdCore/Classes/Tool/*',
                'XYAdCore/Classes/AdBase/**/*'
    core.resource_bundles = {
      'XYAdCore' => ['XYAdCore/Assets/*.*','XYAdCore/Recourse/*.xcassets', 'XYAdCore/Recourse/**/*.*']
    }
  end

  # Admob 广告
  s.subspec 'Admob' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/Admob/**/*'
    ss.dependency 'Google-Mobile-Ads-SDK', '9.7.0'
#    ss.dependency 'GoogleMobileAdsMediationTestSuite'
  end
  # Admob中介Facebook
  s.subspec 'AdmobFB' do |ss|
    ss.dependency 'XYAdCore/Admob'
    ss.dependency 'GoogleMobileAdsMediationFacebook'
  end
  # Admob中介AdColony
  s.subspec 'AdmobAdC' do |ss|
    ss.dependency 'XYAdCore/Admob'
    ss.dependency 'GoogleMobileAdsMediationAdColony'
  end
  # Admob中介Vungle
  s.subspec 'AdmobVun' do |ss|
    ss.dependency 'XYAdCore/Admob'
    ss.dependency 'GoogleMobileAdsMediationVungle'
  end
  # Admob中介AppLovin
  s.subspec 'AdmobLovin' do |ss|
    ss.dependency 'XYAdCore/Admob'
    ss.dependency 'GoogleMobileAdsMediationAppLovin'
  end
  
  # AppLovin 广告
  s.subspec 'AppLovin' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/AppLovin/**/*'
    ss.dependency 'AppLovinSDK', '11.4.2'
  end
  # AppLovin中介Mintegral
  s.subspec 'AppLovinMTG' do |ss|
    ss.dependency 'XYAdCore/AppLovin'
    ss.dependency 'AppLovinMediationMintegralAdapter'
  end
  # AppLovin中介Vungle
  s.subspec 'AppLovinVun' do |ss|
    ss.dependency 'XYAdCore/AppLovin'
    ss.dependency 'AppLovinMediationVungleAdapter'
  end
  # AppLovin中介Pangle
  s.subspec 'AppLovinPan' do |ss|
    ss.dependency 'XYAdCore/AppLovin'
    ss.dependency 'AppLovinMediationByteDanceAdapter'
  end

  # Facebook 广告
  s.subspec 'Facebook' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/Facebook/**/*'
    ss.dependency 'FBAudienceNetwork', '~> 6.9.0'
  end

  # Mobvista 广告
  s.subspec 'Mobv' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/Mobv/**/*'
    ss.dependency 'MintegralAdSDK/NativeAd',            '~> 7.1.7.0'
    ss.dependency 'MintegralAdSDK/InterstitialVideoAd', '~> 7.1.7.0'
    ss.dependency 'MintegralAdSDK/RewardVideoAd',       '~> 7.1.7.0'
    ss.dependency 'MintegralAdSDK/InterstitialAd',      '~> 7.1.7.0'
    ss.dependency 'MintegralAdSDK/BannerAd',            '~> 7.1.7.0'
    ss.dependency 'MintegralAdSDK/SplashAd',            '~> 7.1.7.0'
    ss.dependency 'MintegralAdSDK/NativeAdvancedAd',    '~> 7.1.7.0'
  end

  # Vungle 广告
  s.subspec 'Vungle' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/Vungle/**/*'
    ss.dependency 'VungleSDK-iOS', '6.10.6'
  end

  # MoPub 广告
  s.subspec 'MoPub' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/MoPub/**/*'
    ss.dependency 'mopub-ios-sdk', '5.18.2'
  end

  # AdColony 广告
  s.subspec 'AdColony' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/AdColony/**/*'
    ss.dependency 'AdColony', '4.8.0'
  end

  # Applins 广告
  s.subspec 'ALS' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/ALS/**/*'
    ss.dependency 'ApplinsSDK', '4.4.1'
  end

  # BUAd 百度穿山甲广告
  s.subspec 'WM' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/WM/**/*'
    ss.vendored_frameworks = 'XYAdCore/PrivateSDK/BUAdSDK.framework'
    ss.resources = ['XYAdCore/PrivateSDK/BUAdSDK.bundle']
  end

  # JR 无感广告
  s.subspec 'JR' do |ss|
    ss.dependency 'XYAdCore/AdCore'
    ss.source_files = 'XYAdCore/Classes/JR/**/*'
    ss.vendored_frameworks = 'XYAdCore/PrivateSDK/JRAnalysisKit.framework'
    ss.frameworks = 'AdSupport', 'CoreTelephony'
  end

  s.prefix_header_contents = <<-EOS
      #import "XYAdCorePrivateHeader.h"
  EOS

  #第三方组件
  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'YYModel'
  s.dependency 'SDWebImage'

  #系统组件
  s.library = "resolv"

  #公共组件
  s.dependency 'XYCategory'

end
