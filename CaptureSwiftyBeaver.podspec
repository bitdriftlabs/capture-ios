
Pod::Spec.new do |s|
    s.name = 'CaptureSwiftyBeaver'
    s.version = '0.15.0'
    s.summary = "Official Capture integration for SwiftyBeaver."

    s.homepage = 'https://bitdrift.io'
    s.license = {
      :type => "BITDRIFT SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT",
      :file => "LICENSE.txt"
    }

    s.authors = {
      'Bitdrift, Inc.' => 'info@bitdrift.io',
      'Rafal Augustyniak' => 'rafal@bitdrift.io',
      'Miguel Angel Juárez López' => 'miguel@bitdrift.io',
    }

    s.source = {
        :git => 'https://github.com/bitdriftlabs/capture-ios.git',
        :tag => s.version.to_s
    }

    s.documentation_url = 'https://docs.bitdrift.io'
    s.social_media_url = 'https://twitter.com/bitdriftio'

    s.platform = :ios, '13.4'
    s.swift_versions = ['5.7']

    # Pod needs to be built as a static framework as it depends
    # on a static Capture framework (via BitdriftCapture pod)
    s.static_framework = true

    s.dependency 'BitdriftCapture', '= ' + s.version.to_s
    s.dependency 'SwiftyBeaver', '~> 2.1'

    s.source_files = ['Sources/CaptureSwiftyBeaver/**/*.swift']
    s.preserve_paths = ['NOTICE.txt']
  end
