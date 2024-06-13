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

user_pref('browser.compactmode.show', true);
// enable deprecated Customize Toolbar > Density popup menu

/******************************************************************************
 * for more ideas, see:
 *      https://github.com/arkenfox/user.js
 *      https://github.com/pyllyukko/user.js
 ******************************************************************************/

/******************************************************************************
 * SECTION: Firefox (anti-)features / components                              *
 ******************************************************************************/

// Disable Telemetry
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.first_run", false);
user_pref("app.normandy.user_id", "");
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.update.auto", false); // Use system updater
user_pref("beacon.enabled", false);
user_pref("breakpad.reportURL", "");

// Security
user_pref("security.OCSP.require", true);
user_pref("security.app_menu.recordEventTelemetry", false);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.certerrors.recordEventTelemetry", false);
user_pref("security.disable_button.openCertManager", false);
user_pref("security.dialog_enable_delay", 500);
user_pref("security.family_safety.mode", 0);
user_pref("security.identitypopup.recordEventTelemetry", false);
user_pref("security.insecure_connection_text.enabled", true);
user_pref("security.mixed_content.block_display_content", true);
user_pref("security.pki.crlite_mode", 2);
user_pref("security.pki.mitm_canary_issuer", "E=none,CN=None,OU=NA,O=\"None, LLC\",L=Dallas,ST=Texas,C=US");
user_pref("security.protectionspopup.recordEventTelemetry", false);
user_pref("security.remote_settings.crlite_filters.enabled", true);
// user_pref("security.ssl.disable_session_identifiers", true); // slow, private aaaand borked keep-alive
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.tls.enable_0rtt_data", true);

// Block weak encryption
user_pref("security.ssl3.deprecated.rsa_des_ede3_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha", false);
user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha", false);
user_pref("security.ssl3.ecdhe_rsa_aes_128_sha", false);
user_pref("security.ssl3.ecdhe_rsa_aes_256_sha", false);
user_pref("security.ssl3.rsa_aes_128_gcm_sha256", false);
user_pref("security.ssl3.rsa_aes_128_sha", false);
user_pref("security.ssl3.rsa_aes_256_gcm_sha384", false);
user_pref("security.ssl3.rsa_aes_256_sha", false);

