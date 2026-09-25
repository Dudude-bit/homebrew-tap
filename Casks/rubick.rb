cask "rubick" do
  arch arm: "aarch64", intel: "x64"

  version "4.20.1"
  sha256 arm:   "4099eb422781cd9629be8e4aaf65153e6a2dfabc2e4eb4733d222ca31e747fb1",
         intel: "9ce3dc1621821af48e6aed0dd78bc90030639eb4d0fc5c61380607aef986af07"

  url "https://github.com/Dudude-bit/rubick/releases/download/v#{version}/Rubick_#{version}_#{arch}.dmg",
      verified: "github.com/Dudude-bit/rubick/"

  name "Rubick"
  desc "Kubernetes GUI client"
  homepage "https://github.com/Dudude-bit/rubick"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself through Tauri's updater, so Homebrew should not
  # race it: `brew upgrade` still works, and `auto_updates` keeps `greedy`
  # runs from reinstalling what the app already replaced.
  auto_updates true

  # No `depends_on macos:`. The app's floor is 10.13, which is below the
  # oldest release Homebrew itself runs on, so the constraint could only ever
  # be vacuous — and the symbol for it has been removed.

  app "Rubick.app"

  # `k8s-gui` rather than the bundle identifier: the config path is written
  # literally in src-tauri/src/config/mod.rs, and the identifier was left
  # alone when the product was renamed.
  zap trash: [
    "~/Library/Application Support/k8s-gui",
    "~/Library/Caches/com.k8s-gui.app",
    "~/Library/Preferences/com.k8s-gui.app.plist",
    "~/Library/Saved Application State/com.k8s-gui.app.savedState",
    "~/Library/WebKit/com.k8s-gui.app",
  ]
end
