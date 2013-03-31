require 'formula'

class SpringsourceToolSuite < Formula
  url 'http://download.springsource.com/release/STS/3.2.0/dist/e4.2/spring-tool-suite-3.2.0.RELEASE-e4.2.2-macosx-cocoa-x86_64.tar.gz'
  version '3.2.0'
  homepage 'http://www.springsource.com/sts'
  sha1 'c57d1a193636ddc8f02fd8a9c6cbac9cc43b1d6f'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      open #{prefix}/#{target} $*
    EOS
  end

  def install
    prefix.install Dir['sts-3.2.0.RELEASE/*']
    (bin+'sts').write shim_script('STS.app')
  end
end
