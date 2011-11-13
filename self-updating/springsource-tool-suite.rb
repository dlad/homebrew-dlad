require 'formula'

class SpringsourceToolSuite < Formula
  url 'http://download.springsource.com/release/STS/2.7.0/dist/e3.7/springsource-tool-suite-2.7.0.RELEASE-e3.7-macosx-cocoa-x86_64.tar.gz'
  version '2.7.0'
  homepage 'http://www.springsource.com/developer/sts'
  md5 'b9a3c8cc4069fb6362d80b2298631386'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      open #{prefix}/#{target} $*
    EOS
  end

  def install
    prefix.install Dir['sts-2.7.0.RELEASE/*']
    (bin+'sts').write shim_script('STS.app')
  end
end
