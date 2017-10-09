class Tribe < Formula
  desc "Helps you answer why the @$*% that code exists."
  homepage "https://www.heysquirrel.co/tribe"
  url "https://github.com/HeySquirrel/tribe/archive/0.0.1.tar.gz"
  sha256 "b0ab2e73e51a53700c69ade0809ad968676d12e7f0734cfb14e81d2c706b29d7"
  head "https://github.com/HeySquirrel/tribe.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/HeySquirrel/tribe"
    dir.install buildpath.children
    cd dir do
      system "ls"
      system "go", "build", "-o", bin/"tribe", ".../main.go"
      prefix.install_metafiles
    end
  end

  test do
    lines = `#{bin}/tribe --help`.strip.split("\n")
    assert_equal lines.last, "Use \"tribe [command] --help\" for more information about a command."
  end
end
