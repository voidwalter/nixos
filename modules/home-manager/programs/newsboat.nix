{ config, pkgs, ...}:

{
	programs.newsboat = {
		enable = true;
    autoReload = true;
		autoFetchArticles.enable = true;

		urls = [
			# Tech
			{ url = "https://news.ycombinator.com/rss"; title = "~Hacker News"; tags = ["tech" "news"]; }
			{ url = "http://feeds.feedburner.com/TechCrunch"; title = "~TechCrunch"; tags = ["tech" "news"]; }
			{ url = "https://lwn.net/headlines/newrss"; title = "~LWN"; tags = ["linux" "tech"]; }
			
			# Programming & Development
			{ url = "https://github.blog/feed/"; title = "~GitHub Blog"; tags = ["git" "programming"]; }
			
			# subreddits
			{ url = "https://www.reddit.com/r/linux/.rss"; title = "~r/linux"; tags = ["linux" "reddit"]; }
			{ url = "https://www.reddit.com/r/nixos/.rss"; title = "~r/archlinux"; tags = ["linux" "archlinux" "reddit"]; }
			{ url = "https://www.reddit.com/r/nix/.rss"; title = "~r/nix"; tags = ["nix" "reddit"]; }
			{ url = "https://www.reddit.com/r/programming/.rss"; title = "~r/programming"; tags = ["programming" "reddit"]; }
			{ url = "https://www.reddit.com/r/technology/.rss"; title = "~r/technology"; tags = ["tech" "reddit"]; }
			{ url = "https://www.reddit.com/r/science/.rss"; title = "~r/science"; tags = ["science" "reddit"]; }
			{ url = "https://www.reddit.com/r/privacy/.rss"; title = "~r/privacy"; tags = ["privacy" "reddit"]; }
		];

    extraConfig = ''
      # smart dispatcher (image→imv, video→mpv, pdf→zathura, text→nvim)
      browser link-handler
      external-url-viewer "urlscan -dc -r 'link-handler {}'"

      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key q quit
      bind-key a toggle-article-read
      bind-key n next-unread
      bind-key N prev-unread
      bind-key D pb-download
      bind-key U show-urls
      bind-key x pb-delete

      # ── Macros (triggered with , then the letter) ─────────────────────
      # ,v  play in mpv
      macro v set browser "mpv" ; open-in-browser ; set browser link-handler
      # ,t  queue full video download via yt-dlp
      macro t set browser "qndl" ; open-in-browser ; set browser link-handler
      # ,a  queue audio-only download via yt-dlp
      macro a set browser "qndl-audio" ; open-in-browser ; set browser link-handler
      # ,w  open in links2 text browser (new foot window)
      macro w set browser "foot links2" ; open-in-browser ; set browser link-handler
      # ,d  fuzzel handler menu: choose how to open
      macro d set browser "fuzzel-handler" ; open-in-browser ; set browser link-handler
      # ,c  copy URL to Wayland clipboard (wl-copy accepts URL as argument)
      macro c set browser "wl-copy" ; open-in-browser ; set browser link-handler
      # ,,  open-in-browser with default handler
      macro , open-in-browser

      # ── Colours (Noctalia Monochrome-compatible palette) ───────────────
      color listnormal            cyan      default
      color listfocus             black     yellow    standout bold
      color listnormal_unread     blue      default
      color listfocus_unread      yellow    default   bold
      color info                  red       black     bold
      color article               white     default   bold

      # ── Highlights inside articles ────────────────────────────────────
      highlight all "---.*---" yellow
      highlight feedlist ".*(0/0))" black
      highlight article "(^Feed:.*|^Title:.*|^Author:.*)" cyan default bold
      highlight article "(^Link:.*|^Date:.*)" default default
      highlight article "https?://[^ ]+" green default
      highlight article "^(Title):.*$" blue default
      highlight article "\\[[0-9][0-9]*\\]" magenta default bold
      highlight article "\\[image\\ [0-9]+\\]" green default bold
      highlight article "\\[embedded flash: [0-9][0-9]*\\]" green default bold
      highlight article ":.*\\(link\\)$" cyan default
      highlight article ":.*\\(image\\)$" blue default
      highlight article ":.*\\(embedded flash\\)$" magenta default
    '';
  };
}
