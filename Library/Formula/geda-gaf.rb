require 'formula'

class GedaGaf < Formula
  homepage 'http://www.geda-project.org/'
  url 'http://ftp.geda-project.org/geda-gaf/stable/v1.8/1.8.2/geda-gaf-1.8.2.tar.gz'
  sha1 'c61edc04997fc12398534a346dac32d8fcdabcc1'
  sha256 'bbf4773aef1b5a51a8d6f4c3fa288c047340cc62dd6e14d7928fcc6e4051b721'

  devel do
    url 'http://ftp.geda-project.org/geda-gaf/unstable/v1.9/1.9.0/geda-gaf-1.9.0.tar.gz'
    sha1 '2b6732238ca5ed6693695d737e52aef1bdb2a589'
    sha256 '6db54587f4ff1798c486d71645abeba5906c582182a07ce1895538e89ef726c6'
  end

  head 'git://git.geda-project.org/geda-gaf'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'guile'
  depends_on 'gawk'
  depends_on :x11
  depends_on 'libstroke' => :optional

  def install
    # Help configure find libraries
    gettext = Formula.factory('gettext')
    pcb = Formula.factory('pcb')

    extra_configure_args = []
    if !build.devel?
      extra_configure_args << "--with-pcb-confdir=#{pcb.etc/:pcb}"
    end
    system "./configure", "--prefix=#{prefix}",
                          "--with-gettext=#{gettext.prefix}",
                          "--disable-update-xdg-database",
                          "--with-pcb-datadir=#{HOMEBREW_PREFIX/:share/:pcb}",
                          *extra_configure_args

    system "make"
    system "make install"
  end

  def caveats
    "This software runs under X11."
  end
end

