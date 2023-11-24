# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk15-jre" do
  version "15.0.2,7"
  sha256 "10585f453ca6776b6e45a271c845c892dca3f9b20041df290c45b622c89e5401"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-15.0.2%2B7/OpenJDK15U-jre_x64_mac_hotspot_15.0.2_7.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jre_x64_mac_hotspot_15.0.2_7.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15.jre"
end
