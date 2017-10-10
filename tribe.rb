class Tribe < Formula
  desc "Helps you answer why the @$*% that code exists."
  homepage "https://www.heysquirrel.co/tribe"
  url "https://github.com/HeySquirrel/tribe/archive/0.2.tar.gz"
  sha256 "7c43c14fc4f5202182f0a40d0212718a94abcc8a3226573322731c0470f55455"
  head "https://github.com/HeySquirrel/tribe.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/HeySquirrel/tribe"
    dir.install buildpath.children
    cd dir do
      system "go", "build", "-o", bin/"tribe", "main.go"
      prefix.install_metafiles
    end
  end

  test do
    lines = `#{bin}/tribe --help`.strip.split("\n")
    assert_equal lines.last, "Use \"tribe [command] --help\" for more information about a command."
  end
end
