require 'formula'

class SpringsourceToolSuite < Formula
  url 'http://download.springsource.com/release/STS/3.6.2/dist/e4.4/spring-tool-suite-3.6.2.RELEASE-e4.4.1-macosx-cocoa-x86_64.tar.gz'
  version '3.6.2'
  homepage 'http://spring.io/tools'
  sha1 '9d7273646311d1753d6fc570c778b6760cb977d4'

  def shim_script target
    <<-EOS.undent
      #!/bin/sh
      open #{prefix}/#{target} $*
    EOS
  end

  def install
    prefix.install Dir['sts-3.6.2.RELEASE/*']
    (bin+'sts').write shim_script('STS.app')
  end
end
