# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk-openj9" do
  version "16.0.1,9"
  sha256 "a13a3d7162dd3b24e55f147f0a33b39f50317cc40fbf977d1f21acd09e2b641b"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-16.0.1%2B9_openj9-0.26.0/OpenJDK16U-jdk_x64_mac_openj9_16.0.1_9_openj9-0.26.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 16 (OpenJ9)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK16U-jdk_x64_mac_openj9_16.0.1_9_openj9-0.26.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.16-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.16-openj9.jdk"
end
