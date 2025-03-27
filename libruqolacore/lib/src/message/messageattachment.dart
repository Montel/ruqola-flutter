/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/src/message/messageattachmentfield.dart';

enum AttachmentType {
  unknown,
  normalText,
  file,
  video,
  audio,
  image,
}

class Messageattachment {
  Messageattachment();
  factory Messageattachment.fromJson(Map<String, dynamic> json) {
    Messageattachment att = Messageattachment();
    att.mDescription = json["description"];
    att.mTitle = json["title"];
    att.mText = json["text"];
    att.mLink = json["url"];
    att.mImageUrlPreview = json["image_preview"];
    att.mAuthorName = json["authorname"];
    att.mAuthorIcon = json["authoricon"];
    att.mMimeType = json["mimetype"];
    att.mColor = json["color"];
    att.mAttachmentSize = json.containsKey("attachment_size") ? json["attachment_size"] : -1;
    att.mImageHeight = json.containsKey("image_height") ? json["image_height"] : -1;
    att.mImageWidth = json.containsKey("image_width") ? json["image_width"] : -1;
    att.mCollapsed = json["collapsed"];
    att.mShowAttachment = json["show_attachment"];
/*
    // TODO
    const QJsonArray fieldsArray = json["fields"_L1).toArray();
    QList<MessageAttachmentField> messageFields;
    messageFields.reserve(fieldsArray.size());
    for (int i = 0, total = fieldsArray.size(); i < total; ++i) {
        messageFields.append(MessageAttachmentField::deserialize(fieldsArray.at(i).toObject()));
    }
    att.setAttachmentFields(messageFields);
    att.setAttachmentType(o["attachmentType"_L1].toVariant().value<AttachmentType>());
    // att.generateTitle();
*/

    return att;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    if (mDescription != null && mDescription!.isEmpty) {
      json["description"] = mDescription;
    }
    if (mTitle != null && mTitle!.isEmpty) {
      json["title"] = mTitle;
    }
    json["url"] = mLink;

    if (mImageUrlPreview != null && mImageUrlPreview!.isEmpty) {
      json["image_preview"] = mImageUrlPreview;
    }
    // TODO
    /*

    const QString authorname = messageAttach.authorName();
    if (!authorname.isEmpty()) {
        obj["authorname"_L1] = authorname;
    }
    const QString authorIcon = messageAttach.authorIcon();
    if (!authorIcon.isEmpty()) {
        obj["authoricon"_L1] = authorIcon;
    }
    const QString mimeType = messageAttach.mimeType();
    if (!mimeType.isEmpty()) {
        obj["mimetype"_L1] = mimeType;
    }
    if ((messageAttach.imageHeight() != -1) && (messageAttach.imageWidth() != -1)) {
        obj["image_height"_L1] = messageAttach.imageHeight();
        obj["image_width"_L1] = messageAttach.imageWidth();
    }
    const QString color = messageAttach.color();
    if (!color.isEmpty()) {
        obj["color"_L1] = color;
    }
    const QString text = messageAttach.text();
    if (!text.isEmpty()) {
        obj["text"_L1] = text;
    }
    if (messageAttach.attachmentSize() != -1) {
        obj["attachment_size"_L1] = messageAttach.attachmentSize();
    }

    QJsonArray fieldArray;
    for (int i = 0, total = messageAttach.attachmentFields().count(); i < total; ++i) {
        const QJsonObject fields = MessageAttachmentField::serialize(messageAttach.attachmentFields().at(i));
        fieldArray.append(std::move(fields));
    }
    if (!fieldArray.isEmpty()) {
        obj["fields"_L1] = fieldArray;
    }
    if (messageAttach.collapsed()) {
        obj["collapsed"_L1] = true;
    }
    obj["attachmentType"_L1] = QJsonValue::fromVariant(QVariant::fromValue<MessageAttachment::AttachmentType>(messageAttach.attachmentType()));
    if (bool show = messageAttach.showAttachment()) {
        obj["show_attachment"_L1] = show;
    }
    return obj;
}*/
    return json;
  }

  List<MessageAttachmentField>? mAttachmentFields;
  AttachmentType mAttachmentType = AttachmentType.unknown;
  String? mColor;
  String? mDescription;
  String? mTitle;
  String? mLink;
  String? mAuthorName;
  String? mMimeType;
  String? mText;
  String? mAttachmentId;
  String? mAuthorIcon;
  String? mAttachmentFieldsText;
  String? mImageUrlPreview;
  String? mAttachmentGeneratedTitle;
  int mAttachmentSize = -1;
  int mImageHeight = -1;
  int mImageWidth = -1;
  bool mIsAnimatedImage = false;
  bool mCollapsed = false;
  bool mShowAttachment = false;

  @override
  String toString() {
    return """
Messageattachment(mAttachmentFields: $mAttachmentFields mAttachmentType: $mAttachmentType mColor: $mColor 
mDescription: $mDescription mTitle:$mTitle mLink: $mLink mAuthorName:$mAuthorName
mMimeType: $mMimeType mText:$mText mAttachmentId:$mAttachmentId mAuthorIcon:$mAuthorIcon
mAttachmentFieldsText: $mAttachmentFieldsText mImageUrlPreview:$mImageUrlPreview
mAttachmentGeneratedTitle: $mAttachmentGeneratedTitle mAttachmentSize:$mAttachmentSize
mImageHeight: $mImageHeight mImageWidth:$mImageWidth mIsAnimatedImage:$mIsAnimatedImage
mCollapsed: $mCollapsed mShowAttachment:$mShowAttachment)
""";
  }
}
