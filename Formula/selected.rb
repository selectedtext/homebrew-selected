class Selected < Formula
  desc "Get selected text using SelectedTextKit via cli"
  homepage "https://github.com/selectedtext/selectedtextcli"
  url "https://github.com/selectedtext/selectedtextcli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3bacadaf186483a9b7887b093a2416332a7723c11566d31827e7183589772a60"
  license "MIT"

  depends_on xcode: ["12.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/selected"
  end

  test do
    assert_match "USAGE: selected", shell_output("#{bin}/selected --help")
  end
end
