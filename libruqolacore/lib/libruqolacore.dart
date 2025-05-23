/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

library libruqolacore;

export 'src/fileattachment.dart';
export 'src/file.dart';
export 'src/user.dart';
export 'src/message/message.dart';
export 'src/room.dart';
export 'src/accountsettings.dart';
export 'src/rocketchataccount.dart';
export 'src/rocketchataccountmodels.dart';

// Ownuser
export 'src/ownuser/ownuserpreferences.dart';
export 'src/ownuser/ownuser.dart';
export 'src/ownuser/servicepassword.dart';

// Message
export 'src/message/messageattachmentfield.dart';
export 'src/message/messageattachment.dart';
export 'src/message/reaction.dart';
export 'src/message/messageurl.dart';
export 'src/message/replies.dart';
export 'src/message/blocks/block.dart';
export 'src/message/blocks/blockaction.dart';
export 'src/message/blocks/blockaccessory.dart';
export 'src/message/blocks/blockaccessoryoption.dart';
export 'src/message/messagepinned.dart';
export 'src/message/messagestarred.dart';
export 'src/message/channel.dart';
export 'src/message/messagetranslations.dart';

export 'src/retentioninfo.dart';
export 'src/notificationinfo.dart';

// Systemtray
export 'src/systemtray/desktop.dart';

// Typing notification
export 'src/receivertypingnotification.dart';

export 'src/ruqolaserverconfigpassword.dart';
export 'src/ruqolaserverconfig.dart';

// Roles
export 'src/roles/role.dart';
export 'src/roles/roles.dart';
export 'src/roles/roleinfo.dart';
export 'src/roles/rolesmodel.dart';

// Manager
export 'src/manager/licensesmanager.dart';
export 'src/manager/accountmanager.dart';
export 'src/manager/permissionmanager.dart';

export 'src/managedevices/deviceinfo.dart';
export 'src/managedevices/deviceinfos.dart';

// Commands
export 'src/commands/command.dart';
export 'src/commands/commands.dart';
export 'src/commands/previewcommand.dart';
export 'src/commands/previewcommandutil.dart';
export 'src/commands/commandmodel.dart';

// PersonalAccessTokens
export 'src/personalaccesstokens/personalaccesstokeninfo.dart';
export 'src/personalaccesstokens/personalaccesstokeninfos.dart';

// Banner
export 'src/bannerinfos/bannerinfo.dart';
export 'src/bannerinfos/bannerinfos.dart';

// Team
export 'src/teams/teaminfo.dart';
export 'src/teams/teamroom.dart';
export 'src/teams/teamcompleter.dart';
export 'src/teams/teamroomcompleter.dart';

// avatarutil
export 'src/avatarinfo.dart';

// Secure Storage
export 'src/secure_storage/credentials.dart';
export 'src/secure_storage/secure_storage.dart';

// downloadappslanguages
export 'src/downloadappslanguages/downloadappslanguagesinfo.dart';

// status
export 'src/status/statusmodel.dart';
export 'src/status/customuserstatus.dart';
export 'src/status/customuserstatusmodel.dart';

// Invitation
export 'src/invitations/invitation.dart';
export 'src/invitations/invitations.dart';

// Emoji
export 'src/emoticons/customemoji.dart';

// Discussions
export 'src/discussions/discussion.dart';

// Error
export 'src/errornotification.dart';
