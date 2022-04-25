class PageResponse {
  final Parse parse;

  PageResponse({required this.parse});

  factory PageResponse.fromJson(Map<String, dynamic> json) => PageResponse(
        parse: Parse.fromJson(
          json['parse'],
        ),
      );

  Map<String, dynamic> toJson() => {
        "parse": parse.toJson(),
      };
}

class Parse {
  Parse({
    required this.title,
    required this.pageid,
    required this.revid,
    required this.text,
  });

  String title;
  int pageid;
  int revid;
  Content text;

  factory Parse.fromJson(Map<String, dynamic> json) => Parse(
        title: json['title'],
        pageid: json['pageid'],
        revid: json['revid'],
        text: Content.fromJson(json['text']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'pageid': pageid,
        'revid': revid,
        'text': text.toJson(),
      };
}

class Content {
  Content({required this.content});

  String content;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        content: json['*'],
      );

  Map<String, dynamic> toJson() => {
        '*': content,
      };
}
