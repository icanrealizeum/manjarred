// see: about:support for currently changed prefs! (by user that is!)
// XXX: only strings should be in "", bools and integers not!

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);
//works: pref("browser.startup.homepage",	"about:blank");
//XXX: lockPref has no effect here!!! use pref() instead
//unless patch applied!
lockPref("security.turn_off_all_security_so_that_viruses_can_take_over_this_computer", false);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);
pref("browser.shell.skipDefaultBrowserCheck", true);

// Don't disable our bundled extensions in the application directory
//pref("extensions.autoDisableScopes", 11);
//pref("extensions.shownSelectionUI", true);

pref("accessibility.blockautorefresh",	true);
pref("accessibility.typeaheadfind.flashBar",	0);
pref("browser.cache.disk.capacity",	3145728);
//pref("browser.cache.disk.filesystem_reported",	"1");
//pref("browser.cache.disk.hashstats_reported",	"1");
pref("browser.cache.disk.max_entry_size",	1151200);
pref("browser.cache.disk.parent_directory",	"/tmp/firefoxcache/");
pref("browser.cache.disk.smart_size.enabled",	false);
//pref("browser.cache.disk.smart_size.first_run",	"false");
pref("browser.cache.disk.smart_size.use_old_max",	false);
//pref("browser.cache.frecency_experiment",	"1");
pref("browser.cache.memory.capacity",	5131072);
pref("browser.cache.memory.max_entry_size",	125120);
//pref("browser.download.importedFromSqlite",	true);
//pref("browser.places.smartBookmarksVersion",	"8");
pref("browser.search.update",	false);
pref("browser.search.useDBForOrder",	true);
//pref("browser.sessionstore.upgradeBackup.latestBuildID",	"20160823062219");
pref("browser.startup.homepage",	"about:blank");
//pref("browser.startup.homepage_override.buildID"	20160823062219");
//pref("browser.startup.homepage_override.mstone	51.0a1");
pref("browser.urlbar.trimURLs",	false);
pref("browser.urlbar.userMadeSearchSuggestionsChoice",	true);
pref("dom.apps.reset-permissions",	true);
pref("dom.mozApps.used",	"false");//why was this true?
//pref("extensions.lastAppVersion	51.0a1");
pref("layers.acceleration.disabled",	true);
lockPref("media.gmp-gmpopenh264.enabled",	false);
//pref("media.gmp-manager.buildID	20160823062219");
//pref("media.gmp-manager.lastCheck	1467705787");
lockPref("media.gmp-manager.url", "");
lockPref("media.gmp-provider.enabled",	false);
//pref("media.gmp.storage.version.observed",	"1");
pref("media.gmp.trial-create.enabled",	false);
pref("media.peerconnection.identity.enabled",	false);
pref("media.peerconnection.turn.disable",	true);
lockPref("media.peerconnection.video.enabled",	false);
lockPref("media.peerconnection.enabled",	false);//disable webrtc
pref("media.webrtc.debug.aec_log_dir",	"/tmp");
pref("media.webrtc.debug.log_file",	"/tmp/WebRTC.log");
pref("mousewheel.with_shift.action",	1);
pref("network.cookie.cookieBehavior",	1);
pref("network.cookie.lifetimePolicy",	2);
pref("network.cookie.prefsMigrated",	true);
pref("network.dns.disablePrefetch",	true);
pref("network.http.keep-alive.timeout",	0);
pref("network.http.referer.XOriginPolicy",	1);
pref("network.http.sendSecureXSiteReferrer",	false);
pref("network.http.speculative-parallel-limit",	0);
pref("network.predictor.cleaned-up",	true);
pref("network.prefetch-next",	false);
pref("network.tcp.keepalive.enabled",	false);//FIXME?
//pref("places.database.lastMaintenance	1471305443");
pref("places.history.expiration.transient_current_max_pages",	39883);
lockPref("plugin.default.state",	0);//how is this 1 after install?!!! or right, don't use "" for values!!
lockPref("plugin.disable_full_page_plugin_for_types",	"application/pdf");
pref("plugin.importedState",	true);//XXX ???
lockPref("plugin.state.flash",	0);
lockPref("plugin.state.java",	0);
lockPref("plugin.state.libevbrowserplugin",	0);
lockPref("plugins.notifyMissingFlash",	false);
lockPref("plugins.update.url",	"");
pref("security.ssl.errorReporting.automatic",	false);
lockPref("security.xpconnect.plugin.unrestricted",	false);
pref("services.sync.declinedEngines",	"");
//pref("storage.vacuum.last.index",	"1");
//pref("storage.vacuum.last.places.sqlite	1470332829");
pref("webgl.disabled",	true);

