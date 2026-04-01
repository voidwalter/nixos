{ config, pkgs, ... }: 

let
  homepage = (pkgs.fetchFromGitHub
  {
    owner = "notawyvern";
    repo = "search";
    rev = "b9edf5df8530ead56f24ffdd55ee7ca7c98e6dd6";
    sha256 = "sha256-KmSorO+FT7z4RfS99ZD66NoQwIEC2HPh9ZzEyyhxdLU=";
  } + "/index.html");
in {
  programs.qutebrowser = { 
    enable = true;
    package = pkgs.qutebrowser;
    settings = {

			searchEngines = {
				DEFAULT = "https://html.duckduckgo.com/html/search?q={}";
				ps = "https://presearch.com/search?q={}";
				bv = "https://search.brave.com/search?q={}";
				gp = "https://grokipedia.com/search?q={}";
				wp = "https://wikipedia.com/search?q={}";
				r = "https://www.reddit.com/search?q={}";
				yt = "https://inv.nadeko.net/search?q={}";
				nw = "https://wiki.nixos.org/w/index.php?search=%s";
				nix = "https://mynixos.com/search?q={}";
				ddg = "https://duckduckgo.com/?q={}";
			};

      colors.webpage.darkmode.enabled = true;
      tabs.show = "multiple";
      url.default_page = "duckduckgo.com";
      url.start_pages = "duckduckgo.com";

      content.blocking.adblock.lists = [
        "https://easylist.to/easylist/easylist.txt"
        "https://easylist.to/easylist/easyprivacy.txt"
        "https://easylist-downloads.adblockplus.org/easylistportuguese.txt"
        "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
        "https://raw.githubusercontent.com/Yhonay/antipopads/master/hosts"
        "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt"
        "https://raw.githubusercontent.com/Spam404/lists/master/adblock-list.txt"
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=0&mimetype=plaintext"
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
        "https://easylist-downloads.adblockplus.org/fanboy-social.txt"
        "https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt"
        "https://adaway.org/hosts.txt"
        "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
        "https://raw.githubusercontent.com/DandelionSprout/adfilt/refs/heads/master/Dandelion%20Sprout's%20Anti-Malware%20List.txt"
        "https://someonewhocares.org/hosts/zero/hosts"
        "https://raw.githubusercontent.com/bongochong/CombinedPrivacyBlockLists/master/MiniLists/cpbl-abp-mini.txt"
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts"
      ];
    };
  };
}
