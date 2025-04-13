cask "jeffern-movie" do
  version "1.3.7"
  sha256 "d28e24612bd74c37c0d5fb5b77d82b14bc682e0d9da4b748d86208b0747a9111"

  url "https://github.com/jeffernn/LibreTV-MoonTV-Mac-Objective-C/releases/download/v#{version}/JeffernMovie.app.zip"
  name "JeffernMovie"
  desc "Jeffern免费观影平台"
  homepage "https://github.com/jeffernn/LibreTV-MoonTV-Mac-Objective-C"

  app "JeffernMovie.app"

  zap trash: [
    "~/Library/Application Support/JeffernMovie",
  ]
end