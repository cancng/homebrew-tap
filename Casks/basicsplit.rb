cask "basicsplit" do
  version "0.0.1"
  sha256 "4e80171df3016a8043a4dbbd4cd718483dbec1c32d6ce2c7ecfe0691545f2048"

  url "https://github.com/cancng/basicsplit/releases/download/v#{version}/basicsplit-#{version}.zip"
  name "basicsplit"
  desc "Per-app, per-domain WireGuard split tunnel"
  homepage "https://github.com/cancng/basicsplit"

  depends_on macos: :ventura

  app "basicsplit.app"

  # The app installs a root daemon on first launch; take it out again.
  uninstall launchctl: "basicsplit.engine",
            quit:      "dev.bomi.basicsplit",
            delete:    [
              "/Library/LaunchDaemons/basicsplit.engine.plist",
              "/Library/PrivilegedHelperTools/basicsplit-engine",
            ]

  zap trash: [
    "~/Library/Application Support/basicsplit",
    "~/Library/Logs/basicsplit.log",
  ]
end
