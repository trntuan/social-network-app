class ConstPathPost {
  static const register = 'user/register';

  static const login = 'auth/user';

  static const postNewLetter = 'post';
  static const postComment = 'post/comment';

  static const likePost = 'post/like';
  static const chat = 'chat';
  static const sendMessage = 'chat/message';
  static const addFriend = 'user/add_friend';
  static const confirmFriend = 'user/confirm_friend';
  static const cancelFriend = 'user/cancel_friend';

  static const outTeam = 'team/out_team';
  static const joinTeam = 'team/join_team';
}

class ConstPathGet {
  static const allMyPosts = 'post/all_my_post';
  static const allUserPostList = 'post/user_post_list';

  static const allTeam = 'team/all';
  static const allPosts = 'post/all_posts_personal';
  static const postDetail = 'post/detail_personal';
  static const commentPost = 'post/comment';
  static const chat = 'chat';

  static const historyChat = 'chat/history';

  static const myDetail = 'user/my_detail';
  static const userDetail = 'user/user_detail';

  static const friendRecommend = 'user/friend_recommend';
  static const myfriend = 'user/friend_list_auth';
  static const friendSentToYou = 'user/friend_sent_to_you';
  static const friendYouSent = 'user/friend_you_sent';

  //team
  static const myTeam = 'team/my_teams_user';
  static const teamRecommend = 'team/teams_recomend';
}
