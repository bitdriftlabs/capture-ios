Pod::Spec.new do |s|
    s.name = 'BitdriftCapture'
    s.version = 'VERSION'
    s.authors = {
      'Bitdrift, Inc.' => 'info@bitdrift.io',
      'Rafal Augustyniak' => 'rafal@bitdrift.io',
      'Miguel Angel Juárez López' => 'miguel@bitdrift.io',
    }
    s.summary = "A dynamic observability SDK for mobile developers."
    s.homepage = 'https://bitdrift.io'
    s.documentation_url = 'https://docs.bitdrift.io'
    s.module_name = 'Capture'
    s.social_media_url = 'https://twitter.com/bitdriftio'
    s.license = {
      :type => "BITDRIFT SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT",
      :file => "LICENSE.txt"
    }
    s.platform = :ios, '13.0'
    s.swift_versions = ['5.7']
    s.frameworks = [
      'Network', 
      'UIKit', 
      'CoreTelephony'
    ]
    s.source = { http: "https://dl.bitdrift.io/sdk/ios/capture-0.9.113/Capture.zip" }
    s.vendored_frameworks = 'Capture.xcframework'
  end