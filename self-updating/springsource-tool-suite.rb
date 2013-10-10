require 'formula'

class SpringsourceToolSuite < Formula
  url 'http://download.springsource.com/release/STS/3.4.0/dist/e4.3/spring-tool-suite-3.4.0.RELEASE-e4.3.1-macosx-cocoa-x86_64.tar.gz'
  version '3.4.0'
  homepage 'http://spring.io/tools'
  sha1 '2c62fc661c4978be91a524c02469b8e67754e610'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      open #{prefix}/#{target} $*
    EOS
  end

  def install
    prefix.install Dir['sts-3.4.0.RELEASE/*']
    (bin+'sts').write shim_script('STS.app')
  end
end
