require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNUmengSocial"
  s.version      = "1.0.0"
  s.summary      = "RNUmengSocial"
  s.description  = <<-DESC
                  RNUmengSocial
                   DESC
  s.homepage     = "https://github.com/1123746696/react-native-umengsocial.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNUmengSocial.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"
  s.dependency 'UMCCommon'
  s.dependency 'UMCSecurityPlugins'
  s.dependency 'UMCCommonLog'
  # U-Share SDK UI模块（分享面板，建议添加）
  s.dependency 'UMCShare/UI'
  # 集成微信(完整版14.4M)
  s.dependency 'UMCShare/Social/WeChat'

  # 集成邮件
  s.dependency 'UMCShare/Social/Email'
  # 集成短信
  s.dependency 'UMCShare/Social/SMS'

end

