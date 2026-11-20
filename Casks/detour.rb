cask "detour" do
  version "0.5.0"
  sha256 "ab9eaafffebf18263efe3910bee1eaeb4d4d6821f8756ef45f02bd8b145878bc"

  url "https://github.com/INotSleep/Detour/releases/download/v#{version}/Detour_#{version}_universal.dmg"
  name "Detour"
  desc "SSH client with end-to-end encrypted sync and teams"
  homepage "https://detourssh.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Detour.app"
  binary "#{appdir}/Detour.app/Contents/MacOS/detour"

  # The vault (~/Library/Application Support/dev.detour.Detour) is left alone: it holds keys and passwords.
  zap trash: [
    "~/Library/Caches/dev.detour.app",
    "~/Library/Saved Application State/dev.detour.app.savedState",
    "~/Library/WebKit/dev.detour.app",
  ]
end
