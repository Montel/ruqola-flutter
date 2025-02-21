// ignore_for_file: constant_identifier_names

/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:libruqolacore/src/ruqolaserverconfigpassword.dart';
import 'package:collection/collection.dart';

enum AuthMethodType {
  unknown(0),
  twitter(1 << 0),
  faceBook(1 << 1),
  gitHub(1 << 2),
  gitLab(1 << 4),
  google(1 << 8),
  linkedin(1 << 16),
  wordpress(1 << 32),
  password(1 << 64),
  apple(1 << 128),
  nextCloud(1 << 256),
  personalAccessToken(1 << 512);

  final int value;
  const AuthMethodType(this.value);
}

enum ServerConfigFeatureType {
  None(0),
  AllowEditingMessage(1 << 0),
  OtrEnabled(1 << 1),
  // NeedAdaptNewSubscriptionRC60 = 4,
  EncryptionEnabled(1 << 2),
  AllowMessagePinning(1 << 4),
  AllowMessageStarring(1 << 8),
  AllowMessageDeleting(1 << 16),
  JitsiEnabled(1 << 32),
  ThreadsEnabled(1 << 64),
  DiscussionEnabled(1 << 128),
  AutoTranslateEnabled(1 << 256),
  UploadFileEnabled(1 << 512),
  BroadCastEnabled(1 << 1024),
  VideoRecorderEnabled(1 << 2048),
  AudioRecorderEnabled(1 << 4096),
  AllowDeleteOwnAccount(1 << 8192),
  RegistrationFormEnabled(1 << 16384),
  AllowPasswordReset(1 << 32768),
  AllowEmailChange(1 << 65536),
  AllowPasswordChange(1 << 131072),
  AllowUsernameChange(1 << 262144),
  AllowUserProfileChange(1 << 524288),
  AllowUserAvatarChange(1 << 1048576),
  LdapEnabled(1 << 2097152),
  JitsiEnabledTeams(1 << 4194304),
  JitsiEnabledChannels(1 << 8388608),
  TwoFactorAuthenticationEnabled(1 << 16777216),
  TwoFactorAuthenticationByEmailEnabled(1 << 33554432),
  TwoFactorAuthenticationByTOTPEnabled(1 << 67108864),
  TwoFactorAuthenticationEnforcePasswordFallback(1 << 134217728);

  final int value;
  const ServerConfigFeatureType(this.value);
}

class RuqolaServerConfig {
  // Server config
  RuqolaServerConfigPassword mPasswordSettings = RuqolaServerConfigPassword();
  String uniqueId = '';
  String jitsiMeetUrl = '';
  String jitsiMeetPrefix = '';
  String fileUploadStorageType = '';
  String siteUrl = '';
  String siteName = '';
  String serverVersionStr = '';
  String autoTranslateGoogleKey = '';
  String channelNameValidation = '';
  String userNameValidation = '';
  String accountsDefaultUserPreferencesDesktopNotifications = '';
  String accountsDefaultUserPreferencesPushNotifications = '';
  /*
    int mServerAuthTypes = AuthMethodType.unknown.value;
    AuthenticationManager::AuthMethodTypes mRuqolaAuthMethodTypes = AuthenticationManager::AuthMethodType::Unknown;
    */
  int blockEditingMessageInMinutes = 5;
  int blockDeletingMessageInMinutes = 5;
  int serverVersionMajor = -1;
  int serverVersionMinor = -1;
  int serverVersionPatch = -1;
  int fileMaxFileSize = -1;

  bool messageAllowConvertLongMessagesToAttachment = false;
  bool uIUseRealName = false;
  ServerConfigFeatureType serverConfigFeatureTypes =
      ServerConfigFeatureType.None;
  List<String> mediaWhiteList = [];
  List<String> mediaBlackList = [];
/*


    ConfigWithDefaultValue mLogoUrl;
    ConfigWithDefaultValue mFaviconUrl;
    */
  int loginExpiration = -1;
  int messageMaximumAllowedSize = -1;
  int messageGroupingPeriod = -1;
  int directMessageMaximumUser = -1;
  int messageQuoteChainLimit = -1;
  int embedCacheExpirationDays = 30; // Default value in RC

  bool hasEnterpriseSupport = false;
  bool mAccountsAllowInvisibleStatusOption = true; // Default true
  bool userDataDownloadEnabled = true;
  bool deviceManagementEnableLoginEmails = false;
  bool deviceManagementAllowLoginEmailpreference = false;
  bool allowCustomStatusMessage = false;
  bool previewEmbed = false;
  bool mAllowEmailNotifications = true; // Default true
  bool mAllowEmailVerification = false;
  bool mFederationEnabled = false;
  bool mAccountsManuallyApproveNewUsers = false;

// TODO implement it
/*
    @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RetentionInfo &&
        other.enabled == enabled &&
        other.overrideGlobal == overrideGlobal &&
        other.excludePinned == excludePinned &&
        other.filesOnly == filesOnly &&
        other.maxAge == maxAge;
  }

  @override
  int get hashCode {
    return enabled.hashCode ^
        overrideGlobal.hashCode ^
        excludePinned.hashCode ^
        filesOnly.hashCode ^
        maxAge.hashCode;
  }

  @override
  String toString() {
    return 'RuqolaServerConfig()';
  }
  */
}
