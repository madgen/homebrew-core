class Sourcery < Formula
  desc "Meta-programming for Swift, stop writing boilerplate code"
  homepage "https://github.com/krzysztofzablocki/Sourcery"
  url "https://github.com/krzysztofzablocki/Sourcery/archive/0.11.0.tar.gz"
  sha256 "6c4531482820ea809027548fc583bcbe7bb223d28cde814f63351d2ff44e7a5c"
  head "https://github.com/krzysztofzablocki/Sourcery.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "9c54661297a227495f5b9b6ac8cc837652804b4e00910e0069b92fe6568db7bb" => :high_sierra
    sha256 "55b7cc92519d4ac2a21fed3679de70a8c9f2e0f6b146e3dbb0e1fbfd369a62e9" => :sierra
  end

  depends_on :xcode => "6.0"
  depends_on :xcode => ["8.3", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc",
           "-static-stdlib"
    bin.install ".build/release/sourcery"
    lib.install Dir[".build/release/*.dylib"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sourcery --version").chomp
  end
end
