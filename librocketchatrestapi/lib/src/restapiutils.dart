/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

// extension type
enum RestApiUrlExtensionType {
  noExtension,
  v1,
  apps,
}

extension RestApiUrlExtensionTypeExtension on RestApiUrlExtensionType {
  String get path {
    switch (this) {
      case RestApiUrlExtensionType.noExtension:
        return "/api/";
      case RestApiUrlExtensionType.v1:
        return "/api/v1/";
      case RestApiUrlExtensionType.apps:
        return "/api/apps/";
    }
  }
}

// Enum for restapi class type
enum RestApiUrlType {
  empty,
  login,
  logout,
  me,
  usersCreate,
  usersDelete,
  usersCreateToken,
  usersGetPresence,
  usersInfo,
  usersList,
  usersRegister,
  usersGetAvatar,
  usersResetAvatar,
  usersSetAvatar,
  usersUpdate,
  usersPresence,
  /*since 1.1.0*/
  usersUpdateOwnBasicInfo,

  // PersonalAccess Token
  usersGeneratePersonalAccessToken,
  usersRegeneratePersonalAccessToken,
  usersRemovePersonalAccessToken,
  usersGetPersonalAccessTokens,

  usersGetUsernameSuggestion,
  usersSetStatus,
  usersGetStatus,
  /* ... 2.4 ? */
  usersAutocomplete,
  /* ... 3.1 ? */
  usersRemoveOtherTokens,
  usersDeleteOwnAccount,
  usersSetActiveStatus,

  usersResetTOTP,
  usersResetE2EKey,

  chatDelete,
  chatGetMessage,
  chatPinMessage,
  chatPostMessage,
  chatReact,
  chatSearch,
  chatStarMessage,
  chatUnPinMessage,
  chatUnStarMessage,
  chatUpdate,
  chatIgnoreUser,
  chatReportMessage,
  // Since 1.0.0
  chatFollowMessage,
  chatUnFollowMessage,
  chatGetThreadsList,
  chatSyncThreadMessages,
  chatGetThreadMessages,
  chatSyncThreadsList,
  chatGetDeletedMessage,
  chatSendMessage,
  chatMessageReadReceipts,
  // Since 2.0.0
  chatGetPinnedMessages,
  chatGetMentionedMessages,

  // Since 2.2.x
  chatGetStarredMessages,
  chatGetSnippetedMessages,

  chatSyncMessages,

  channelsAddAll,
  //@since 0.75
  channelsAddLeader,
  channelsAddModerator,
  channelsAddOwner,
  channelsArchive,
  channelsClose,
  channelsCreate,
  channelsGetIntegrations,
  channelsHistory,
  channelsInfo,
  channelsInvite,
  channelsKick,
  channelsLeave,
  channelsList,
  channelsListJoined,
  channelsOpen,
  channelsRemoveModerator,
  channelsRemoveOwner,
  //@since 0.75
  channelsRemoveLeader,
  channelsRename,
  channelsSetDescription,
  channelsSetJoinCode,
  channelsSetPurpose,
  channelsSetReadOnly,
  channelsSetTopic,
  channelsSetType,
  channelsSetAnnouncement,
  channelsFiles,
  channelsUnarchive,
  channelsCounters,
  channelsMembers,
  channelsJoin,
  channelsOnline,
  // since 0.70
  channelsModerators,
  // Since 0.71
  channelsDelete,
  // since 0.65
  channelsRoles,
  // since 0.63
  channelsGetAllUserMentionsByChannel,
  groupsAddAll,
  groupsAddModerator,
  groupsAddOwner,
  groupsAddLeader,
  groupsArchive,
  groupsClose,
  groupsCreate,
  // since 0.70
  groupsDelete,
  groupsGetIntegrations,
  groupsHistory,
  groupsInfo,
  groupsInvite,
  groupsKick,
  groupsLeave,
  groupsList,
  groupsOpen,
  groupsRemoveModerator,
  groupRemoveOwner,
  groupRemoveLeader,
  groupsRename,
  groupsSetDescription,
  groupsSetPurpose,
  groupsSetReadOnly,
  groupsSetTopic,
  groupsSetType,
  groupsUnarchive,
  groupsSetAnnouncement,
  groupsFiles,
  groupsListAll,
  groupsMembers,
  // Since 0.65
  groupsRoles,
  groupsCounters,
  groupsSetEncrypted,
  serverInfo,
  settings,
  settingsPublic,
  updateAdminSettings,
  spotlight,
  loadEmojiCustom,
  emojiCustomDelete,
  emojiCustomCreate,
  emojiCustomUpdate,
  emojiCustomAll,

  roomsUpload,
  roomsSaveNotification,
  roomsSaveSettings,
  roomsAdminRooms,
  roomsAdminRoomsGetRoom,
  imClose,
  imCreate,
  imHistory,
  imFiles,
  imOpen,
  imMessages,
  imDelete,
  // Since 0.59
  imMembers,
  imSetTopic,
  subscriptionsRead,
  subscriptionsUnRead,
  settingsOauth,
  settingsAddCustomOauth,
  roomsGet,
  roomsFavorite,
  roomsCleanHistory,
  roomsInfo,
  roomsLeave,
  roomsCreateDiscussion,
  roomsGetDiscussions,
  roomsExport,
  roomsChangeArchivactionState,
  roomsNameExists,

  forgotPassword,
  commandsList,
  commandsGet,
  commandsRun,
  commandsPreview,
  // since 0.70
  e2ESetRoomKeyID,
  e2EfetchMyKeys,
  e2EupdateGroupKey,
  e2ESetUserPublicAndPrivateKeys,
  e2EGetusersOfRoomWithoutKey,
  e2ERequestSubscriptionKeys,
  e2EResetOwnE2EKey,

  rolesList,
  rolesCreate,
  rolesUpdate,
  rolesSync,
  rolesDelete,
  rolesAddUserToRole,
  rolesGetusersInRole,
  rolesRemoveUserFromRole,

  // since 0.74
  videoConfJitsi,

  // Autotranslate @since 2.0
  autoTranslateGetSupportedLanguages,
  autoTranslateSaveSettings,
  autoTranslateTranslateMessage,

  // Since 2.4
  customUserStatusList,
  customUserStatusCreate,
  customUserStatusDelete,
  customUserStatusUpdate,
  customSoundsList,

  // Invite since 2.5 ?
  findOrCreateInvite,
  listInvites,
  removeInvite,
  useInviteToken,
  validateInviteToken,

  // RC 6.0
  sendInvitationEmails,

  // Since 2.4.0
  roomsAutocompleteChannelAndPrivate,

  // two factor authentication
  users2FASendEmailCode,
  users2FAEnableEmail,
  users2FADisableEmail,

  usersSetPreferences,

  // Permission
  permissionsListAll,
  permissionsUpdate,

  statistics,

  directory,

  // teams 3.13
  teamsList,
  teamsListAll,
  teamsCreate,
  teamsAddRooms,
  teamsRemoveRoom,
  teamsUpdateRoom,
  teamsListRooms,
  teamsListRoomsOfUsers,
  teamsMembers,
  teamsAddMembers,
  teamsUpdateMember,
  teamsRemoveMember,
  teamsLeave,
  teamsInfo,
  teamsDelete,
  teamsAutocomplete,
  teamsConvertToChannel,
  roomsAutocompleteAvailableForTeams,
  channelsConvertToTeam,
  groupsConvertToTeam,

  stdoutQueue,

  // Oauth
  oauthAppsList,
  oauthAppsGet,
  // 5.4.0
  oauthAppsCreate,
  oauthAppsUpdate,
  oauthAppsDelete,

  // License
  licensesGet,
  licensesMaxActiveusers,
  licensesAdd,
  licensesIsEntreprise,
  // 6.5.0
  licensesInfo,

  // Banner
  bannersDismiss,
  banners,

  // Session
  sessionsList,
  sessionsInfo,
  sessionsListAll,
  sessionsLogoutMe,
  sessionsLogout,
  sessionsInfoAdmin,

  userRequestDataDownload,

  // 5.4.0
  roomsDelete,

  // video Conference
  videoConferenceStart,
  videoConferenceJoin,
  videoConferenceCancel,
  videoConferenceInfo,
  videoConferenceList,
  videoConferenceProviders,
  videoConferenceCapabilities,

  // moderation
  moderationReportsByusers,
  moderationDismissReports,
  moderationUserReportedMessages,
  moderationUserDeleteReportedMessages,
  moderationReports,
  moderationReportInfo,
  moderationUserReports,
  moderationUserReportsByUserId,
  moderationDismissUserReports,
  moderationReportUser,

  // Proxy
  methodCall,
  methodCallAnon,

  // Apps.ui.interaction
  appsUiInteraction,

  // users.logoutOtherClients
  usersLogoutOtherClients,

  // rooms.muteUser
  roomsMuteUser,
  roomsUnmuteUser,

  // /api/apps/ (applications)
  featuredApps,
  categoriesApps,
  countApps,
  notifyAdminsApps,
  installedApps,
  marketplaceApps,

  // users.listByStatus
  usersListByStatus,

  // users.sendWelcomeEmail
  usersSendWelcomeEmail,

  // rooms.images
  roomsImages,
  // rooms.membersOrderedByRole (7.3.0)
  roomsMembersOrderedByRole,
}

extension RestApiUrlTypeExtension on RestApiUrlType {
  String get name {
    switch (this) {
      case RestApiUrlType.empty:
        return "";
      case RestApiUrlType.login:
        return "login";
      case RestApiUrlType.logout:
        return "logout";
      case RestApiUrlType.me:
        return "me";
      case RestApiUrlType.usersGetAvatar:
        return "users.getAvatar";
      case RestApiUrlType.usersDelete:
        return "users.delete";
      case RestApiUrlType.usersCreate:
        return "users.create";
      case RestApiUrlType.usersCreateToken:
        return "users.createToken";
      case RestApiUrlType.usersGetPresence:
        return "users.getPresence";
      case RestApiUrlType.usersInfo:
        return "users.info";
      case RestApiUrlType.usersList:
        return "users.list";
      case RestApiUrlType.usersRegister:
        return "users.register";
      case RestApiUrlType.usersResetAvatar:
        return "users.resetAvatar";
      case RestApiUrlType.usersSetAvatar:
        return "users.setAvatar";
      case RestApiUrlType.usersUpdate:
        return "users.update";
      case RestApiUrlType.usersGetUsernameSuggestion:
        return "users.getUsernameSuggestion";

      case RestApiUrlType.usersRemovePersonalAccessToken:
        return "users.removePersonalAccessToken";
      case RestApiUrlType.usersGeneratePersonalAccessToken:
        return "users.generatePersonalAccessToken";
      case RestApiUrlType.usersRegeneratePersonalAccessToken:
        return "users.regeneratePersonalAccessToken";
      case RestApiUrlType.usersGetPersonalAccessTokens:
        return "users.getPersonalAccessTokens";

      case RestApiUrlType.usersPresence:
        return "users.presence";
      case RestApiUrlType.usersUpdateOwnBasicInfo:
        return "users.updateOwnBasicInfo";
      case RestApiUrlType.usersSetStatus:
        return "users.setStatus";
      case RestApiUrlType.usersGetStatus:
        return "users.getStatus";
      case RestApiUrlType.usersAutocomplete:
        return "users.autocomplete";
      case RestApiUrlType.usersRemoveOtherTokens:
        return "users.removeOtherTokens";
      case RestApiUrlType.usersSetActiveStatus:
        return "users.setActiveStatus";
      case RestApiUrlType.usersResetTOTP:
        return "users.resetTOTP";
      case RestApiUrlType.usersResetE2EKey:
        return "users.resetE2EKey";

      case RestApiUrlType.chatDelete:
        return "chat.delete";
      case RestApiUrlType.chatGetMessage:
        return "chat.getMessage";
      case RestApiUrlType.chatPinMessage:
        return "chat.pinMessage";
      case RestApiUrlType.chatPostMessage:
        return "chat.postMessage";
      case RestApiUrlType.chatReact:
        return "chat.react";
      case RestApiUrlType.chatStarMessage:
        return "chat.starMessage";
      case RestApiUrlType.chatUnPinMessage:
        return "chat.unPinMessage";
      case RestApiUrlType.chatUnStarMessage:
        return "chat.unStarMessage";
      case RestApiUrlType.chatUpdate:
        return "chat.update";
      case RestApiUrlType.chatSearch:
        return "chat.search";
      case RestApiUrlType.chatIgnoreUser:
        return "chat.ignoreUser";
      case RestApiUrlType.chatReportMessage:
        return "chat.reportMessage";
      case RestApiUrlType.chatFollowMessage:
        return "chat.followMessage";
      case RestApiUrlType.chatUnFollowMessage:
        return "chat.unfollowMessage";
      case RestApiUrlType.chatGetDeletedMessage:
        return "chat.getDeletedMessages";
      case RestApiUrlType.chatMessageReadReceipts:
        return "chat.getMessageReadReceipts";
      case RestApiUrlType.chatSyncThreadsList:
        return "chat.syncThreadsList";
      case RestApiUrlType.chatGetThreadsList:
        return "chat.getThreadsList";
      case RestApiUrlType.chatSyncThreadMessages:
        return "chat.syncThreadMessages";
      case RestApiUrlType.chatGetThreadMessages:
        return "chat.getThreadMessages";
      case RestApiUrlType.chatSendMessage:
        return "chat.sendMessage";
      case RestApiUrlType.chatGetPinnedMessages:
        return "chat.getPinnedMessages";
      case RestApiUrlType.chatGetMentionedMessages:
        return "chat.getMentionedMessages";
      case RestApiUrlType.chatGetStarredMessages:
        return "chat.getStarredMessages";
      case RestApiUrlType.chatGetSnippetedMessages:
        return "chat.getSnippetedMessages";
      case RestApiUrlType.chatSyncMessages:
        return "chat.syncMessages";
      case RestApiUrlType.channelsAddAll:
        return "channels.addAll";
      case RestApiUrlType.channelsAddModerator:
        return "channels.addModerator";
      case RestApiUrlType.channelsAddOwner:
        return "channels.addOwner";
      case RestApiUrlType.channelsAddLeader:
        return "channels.addLeader";
      case RestApiUrlType.channelsArchive:
        return "channels.archive";
      case RestApiUrlType.channelsModerators:
        return "channels.moderators";
      case RestApiUrlType.channelsClose:
        return "channels.close";
      case RestApiUrlType.channelsCreate:
        return "channels.create";
      case RestApiUrlType.channelsGetIntegrations:
        return "channels.getIntegrations";
      case RestApiUrlType.channelsHistory:
        return "channels.history";
      case RestApiUrlType.channelsInfo:
        return "channels.info";
      case RestApiUrlType.channelsInvite:
        return "channels.invite";
      case RestApiUrlType.channelsKick:
        return "channels.kick";
      case RestApiUrlType.channelsLeave:
        return "channels.leave";
      case RestApiUrlType.channelsList:
        return "channels.list";
      case RestApiUrlType.channelsListJoined:
        return "channels.list.joined";
      case RestApiUrlType.channelsOpen:
        return "channels.open";
      case RestApiUrlType.channelsRemoveModerator:
        return "channels.removeModerator";
      case RestApiUrlType.channelsRemoveOwner:
        return "channels.removeOwner";
      case RestApiUrlType.channelsRemoveLeader:
        return "channels.removeLeader";
      case RestApiUrlType.channelsRename:
        return "channels.rename";
      case RestApiUrlType.channelsSetDescription:
        return "channels.setDescription";
      case RestApiUrlType.channelsSetJoinCode:
        return "channels.setJoinCode";
      case RestApiUrlType.channelsSetPurpose:
        return "channels.setPurpose";
      case RestApiUrlType.channelsSetReadOnly:
        return "channels.setReadOnly";
      case RestApiUrlType.channelsSetTopic:
        return "channels.setTopic";
      case RestApiUrlType.channelsSetAnnouncement:
        return "channels.setAnnouncement";
      case RestApiUrlType.channelsFiles:
        return "channels.files";
      case RestApiUrlType.channelsSetType:
        return "channels.setType";
      case RestApiUrlType.channelsUnarchive:
        return "channels.unarchive";
      case RestApiUrlType.channelsRoles:
        return "channels.roles";
      case RestApiUrlType.channelsCounters:
        return "channels.counters";
      case RestApiUrlType.channelsJoin:
        return "channels.join";
      case RestApiUrlType.channelsMembers:
        return "channels.members";
      case RestApiUrlType.channelsDelete:
        return "channels.delete";
      case RestApiUrlType.channelsOnline:
        return "channels.online";
      case RestApiUrlType.channelsGetAllUserMentionsByChannel:
        return "channels.getAllUserMentionsByChannel";
      case RestApiUrlType.groupsAddAll:
        return "groups.addAll";
      case RestApiUrlType.groupsAddModerator:
        return "groups.addModerator";
      case RestApiUrlType.groupsAddOwner:
        return "groups.addOwner";
      case RestApiUrlType.groupsArchive:
        return "groups.archive";
      case RestApiUrlType.groupsClose:
        return "groups.close";
      case RestApiUrlType.groupsCreate:
        return "groups.create";
      case RestApiUrlType.groupsGetIntegrations:
        return "groups.getIntegrations";
      case RestApiUrlType.groupsHistory:
        return "groups.history";
      case RestApiUrlType.groupsInfo:
        return "groups.info";
      case RestApiUrlType.groupsInvite:
        return "groups.invite";
      case RestApiUrlType.groupsKick:
        return "groups.kick";
      case RestApiUrlType.groupsLeave:
        return "groups.leave";
      case RestApiUrlType.groupsList:
        return "groups.list";
      case RestApiUrlType.groupsOpen:
        return "groups.open";
      case RestApiUrlType.groupsRemoveModerator:
        return "groups.removeModerator";
      case RestApiUrlType.groupRemoveOwner:
        return "groups.removeOwner";
      case RestApiUrlType.groupsRename:
        return "groups.rename";
      case RestApiUrlType.groupsSetDescription:
        return "groups.setDescription";
      case RestApiUrlType.groupsSetPurpose:
        return "groups.setPurpose";
      case RestApiUrlType.groupsSetReadOnly:
        return "groups.setReadOnly";
      case RestApiUrlType.groupsSetTopic:
        return "groups.setTopic";
      case RestApiUrlType.groupsSetType:
        return "groups.setType";
      case RestApiUrlType.groupsUnarchive:
        return "groups.unarchive";
      case RestApiUrlType.groupsSetAnnouncement:
        return "groups.setAnnouncement";
      case RestApiUrlType.groupsFiles:
        return "groups.files";
      case RestApiUrlType.groupsRoles:
        return "groups.roles";
      case RestApiUrlType.groupsCounters:
        return "groups.counters";
      case RestApiUrlType.groupRemoveLeader:
        return "groups.removeLeader";
      case RestApiUrlType.groupsAddLeader:
        return "groups.addLeader";
      case RestApiUrlType.groupsDelete:
        return "groups.delete";
      case RestApiUrlType.groupsListAll:
        return "groups.listAll";
      case RestApiUrlType.groupsMembers:
        return "groups.members";
      case RestApiUrlType.groupsSetEncrypted:
        return "groups.setEncrypted";
      case RestApiUrlType.serverInfo:
        return "info";
      case RestApiUrlType.settings:
        return "settings";
      case RestApiUrlType.settingsPublic:
        return "settings.public";
      case RestApiUrlType.updateAdminSettings:
        return "settings";
      case RestApiUrlType.roomsUpload:
        return "rooms.upload";
      case RestApiUrlType.roomsSaveNotification:
        return "rooms.saveNotification";
      case RestApiUrlType.roomsSaveSettings:
        return "rooms.saveRoomSettings";
      case RestApiUrlType.roomsAdminRooms:
        return "rooms.adminRooms";
      case RestApiUrlType.roomsAdminRoomsGetRoom:
        return "rooms.adminRooms.getRoom";
      case RestApiUrlType.spotlight:
        return "spotlight";
      case RestApiUrlType.imClose:
        return "im.close";
      case RestApiUrlType.imCreate:
        return "im.create";
      case RestApiUrlType.imOpen:
        return "im.open";
      case RestApiUrlType.imSetTopic:
        return "im.setTopic";
      case RestApiUrlType.imHistory:
        return "im.history";
      case RestApiUrlType.imFiles:
        return "im.files";
      case RestApiUrlType.imDelete:
        return "im.delete";
      case RestApiUrlType.imMessages:
        return "im.messages";
      case RestApiUrlType.imMembers:
        return "im.members";
      case RestApiUrlType.loadEmojiCustom:
        return "emoji-custom.list";
      case RestApiUrlType.emojiCustomDelete:
        return "emoji-custom.delete";
      case RestApiUrlType.emojiCustomCreate:
        return "emoji-custom.create";
      case RestApiUrlType.emojiCustomUpdate:
        return "emoji-custom.update";
      case RestApiUrlType.emojiCustomAll:
        return "emoji-custom.all";
      case RestApiUrlType.subscriptionsRead:
        return "subscriptions.read";
      case RestApiUrlType.subscriptionsUnRead:
        return "subscriptions.unread";
      case RestApiUrlType.roomsGet:
        return "rooms.get";
      case RestApiUrlType.roomsFavorite:
        return "rooms.favorite";
      case RestApiUrlType.roomsCleanHistory:
        return "rooms.cleanHistory";
      // since 1.0.0
      case RestApiUrlType.roomsCreateDiscussion:
        return "rooms.createDiscussion";
      case RestApiUrlType.roomsGetDiscussions:
        return "rooms.getDiscussions";

      // since 3.8.0
      case RestApiUrlType.roomsExport:
        return "rooms.export";
      case RestApiUrlType.roomsChangeArchivactionState:
        return "rooms.changeArchivationState";
      // since 0.72 ? Need to implement it
      case RestApiUrlType.roomsInfo:
        return "rooms.info";
      case RestApiUrlType.roomsLeave:
        return "rooms.leave";
      // Since 5.4.0
      case RestApiUrlType.roomsDelete:
        return "rooms.delete";

      //
      case RestApiUrlType.forgotPassword:
        return "users.forgotPassword";
      case RestApiUrlType.commandsList:
        return "commands.list";
      case RestApiUrlType.commandsGet:
        return "commands.get";
      case RestApiUrlType.commandsRun:
        return "commands.run";
      case RestApiUrlType.commandsPreview:
        return "commands.preview";
      case RestApiUrlType.e2EfetchMyKeys:
        return "e2e.fetchMyKeys";
      case RestApiUrlType.e2EupdateGroupKey:
        return "e2e.updateGroupKey";

      case RestApiUrlType.e2ESetRoomKeyID:
        return "e2e.setRoomKeyID";
      case RestApiUrlType.e2ESetUserPublicAndPrivateKeys:
        return "e2e.setUserPublicAndPrivateKeys";
      case RestApiUrlType.e2EGetusersOfRoomWithoutKey:
        return "e2e.getUsersOfRoomWithoutKey";
      case RestApiUrlType.e2ERequestSubscriptionKeys:
        return "e2e.requestSubscriptionKeys";
      case RestApiUrlType.e2EResetOwnE2EKey:
        return "e2e.resetOwnE2EKey";

      case RestApiUrlType.rolesList:
        return "roles.list";
      case RestApiUrlType.rolesCreate:
        return "roles.create";
      case RestApiUrlType.rolesSync:
        return "roles.sync";
      case RestApiUrlType.rolesUpdate:
        return "roles.update";
      case RestApiUrlType.rolesGetusersInRole:
        return "roles.getUsersInRole";
      case RestApiUrlType.rolesAddUserToRole:
        return "roles.addUserToRole";
      case RestApiUrlType.rolesRemoveUserFromRole:
        return "roles.removeUserFromRole";

      case RestApiUrlType.rolesDelete:
        return "roles.delete";

      case RestApiUrlType.videoConfJitsi:
        return "video-conference/jitsi.update-timeout";

      case RestApiUrlType.autoTranslateGetSupportedLanguages:
        return "autotranslate.getSupportedLanguages";
      case RestApiUrlType.autoTranslateSaveSettings:
        return "autotranslate.saveSettings";
      case RestApiUrlType.autoTranslateTranslateMessage:
        return "autotranslate.translateMessage";

      case RestApiUrlType.customUserStatusList:
        return "custom-user-status.list";
      case RestApiUrlType.customUserStatusCreate:
        return "custom-user-status.create";
      case RestApiUrlType.customUserStatusDelete:
        return "custom-user-status.delete";
      case RestApiUrlType.customUserStatusUpdate:
        return "custom-user-status.update";

      case RestApiUrlType.customSoundsList:
        return "custom-sounds.list";
      case RestApiUrlType.findOrCreateInvite:
        return "findOrCreateInvite";
      case RestApiUrlType.listInvites:
        return "listInvites";
      case RestApiUrlType.removeInvite:
        return "removeInvite";
      case RestApiUrlType.useInviteToken:
        return "useInviteToken";
      case RestApiUrlType.validateInviteToken:
        return "validateInviteToken";
      case RestApiUrlType.sendInvitationEmails:
        return "sendInvitationEmail";
      case RestApiUrlType.roomsAutocompleteChannelAndPrivate:
        return "rooms.autocomplete.channelAndPrivate";
      case RestApiUrlType.users2FASendEmailCode:
        return "users.2fa.sendEmailCode";
      case RestApiUrlType.users2FAEnableEmail:
        return "users.2fa.enableEmail";
      case RestApiUrlType.users2FADisableEmail:
        return "users.2fa.disableEmail";

      case RestApiUrlType.usersDeleteOwnAccount:
        return "users.deleteOwnAccount";
      case RestApiUrlType.usersSetPreferences:
        return "users.setPreferences";
      case RestApiUrlType.permissionsListAll:
        return "permissions.listAll";
      case RestApiUrlType.permissionsUpdate:
        return "permissions.update";
      case RestApiUrlType.statistics:
        return "statistics";
      case RestApiUrlType.directory:
        return "directory";

      case RestApiUrlType.teamsList:
        return "teams.list";
      case RestApiUrlType.teamsListAll:
        return "teams.listAll";
      case RestApiUrlType.teamsCreate:
        return "teams.create";
      case RestApiUrlType.teamsAddRooms:
        return "teams.addRooms";
      case RestApiUrlType.teamsRemoveRoom:
        return "teams.removeRoom";
      case RestApiUrlType.teamsUpdateRoom:
        return "teams.updateRoom";
      case RestApiUrlType.teamsListRooms:
        return "teams.listRooms";
      case RestApiUrlType.teamsListRoomsOfUsers:
        return "teams.listRoomsOfUser";
      case RestApiUrlType.teamsMembers:
        return "teams.members";
      case RestApiUrlType.teamsAddMembers:
        return "teams.addMembers";
      case RestApiUrlType.teamsUpdateMember:
        return "teams.updateMember";
      case RestApiUrlType.teamsRemoveMember:
        return "teams.removeMember";
      case RestApiUrlType.teamsLeave:
        return "teams.leave";
      case RestApiUrlType.teamsInfo:
        return "teams.info";
      case RestApiUrlType.teamsDelete:
        return "teams.delete";
      case RestApiUrlType.teamsAutocomplete:
        return "teams.autocomplete";
      case RestApiUrlType.teamsConvertToChannel:
        return "teams.convertToChannel";
      case RestApiUrlType.roomsAutocompleteAvailableForTeams:
        return "rooms.autocomplete.availableForTeams";
      case RestApiUrlType.channelsConvertToTeam:
        return "channels.convertToTeam";
      case RestApiUrlType.groupsConvertToTeam:
        return "groups.convertToTeam";
      case RestApiUrlType.stdoutQueue:
        return "stdout.queue";
      case RestApiUrlType.oauthAppsList:
        return "oauth-apps.list";
      case RestApiUrlType.oauthAppsGet:
        return "oauth-apps.get";
      case RestApiUrlType.oauthAppsCreate:
        return "oauth-apps.create";
      case RestApiUrlType.oauthAppsUpdate:
        return "oauth-apps.update";
      case RestApiUrlType.oauthAppsDelete:
        return "oauth-apps.delete";

      case RestApiUrlType.settingsOauth:
        return "settings.oauth";
      case RestApiUrlType.settingsAddCustomOauth:
        return "settings.addCustomOAuth";

      case RestApiUrlType.licensesGet:
        return "licenses.get";
      case RestApiUrlType.licensesMaxActiveusers:
        return "licenses.maxActiveUsers";
      case RestApiUrlType.licensesAdd:
        return "licenses.add";
      case RestApiUrlType.licensesIsEntreprise:
        return "licenses.isEnterprise";
      case RestApiUrlType.licensesInfo:
        return "licenses.info";

      case RestApiUrlType.bannersDismiss:
        return "banners.dismiss";
      case RestApiUrlType.banners:
        return "banners";

      // RC 5.0
      case RestApiUrlType.sessionsList:
        return "sessions/list";
      case RestApiUrlType.sessionsInfo:
        return "sessions/info";
      case RestApiUrlType.sessionsListAll:
        return "sessions/list.all";
      case RestApiUrlType.sessionsLogoutMe:
        return "sessions/logout.me";
      case RestApiUrlType.sessionsLogout:
        return "sessions/logout";
      case RestApiUrlType.sessionsInfoAdmin:
        return "sessions/info.admin";

      case RestApiUrlType.userRequestDataDownload:
        return "users.requestDataDownload";

      case RestApiUrlType.videoConferenceStart:
        return "video-conference.start";
      case RestApiUrlType.videoConferenceJoin:
        return "video-conference.join";
      case RestApiUrlType.videoConferenceCancel:
        return "video-conference.cancel";
      case RestApiUrlType.videoConferenceInfo:
        return "video-conference.info";
      case RestApiUrlType.videoConferenceList:
        return "video-conference.list";
      case RestApiUrlType.videoConferenceProviders:
        return "video-conference.providers";
      case RestApiUrlType.videoConferenceCapabilities:
        return "video-conference.capabilities";
      case RestApiUrlType.moderationReportsByusers:
        return "moderation.reportsByUsers";
      case RestApiUrlType.moderationDismissReports:
        return "moderation.dismissReports";
      case RestApiUrlType.moderationUserReportedMessages:
        return "moderation.user.reportedMessages";
      case RestApiUrlType.moderationUserDeleteReportedMessages:
        return "moderation.user.deleteReportedMessages";
      case RestApiUrlType.moderationReports:
        return "moderation.reports";
      case RestApiUrlType.moderationReportInfo:
        return "moderation.reportInfo";
      case RestApiUrlType.moderationUserReports:
        return "moderation.userReports";
      case RestApiUrlType.moderationUserReportsByUserId:
        return "moderation.user.reportsByUserId";
      case RestApiUrlType.moderationDismissUserReports:
        return "moderation.dismissUserReports";
      case RestApiUrlType.moderationReportUser:
        return "moderation.reportUser";

      case RestApiUrlType.roomsNameExists:
        return "rooms.nameExists";
      case RestApiUrlType.methodCall:
        return "method.call";
      case RestApiUrlType.methodCallAnon:
        return "method.callAnon";
      case RestApiUrlType.appsUiInteraction:
        return "ui.interaction";

      case RestApiUrlType.usersLogoutOtherClients:
        return "users.logoutOtherClients";

      // 6.8.0
      case RestApiUrlType.roomsMuteUser:
        return "rooms.muteUser";
      case RestApiUrlType.roomsUnmuteUser:
        return "rooms.unmuteUser";

      case RestApiUrlType.featuredApps:
        return "featured-apps";
      case RestApiUrlType.categoriesApps:
        return "categories";
      case RestApiUrlType.countApps:
        return "count";
      case RestApiUrlType.notifyAdminsApps:
        return "notify-admins";
      case RestApiUrlType.installedApps:
        return "installed";
      case RestApiUrlType.marketplaceApps:
        return "marketplace";

      case RestApiUrlType.usersListByStatus:
        return "users.listByStatus";

      case RestApiUrlType.usersSendWelcomeEmail:
        return "users.sendWelcomeEmail";

      case RestApiUrlType.roomsImages:
        return "rooms.images";
      case RestApiUrlType.roomsMembersOrderedByRole:
        return "rooms.membersOrderedByRole";
    }
  }
}

String adaptUrl(String url) {
  if (url.isEmpty) {
    return url;
  }
  // Avoid to add more https:// :)
  if (url.startsWith("https://") || url.startsWith("http://")) {
    return url;
  } else {
    // Default to https
    return "https://$url";
  }
}

Uri generateUrl(String serverUrl, RestApiUrlType type,
    [RestApiUrlExtensionType restApiUrlExtensionType =
        RestApiUrlExtensionType.v1,
    String urlExtension = ""]) {
  if (serverUrl.isEmpty) {
    return Uri();
  }
  String urlStr =
      adaptUrl(serverUrl) + restApiUrlExtensionType.path + type.name;
  if (urlExtension.isNotEmpty) {
    if (type.name.isNotEmpty) {
      urlStr += '/';
    }
    urlStr += urlExtension;
  }
  return Uri.parse(urlStr);
}
