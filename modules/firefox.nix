{config, pkgs, ...}: 

{
	programs = {
		firefox = {
			enable = true;
			languagePacks = [ "en-US" ];

			policies = {
				DisableTelemetry = true;
				DisableFirefoxStudies = true;
				EnableTrackingProtection = {
					Value = true;
					Locked = true;
					Cryptomining = true;
					Fingerprinting = true;
				};
				DisablePocket = true;
				DisableFirefoxAccounts = true;
				DisableAccounts = true;
				DisableFirefoxScreenshots = true;
				OverrideFirstRunPage = "";
				OverridePostUpdatePage = "";
				DisplayBookmarksToolbar = "always";
				DisplayMenuBar = "default-off";
				SearchBar = "unified";

				ExtensionSettings = {
					"*".installation_mode = "blocked";
					"uBlock0@raymondhill.net" = {
						"installation_mode" = "force_installed";
						"install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
					};
				};
				Preferences = { 
					# "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
					# "extensions.pocket.enabled" = lock-false;
					# "extensions.screenshots.disabled" = lock-true;
					# "browser.topsites.contile.enabled" = lock-false;
					# "browser.formfill.enable" = lock-false;
					# "browser.search.suggest.enabled" = lock-false;
					# "browser.search.suggest.enabled.private" = lock-false;
					# "browser.urlbar.suggest.searches" = lock-false;
					# "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
					# "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
					# "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
					# "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
					# "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
					# "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
					# "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
					# "browser.newtabpage.activity-stream.showSponsored" = lock-false;
					# "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
				};
			};
		};
	};
}
