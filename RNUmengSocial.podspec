
Pod::Spec.new do |s|
  s.name         = "RNUmengSocial"
  s.version      = "1.0.0"
  s.summary      = "RNUmengSocial"
  s.description  = <<-DESC
                  RNUmengSocial
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNUmengSocial.git", :tag => "master" }
  s.source_files  = "RNUmengSocial/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"
  pod 'UMCCommon'
  pod 'UMCSecurityPlugins'
  pod 'UMCCommonLog'
      # U-Share SDK UI模块（分享面板，建议添加）
      pod 'UMCShare/UI'
      # 集成微信(完整版14.4M)
      pod 'UMCShare/Social/WeChat'

      # 集成邮件
      pod 'UMCShare/Social/Email'

      # 集成短信
      pod 'UMCShare/Social/SMS'

end

