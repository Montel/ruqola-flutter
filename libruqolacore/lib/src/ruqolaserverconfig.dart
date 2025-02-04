/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
enum AuthMethodType {
  unknown(1 << 0),
  twitter(1 << 1),
  faceBook(1 << 2),
  gitHub(1 << 4),
  gitLab(1 << 8),
  google(1 << 16),
  linkedin(1 << 32),
  wordpress(1 << 64),
  password(1 << 128),
  apple(1 << 256),
  nextCloud(1 << 512),
  personalAccessToken(1 << 1024);

  final int value;
  const AuthMethodType(this.value);
}

class RuqolaServerConfig {
  /*
  // Server config
    PasswordSettings mPasswordSettings;
    QString mUniqueId;
    QString mJitsiMeetUrl;
    QString mJitsiMeetPrefix;
    QString mFileUploadStorageType;
    QString mSiteUrl;
    QString mSiteName;
    QString mServerVersionStr;
    QString mAutoTranslateGoogleKey;
    QString mChannelNameValidation;
    QString mUserNameValidation;
    QString mAccountsDefaultUserPreferencesDesktopNotifications;
    QString mAccountsDefaultUserPreferencesPushNotifications;
    AuthenticationManager::AuthMethodTypes mServerAuthTypes = AuthenticationManager::AuthMethodType::Unknown;
    AuthenticationManager::AuthMethodTypes mRuqolaAuthMethodTypes = AuthenticationManager::AuthMethodType::Unknown;
    int mBlockEditingMessageInMinutes = 5;
    int mBlockDeletingMessageInMinutes = 5;
    int mServerVersionMajor = -1;
    int mServerVersionMinor = -1;
    int mServerVersionPatch = -1;
    qint64 mFileMaxFileSize = -1;

    bool mMessageAllowConvertLongMessagesToAttachment = false;
    bool mUIUseRealName = false;

    ServerConfigFeatureTypes mServerConfigFeatureTypes = ServerConfigFeatureType::None;

    List<String> mMediaWhiteList;
    List<String> mMediaBlackList;

    ConfigWithDefaultValue mLogoUrl;
    ConfigWithDefaultValue mFaviconUrl;
    int mLoginExpiration = -1;
    int mMessageMaximumAllowedSize = -1;
    int mMessageGroupingPeriod = -1;
    int mDirectMessageMaximumUser = -1;
    int mMessageQuoteChainLimit = -1;
    int mEmbedCacheExpirationDays = 30; // Default value in RC

    bool mHasEnterpriseSupport = false;
    bool mAccountsAllowInvisibleStatusOption = true; // Default true
    bool mUserDataDownloadEnabled = true;
    bool mDeviceManagementEnableLoginEmails = false;
    bool mDeviceManagementAllowLoginEmailpreference = false;
    bool mAllowCustomStatusMessage = false;
    bool mPreviewEmbed = false;
    bool mAllowEmailNotifications = true; // Default true
    bool mAllowEmailVerification = false;
    bool mFederationEnabled = false;
    bool mAccountsManuallyApproveNewUsers = false;
*/
}
