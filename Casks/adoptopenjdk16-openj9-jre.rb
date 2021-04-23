# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk16-openj9-jre" do
  version "16.0.1,9"
  sha256 "320fde1b7acd2f13b2d7d55adb1e5c5bddb105f7ee3a35226d05a62e5f36a8f8"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-16.0.1%2B9_openj9-0.26.0/OpenJDK16U-jre_x64_mac_openj9_16.0.1_9_openj9-0.26.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 16 (OpenJ9) (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK16U-jre_x64_mac_openj9_16.0.1_9_openj9-0.26.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.16-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.16-openj9.jre"
end
