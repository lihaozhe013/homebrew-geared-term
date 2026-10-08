class GearedTerm < Formula
  desc "Conversation-first terminal with SSH, SFTP, and an AI assistant"
  homepage "https://github.com/lihaozhe013/geared-term"
  version "0.1.1-beta.47"
  url "https://github.com/lihaozhe013/geared-term/releases/download/nightly/geared-term-macos-arm64-0.1.1-beta.47.tar.gz"
  sha256 "184aa2757ca0133ee7f4ce8f730344c325bb0c3529bc080994b80ae811358d9e"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    libexec.install Dir["*"]
    (bin/"geared-term").write_env_script libexec/"bin/geared-term",
                                           GEARED_TERM_INSTALL_CHANNEL: "homebrew-formula"
  end

  def caveats
    <<~EOS
      Start Geared Term from a trusted terminal with:
        geared-term

      Upgrade with:
        brew upgrade --formula geared-term

      Close its window to leave it available from the Dock. After quitting or restarting macOS,
      run geared-term again. The configuration directory is preserved across upgrades.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/geared-term --version").strip
  end
end
