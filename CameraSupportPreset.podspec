Pod::Spec.new do |s|

  s.name         = "CameraSupportPreset"
  s.version      = "1.0.0"
  s.summary      = "A simple camera verify"

  s.homepage     = "https://github.com/beijinanji90/CameraSupportPreset"
  s.license         = { type: 'MIT', file: 'LICENSE' }

  s.author       = { "summer-liu" => "344963245@qq.com" }

  s.platform     = :ios, "9.0"
  s.source = { :git => 'https://github.com/beijinanji90/CameraSupportPreset.git',:tag => s.version.to_s }
  s.source_files  = "CameraSupportPreset/ViewController.{h,m}"
  s.requires_arc = true


end
