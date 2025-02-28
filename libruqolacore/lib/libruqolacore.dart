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
export 'src/ownuserpreferences.dart';

// Message
export 'src/message/messageattachmentfield.dart';
export 'src/message/messageattachment.dart';
export 'src/message/reaction.dart';
export 'src/message/messageurl.dart';
export 'src/message/replies.dart';
export 'src/message/blocks/blockaction.dart';

export 'src/retentioninfo.dart';
export 'src/notificationinfo.dart';

// Systemtray
export 'src/systemtray/desktop.dart';

// Typing notification
export 'src/receivertypingnotification.dart';

export 'src/ruqolaserverconfigpassword.dart';
export 'src/ruqolaserverconfig.dart';

export 'src/roles/role.dart';
export 'src/roles/roles.dart';
export 'src/roles/roleinfo.dart';

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

// PersonalAccessTokens
export 'src/personalaccesstokens/personalaccesstokeninfo.dart';
export 'src/personalaccesstokens/personalaccesstokeninfos.dart';

// Banner
export 'src/bannerinfos/bannerinfo.dart';
export 'src/bannerinfos/bannerinfos.dart';

// Team
export 'src/teams/teaminfo.dart';

// avatarutil
export 'src/avatarinfo.dart';

// Secure Storage
export 'src/secure_storage/credentials.dart';
export 'src/secure_storage/secure_storage.dart';
