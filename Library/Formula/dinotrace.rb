require "formula"

class Dinotrace < Formula
  homepage "http://www.veripool.org/wiki/dinotrace"
  url "http://www.veripool.org/ftp/dinotrace-9.4c.tgz"
  sha1 "f7c2dd5c33119e267512a7534dc0633aa9cbc3bb"

  depends_on :x11
  depends_on 'lesstif'

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test dinotrace`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
