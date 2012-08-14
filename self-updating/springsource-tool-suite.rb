require 'formula'

class SpringsourceToolSuite < Formula
  url 'http://download.springsource.com/release/STS/3.0.0/dist/e4.2/spring-tool-suite-3.0.0.RELEASE-e4.2-macosx-cocoa-x86_64.tar.gz'
  version '3.0.0'
  homepage 'http://www.springsource.com/developer/sts'
  md5 'b51d4659b8ddf6eb1f64d29c1126b37a'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      open #{prefix}/#{target} $*
    EOS
  end

  def install
    prefix.install Dir['sts-3.0.0.RELEASE/*']
    (bin+'sts').write shim_script('STS.app')
  end
end
