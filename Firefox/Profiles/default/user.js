//
/******************************************************************************
 * user.js                                                                    *
 ******************************************************************************/

user_pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);
// enabled to load "[user-profile]/chrome/user{Chrome,Content}.css"

user_pref('privacy.fingerprintingProtection', true);
// Mozilla WIP less disruptive than privacy.resistFingerprinting
// user_pref('privacy.resistFingerprinting.block_mozAddonManager', true);

user_pref('browser.link.open_newwindow', 2);
// open external links in a new window, not a tab in frontmost window


// user_pref('browser.tabs.tabmanager.enabled', false);
// hide the tabs popdown menu

// user_pref('extensions.webextensions.restrictedDomains', '');
// user_pref('extensions.quarantinedDomains.enabled', false); // not yet needed
// Don't block extensions (e.g Dark Reader) from working on restricted domains.


/******************************************************************************
 * for more ideas, see:
 *      https://github.com/arkenfox/user.js
 *      https://github.com/pyllyukko/user.js
 ******************************************************************************/

/******************************************************************************
 * SECTION: Firefox (anti-)features / components                              *
 ******************************************************************************/

//user_pref("browser.pocket.enabled", false);
//user_pref("extensions.pocket.enabled", false);
// PREF: Disable "Recommended by Pocket" in Firefox Quantum
//user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
