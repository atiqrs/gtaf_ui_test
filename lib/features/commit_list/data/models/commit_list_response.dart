class CommitListResponse {
  late String sha;
  late String nodeId;
  late Commit commit;
  late String url;
  late String htmlUrl;
  late String commentsUrl;
  late Author author;
  late Author committer;
  late List<Parents> parents;

  CommitListResponse({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  CommitListResponse.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit = (json['commit'] != null ? Commit.fromJson(json['commit']) : null)!;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author = (json['author'] != null ? Author.fromJson(json['author']) : null)!;
    committer = (json['committer'] != null ? Author.fromJson(json['committer']) : null)!;
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents.add(Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sha'] = sha;
    data['node_id'] = nodeId;
    data['commit'] = commit.toJson();
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['comments_url'] = commentsUrl;
    data['author'] = author.toJson();
    data['committer'] = committer.toJson();
    data['parents'] = parents.map((v) => v.toJson()).toList();
    return data;
  }
}

class Commit {
  late CAuthor author;
  late CAuthor committer;
  late String message;
  late Tree tree;
  late String url;
  late int commentCount;
  late Verification verification;

  Commit({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  Commit.fromJson(Map<String, dynamic> json) {
    author = (json['author'] != null ? CAuthor.fromJson(json['author']) : null)!;
    committer = (json['committer'] != null ? CAuthor.fromJson(json['committer']) : null)!;
    message = json['message'];
    tree = (json['tree'] != null ? Tree.fromJson(json['tree']) : null)!;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = (json['verification'] != null ? Verification.fromJson(json['verification']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author.toJson();
    data['committer'] = committer.toJson();
    data['message'] = message;
    data['tree'] = tree.toJson();
    data['url'] = url;
    data['comment_count'] = commentCount;
    data['verification'] = verification.toJson();
    return data;
  }
}

class CAuthor {
  late String name;
  late String email;
  late String date;

  CAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  CAuthor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['date'] = date;
    return data;
  }
}

class Tree {
  late String sha;
  late String url;

  Tree({required this.sha, required this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sha'] = sha;
    data['url'] = url;
    return data;
  }
}

class Verification {
  late bool verified;
  late String reason;
  late String signature;
  late String payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
    signature = json['signature'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verified'] = verified;
    data['reason'] = reason;
    data['signature'] = signature;
    data['payload'] = payload;
    return data;
  }
}

class Author {
  late String login;
  late int id;
  late String nodeId;
  late String avatarUrl;
  late String gravatarId;
  late String url;
  late String htmlUrl;
  late String followersUrl;
  late String followingUrl;
  late String gistsUrl;
  late String starredUrl;
  late String subscriptionsUrl;
  late String organizationsUrl;
  late String reposUrl;
  late String eventsUrl;
  late String receivedEventsUrl;
  late String type;
  late bool siteAdmin;

  Author({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  Author.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    return data;
  }
}

class Parents {
  late String sha;
  late String url;
  late String htmlUrl;

  Parents({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  Parents.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sha'] = sha;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    return data;
  }
}
