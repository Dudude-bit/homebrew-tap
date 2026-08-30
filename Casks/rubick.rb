cask "rubick" do
  arch arm: "aarch64", intel: "x64"

  version "4.7.1"
  sha256 arm:   "300e4b8fca9fd57599f6f1182d08629618b34335601a459bea3555c1ac81a782",
         intel: "16a23b959c9f1846b29c7a7b4441b3b82bdd96ecb5fcd427baa8267b771052cf"

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
