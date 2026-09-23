cask "rubick" do
  arch arm: "aarch64", intel: "x64"

  version "4.19.1"
  sha256 arm:   "5c7b9fce842040a714c93dbe5b65facb6779066f04d39bbb7b89679211fb27af",
         intel: "41870a50e23b325dc2d3305e3761a647557ce7f90df7a48bf99ca93591fd3704"

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
