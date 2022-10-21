{ config, pkgs, ... }:
let
  packageSettings =
    if pkgs.stdenv.isDarwin then { package = pkgs.firefox-bin; } else { };
in {
  programs.firefox = {
    enable = true;
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      clearurls
      canvasblocker
      darkreader
      decentraleyes
      i-dont-care-about-cookies
      multi-account-containers
      search-by-image
      terms-of-service-didnt-read
      user-agent-string-switcher
      ublock-origin
      unpaywall
      view-image
    ];

    profiles."kirin".settings = {
      "accessibility.force_disabled" = 1;
      "app.normandy.api_url" = "";
      "app.normandy.enabled" = false;
      "app.shield.optoutstudies.enabled" = false;
      "app.update.auto" = false;
      "app.update.background.scheduling.enabled" = false;
      "beacon.enabled" = false;
      "breakpad.reportURL" = "";
      "browser.aboutConfig.showWarning" = false;
      "browser.bookmarks.max_backups" = 2;
      "browser.cache.disk.capacity" = 1048576;
      "browser.cache.disk.enable" = false;
      "browser.cache.memory.capacity" = -1;
      "browser.cache.memory.enable" = true;
      "browser.contentblocking.category" = "strict";
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
      "browser.crashReports.unsubmittedCheck.enabled" = false;
      "browser.discovery.enabled" = false;
      "browser.display.use_system_colors" = true;
      "browser.download.manager.addToRecentDocs" = false;
      "browser.download.useDownloadDir" = false;
      "browser.fixup.alternate.enabled" = false;
      "browser.formfill.enable" = false;
      "browser.helperApps.deleteTempFileOnExit" = true;
      "browser.link.open_newwindow" = 3;
      "browser.link.open_newwindow.restriction" = 0;
      "browser.messaging-system.whatsNewPanel.enabled" = false;
      "browser.newtab.preload" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
        false;
      "browser.newtabpage.activity-stream.default.sites" = "";
      "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.feeds.snippets" = false;
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.section.highlights.includePocket" =
        false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.telemetry" = false;
      "browser.newtabpage.enabled" = false;
      "browser.pagethumbnails.capturing_disabled" = true;
      "browser.ping-centre.telemetry" = false;
      "browser.privatebrowsing.forceMediaMemoryCache" = true;
      "browser.region.network.url" = "";
      "browser.region.update.enabled" = false;
      "browser.safebrowsing.allowOverride" = true;
      "browser.safebrowsing.downloads.enabled" = false;
      "browser.safebrowsing.downloads.remote.enabled" = false;
      "browser.safebrowsing.downloads.remote.url" = "";
      "browser.safebrowsing.malware.enabled" = false;
      "browser.safebrowsing.phishing.enabled" = false;
      "browser.search.context.loadInBackground" = false;
      "browser.search.isUS" = false;
      "browser.search.log" = false;
      "browser.search.region" = "AU";
      "browser.search.searchEnginesURL" =
        "https://addons.mozilla.org/%LOCALE%/firefox/search-engines/";
      "browser.search.suggest.enabled" = false;
      "browser.search.update" = false;
      "browser.sessionstore.privacy_level" = 2;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.ssl_override_behavior" = 1;
      "browser.startup.homepage" = "about:blank";
      "browser.startup.homepage_override.mstone" = "ignore";
      "browser.startup.page" = 0;
      "browser.tabs.crashReporting.sendReport" = false;
      "browser.uitour.enabled" = false;
      "browser.uitour.url" = "";
      "browser.urlbar.dnsResolveSingleWordsAfterSearch" = 0;
      "browser.urlbar.speculativeConnect.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.urlbar.trimURLs" = false;
      "browser.xul.error_pages.expert_bad_cert" = true;
      "captivedetect.canonicalURL" = "";
      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "devtools.chrome.enabled" = false;
      "devtools.debugger.remote-enabled" = false;
      "dom.event.contextmenu.enabled" =
        true; # Turned off because it can be annoying in code-server and deluge. Trivial to adjust ad-hoc.
      "dom.disable_beforeunload" = true;
      "dom.disable_open_during_load" = true;
      "dom.disable_window_move_resize" = true;
      "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
      "dom.push.enabled" = false;
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_send_http_background_request" = false;
      "dom.serviceWorkers.enabled" =
        true; # Required for code-server to work with Jupyter Notebooks
      "dom.events.testing.asyncClipboard" =
        true; # Allows copy/paste in terminal via http insecure code-server
      "dom.storage.next_gen" = true;
      "dom.targetBlankNoOpener.enabled" = true;
      "extensions.autoDisableScopes" = 15;
      "extensions.blocklist.enabled" = true;
      "extensions.enabledScopes" = 5;
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.available" = "off";
      "extensions.formautofill.creditCards.available" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "extensions.formautofill.heuristics.enabled" = false;
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "extensions.postDownloadThirdPartyPrompt" = false;
      "extensions.systemAddon.update.enabled" = false;
      "extensions.systemAddon.update.url" = "";
      "extensions.webcompat-reporter.enabled" = false;
      "geo.provider.ms-windows-location" = false;
      "geo.provider.use_corelocation" = false;
      "geo.provider.use_gpsd" = false;
      "intl.accept_languages" = "en-US, en";
      "keyword.enabled" = true;
      "layout.spellcheckDefault" = 2;
      "media.autoplay.default" = 5;
      "media.eme.enabled" = false;
      "media.memory_cache_max_size" = 65536;
      "media.peerconnection.enabled" = false;
      "media.peerconnection.ice.default_address_only" = true;
      "media.peerconnection.ice.no_host" = true;
      "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
      "middlemouse.contentLoadURL" = false;
      "network.IDN_show_punycode" = true;
      "network.captive-portal-service.enabled" = false;
      "network.connectivity-service.enabled" = false;
      "network.cookie.cookieBehavior" = 4;
      "network.cookie.thirdparty.nonsecureSessionOnly" = true;
      "network.cookie.thirdparty.sessionOnly" = true;
      "network.dns.disableIPv6" = true;
      "network.dns.disablePrefetch" = true;
      "network.file.disable_unc_paths" = true;
      "network.gio.supported-protocols" = "";
      #"network.http.referer.spoofSource" = false;
      "network.http.sendRefererHeader" = 0;
      "network.http.speculative-parallel-limit" = 0;
      "network.predictor.enabled" = false;
      "network.prefetch-next" = false;
      "network.protocol-handler.external.ms-windows-store" = false;
      "network.proxy.type" = 0; # fixes no internal dns resolution via pihole
      "network.proxy.socks_remote_dns" = true;
      "network.trr.mode" = 0;
      "network.trr.resolvers" = "https://doh.libredns.gr/dns-query";
      "pdfjs.disabled" = false;
      "pdfjs.enableScripting" = false;
      "permissions.delegation.enabled" = false;
      "permissions.manager.defaultsUrl" = "";
      "privacy.clearOnShutdown.cache" = true;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.downloads" = true;
      "privacy.clearOnShutdown.formdata" = true;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.offlineApps" = true;
      "privacy.clearOnShutdown.sessions" = false;
      "privacy.clearOnShutdown.siteSettings" = false;
      "privacy.cpd.cache" = true;
      "privacy.cpd.cookies" = true;
      "privacy.cpd.formdata" = true;
      "privacy.cpd.history" = true;
      "privacy.cpd.offlineApps" = true;
      "privacy.cpd.passwords" = false;
      "privacy.cpd.sessions" = true;
      "privacy.cpd.siteSettings" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.firstparty.isolate" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.resistFingerprinting.block_mozAddonManager" = true;
      "privacy.resistFingerprinting.letterboxing" = false;
      "privacy.sanitize.sanitizeOnShutdown" = true;
      "privacy.sanitize.timeSpan" = 0;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "privacy.userContext.enabled" = true;
      "privacy.userContext.ui.enabled" = true;
      "privacy.window.name.update.enabled" = true;
      "security.OCSP.enabled" = 1;
      "security.OCSP.require" = true;
      "security.ask_for_password" = 2;
      "security.cert_pinning.enforcement_level" = 2;
      "security.csp.enable" = true;
      "security.dialog_enable_delay" = 1000;
      "security.family_safety.mode" = 0;
      "security.insecure_connection_text.enabled" = true;
      "security.mixed_content.block_display_content" = true;
      "security.password_lifetime" = 5;
      "security.pki.crlite_mode" = 2;
      "security.pki.sha1_enforcement_level" = 1;
      "security.remote_settings.crlite_filters.enabled" = true;
      "security.ssl.require_safe_negotiation" = true;
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "security.tls.enable_0rtt_data" = false;
      "security.tls.version.enable-deprecated" = false;
      #"services.sync.prefs.sync.browser.startup.homepage" = true;
      #"services.sync.prefs.sync.browser.startup.page" = true;
      "signon.autofillForms" = false;
      "signon.formlessCapture.enabled" = false;
      "signon.rememberSignons" = false;
      "toolkit.coverage.endpoint.base" = "";
      "toolkit.coverage.opt-out" = true;
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.coverage.opt-out" = true;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.server" = "data:,";
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "toolkit.winRegisterApplicationRestart" = false;
      "webchannel.allowObject.urlWhitelist" = "";
      "webgl.disabled" = true;
    };
  } // packageSettings;
}
