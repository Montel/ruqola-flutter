/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
library;

export 'src/restapiutils.dart';
export 'src/restapiabstractjob.dart';
export 'src/queryparameter.dart';
export 'src/exceptions/exception.dart';

// license
export 'src/licenses/licensesinfo.dart';
export 'src/licenses/licenseslist.dart';

// chats
export 'src/chats/deletemessage.dart';
export 'src/chats/followmessage.dart';
export 'src/chats/unfollowmessage.dart';
export 'src/chats/ignoreuser.dart';
export 'src/chats/searchmessages.dart';
export 'src/chats/starmessage.dart';
export 'src/chats/pinmessage.dart';
export 'src/chats/reportmessage.dart';
export 'src/chats/reactonmessage.dart';

// Authentication
export 'src/authentication/login.dart';
export 'src/authentication/logout.dart';

// misc
export 'src/misc/methodcall.dart';
export 'src/misc/roleslist.dart';
export 'src/misc/directory.dart';
export 'src/misc/owninfo.dart';

// rooms
export 'src/rooms/roomsimages.dart';
export 'src/rooms/roomsdelete.dart';
export 'src/rooms/roomsmuteuser.dart';
export 'src/rooms/roomsunmuteuser.dart';
export 'src/rooms/roomsleave.dart';
export 'src/rooms/roomsfavorite.dart';
export 'src/rooms/roomsnamexists.dart';
export 'src/rooms/roomsinfo.dart';
export 'src/rooms/getrooms.dart';
export 'src/rooms/roomscleanhistory.dart';
export 'src/rooms/getdiscussions.dart';

// invite
export 'src/invite/validateinvitetoken.dart';
export 'src/invite/useinvitetoken.dart';
export 'src/invite/listinvite.dart';
export 'src/invite/removeinvite.dart';

// User
export 'src/users/userinfo.dart';
export 'src/users/forgotpassword.dart';
export 'src/users/resettotp.dart';

// Command
export 'src/commands/listcommands.dart';
export 'src/commands/runcommand.dart';

// Channel
export 'src/channels/channelclose.dart';

//Banner
export 'src/banner/bannerdismiss.dart';

// 2FA
export 'src/2fa/user2fadisableemail.dart';

// personalaccesstoken
export 'src/personalaccesstoken/generatepersonalaccesstoken.dart';
export 'src/personalaccesstoken/regeneratepersonalaccesstoken.dart';

// Sessions
export 'src/sessions/sessionslist.dart';
export 'src/sessions/sessionslogoutme.dart';

// settings
export 'src/settings/privateinfo.dart';
export 'src/settings/publicsettings.dart';

// subscriptions
export 'src/subscriptions/markroomasread.dart';

// role
export 'src/roles/addusertorole.dart';
export 'src/roles/roledelete.dart';
export 'src/roles/removeuserfromrole.dart';

// team
export 'src/teams/teaminfo.dart';
export 'src/teams/teamleaveroom.dart';
export 'src/teams/teamslistrooms.dart';
export 'src/teams/teamupdateroom.dart';
export 'src/teams/teamsautocomplete.dart';
export 'src/teams/teamremoveroom.dart';
