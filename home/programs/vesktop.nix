{ config, lib, ... }:

{
  programs.vesktop = {
    enable = true;
    vencord = {
      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        useQuickCss = true;
				notifications = {
          timeout = 500;
          position = "bottom-right";
          useNative = "always";
          logLimit = 50;
        };

				plugins = {
					useSystem = true;
          CommandsAPI.enabled = true;
          DynamicImageModalAPI.enabled = true;
          MessageAccessoriesAPI.enabled = true;
          MessageEventsAPI.enabled = true;
          MessagePopoverAPI.enabled = true;
          MessageUpdaterAPI.enabled = true;
          UserSettingsAPI.enabled = true;
          AlwaysAnimate.enabled = true;
          BetterGifAltText.enabled = true;
          ClearURLs.enabled = true;
          CopyFileContents.enabled = true;
          CrashHandler.enabled = true;
          Experiments.enabled = true;
          ForceOwnerCrown.enabled = true;
          FriendsSince.enabled = true;
          MutualGroupDMs.enabled = true;
          NoF1.enabled = true;
          NSFWGateBypass.enabled = true;
          ServerInfo.enabled = true;
          VoiceMessages.enabled = true;
          WebKeybinds.enabled = true;
          WebScreenShareFixes.enabled = true;
          YoutubeAdblock.enabled = true;
          SupportHelper.enabled = true;
          BadgeAPI.enabled = true;
          BetterSettings = { enabled = true; disableFade = true; eagerLoad = true; };
          CallTimer = { enabled = true; format = "stopwatch"; };
          Decor = { enabled = true; agreedToGuidelines = true; };
          NoTrack = { enabled = true; disableAnalytics = true; };
          WebContextMenus = { enabled = true; addBack = true; };
          BetterSessions = {
            enabled = true;
            backgroundCheck = false;
          };

          FakeNitro = {
            enabled = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            enableEmojiBypass = true;
            transformEmojis = true;
            transformStickers = true;
            transformCompoundSentence = false;
            emojiSize = 40;
            hyperLinkText = "{{NAME}}";
            useHyperLinks = true;
            disableEmbedPermissionCheck = false;
          };

          FakeProfileThemes = {
            enabled = true;
            nitroFirst = true;
          };

          MessageLogger = {
            enabled = true;
            collapseDeleted = false;
            deleteStyle = "text";
            ignoreBots = false;
            ignoreSelf = false;
            logEdits = true;
            logDeletes = true;
            inlineEdits = true;
          };

          RelationshipNotifier = {
            enabled = true;
            offlineRemovals = true;
            groups = true;
            servers = true;
            friends = true;
            friendRequestCancels = true;
          };

          ShowHiddenChannels = {
            enabled = true;
            showMode = 0;
            hideUnreads = true;
            defaultAllowedUsersAndRolesDropdownState = true;
          };

          ShowHiddenThings = {
            enabled = true;
            showTimeouts = true;
            showInvitesPaused = true;
            showModView = true;
            disableDiscoveryFilters = true;
            disableDisallowedDiscoveryFilters = true;
          };

          USRBG = {
            enabled = true;
            voiceBackground = true;
            nitroFirst = true;
          };
          Settings = {
            enabled = true;
            settingsLocation = "aboveNitro";
          };
        };
      };
    };
  };
}
