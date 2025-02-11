/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

class Reaction {
  String? mReactionName;
  List<String>? mUserNames;

  void parseReactions(Map<String, dynamic> json) {
    // TODO
    /*
    mReactions.clear();
    const QStringList lst = reacts.keys();
    QStringList users;
    for (const QString &str : lst) {
        users.clear();
        const QJsonObject obj = reacts.value(str).toObject();
        const QJsonValue usernames = obj.value("usernames"_L1);
        if (!usernames.isUndefined()) {
            const QJsonArray array = usernames.toArray();
            for (int i = 0; i < array.count(); ++i) {
                users.append(array.at(i).toString());
            }
            if (!users.isEmpty()) {
                Reaction r;
                r.setReactionName(str, emojiManager);
                r.setUserNames(users);
                mReactions.append(std::move(r));
            }
        }
    }
    */
  }
  @override
  String toString() {
    return "Reaction(mReactionName: $mReactionName mUserNames: $mUserNames)";
  }
}
