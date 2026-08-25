cask "tmog" do
  version "0.1.1,20260821200548"
  sha256 "11f7e6a5d44a1590e0a9fcaa20b0936e7b0f6c029e14f7a888f0b3a7a5c88fe0"

  url "https://tmog.org/downloads/TMOG-Task-Manager-#{version.csv.first}-#{version.csv.second}-macOS-universal.dmg"
  name "Task Manager OG"
  desc "Systems console from the original Windows Task Manager developer"
  homepage "https://tmog.org/"

  livecheck do
    url "https://tmog.org/downloads/release.json"
    strategy :json do |json|
      next if json["version"].blank? || json["build"].blank?

      "#{json["version"]},#{json["build"]}"
    end
  end

  app "Task Manager TMOG.app"

  uninstall quit: "com.tmog.taskmanager"

  zap trash: [
    "~/Library/Application Support/TMOG",
    "~/Library/Preferences/com.tmog.taskmanager.plist",
    "~/Library/Saved Application State/com.tmog.taskmanager.savedState",
  ]
end
