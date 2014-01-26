require "formula"

class Libstroke < Formula
  homepage "http://etla.net/libstroke/"
  url "http://etla.net/libstroke/libstroke-0.5.1.tar.gz"
  sha1 "48bd2b98faa8681ccd97eda7a09442845dbf1b7b"

  depends_on :x11
  depends_on 'gtk+' => :recommended

  def install
    system "./configure", "--host=i686",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-shared",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
