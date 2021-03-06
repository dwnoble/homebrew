require 'formula'

class MzScheme < Formula
  url 'http://download.plt-scheme.org/bundles/4.2.5/mz/mz-4.2.5-src-unix.tgz'
  homepage 'http://plt-scheme.org/'
  md5 '5d320c94e168ab58237c0e710c6050d0'
  version '4.2.5'

  fails_with_llvm "Unsupported inline asm", :build => 2335

  def install
    cd "src"

    args = ["--disable-debug", "--disable-dependency-tracking",
            "--disable-pthread", "--disable-mred", "--enable-xonx",
            "--prefix=#{prefix}"]
    args << "--enable-mac64" if MacOS.prefer_64_bit?

    system "./configure", *args
    system "make"
    system "make install"
  end
end
