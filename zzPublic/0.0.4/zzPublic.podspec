
Pod::Spec.new do |s|
s.name             = "zzPublic"
s.version          = "0.0.4"
s.summary          = "zzPublic."
s.homepage         = "https://github.com/Oxidosnel/zzPublic"
s.license          = 'MIT'
s.author           = { "zxz" => "sanzrew@qq.com" }
s.source           = { :git => "https://github.com/Oxidosnel/zzPublic.git", :tag => s.version }

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'zzPublic/*.{h,m}'
# s.resources = 'Pod/Assets/*'

s.frameworks = 'UIKit', 'CoreText'
# s.module_name = 'Artsy_UIFonts'
end
