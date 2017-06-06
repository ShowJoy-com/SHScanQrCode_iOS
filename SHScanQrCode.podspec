
Pod::Spec.new do |s|
    s.name         = "SHScanQrCode"
    s.version      = "0.0.2"
    s.summary      = "SHScanQrCode"
    s.description  = "SHScanQrCode ShowJoy"
    s.homepage     = "https://github.com/ShowJoy-com/SHScanQrCode_iOS.git"
    s.license      = "MIT"
    s.author       = { "果冻" => "guodong@showjoy.com" }
    s.source       = { :git => "https://github.com/ShowJoy-com/SHScanQrCode_iOS.git", :tag => "#{s.version}"}
    s.source_files  = "SHScanQrCode/SHScanQrCode/**/*.{h,m}"
    s.requires_arc = true
    s.ios.deployment_target = '7.0'
end
