class Pick < Formula
  desc "Utility to choose one option from a set of choices"
  homepage "https://github.com/calleerlandsson/pick"
  url "https://github.com/calleerlandsson/pick/releases/download/v1.5.3/pick-1.5.3.tar.gz"
  sha256 "925f5736cdc44455305678030b190e7ee359bd710af4cfaf0388d6d27e21bc93"

  bottle do
    cellar :any_skip_relocation
    sha256 "1506894b189eab7af6986b79615df5389b42d117150e65670e95019ce88d13ac" => :sierra
    sha256 "5769c0848be846f86d21bf96dfcd028f500cc65ae32aee15e7a8a15a21db9648" => :el_capitan
    sha256 "834a181d5579e308ecbc09aadf9104ca631ee66c82177cb42b383ce75e375f94" => :yosemite
  end

  def install
    ENV["TERM"] = "xterm"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "#{bin}/pick", "-v"
  end
end
