# Reply.destroy_all
# Rating.destroy_all
# Review.destroy_all
# RestaurantCuisine.destroy_all
# Cuisine.destroy_all
# Favorite.destroy_all
@comments = [
   "This Movie is pretty good. It was heart warming thought provoking and really made me think deeply about the human condition and what it means to be human. My eyes have never been this opened by a peice of media. I feel truely awakened.",

  "Pirates are evil? The Marines are righteous? These terms have always changed throughout the course of history! Kids who have never seen peace and kids who have never seen war have different values! Those who stand at the top determine what's wrong and what's right! This very place is neutral ground! Justice will prevail, you say? But of course it will! Whoever wins this war becomes justice!",

  "Once, the Lord of Light banished Dark, and all that stemmed from humanity. And men assumed a fleeting form. These are the roots of our world. Men are props on the stage of life, and no matter how tender, how exquisite... A lie will remain a lie!",

  "I may be but small, but I will die a colossus.",

  "The dragons shall never be forgotten… We knights fought valiantly, but for every one of them, we lost three score of our own. Exhiliration, pride, hatred, rage… The dragons teased out our dearest emotions. ... Thou will understand, one day. At thy twilight, old thoughts return, in great waves of nostalgia",

  "Brother, unyielding sword of Lothric's Prince. Rise, if you would... For that is our curse",

  "I love heroes, but I don't want to be one. Do you even know what a hero is!? For example, you have some meat. Pirates will feast on the meat, but the hero will distribute it among the people! I want to eat the meat",

  "Don't ever think there's any perfect society made by humans!! If you think that way you'll overlook the enemy!! Don't be fooled by appearances!!",

  "If I can't even protect my captain's dream, then whatever ambition I have is nothing but talk! Luffy must be the man who becomes the Pirate King!",

  "Compared to the 'righteous' greed of the rulers, the criminals of the world seem much more honorable. When scum rules the world, only more scum is born.",

  "When do you think people die? When they are shot through the heart by the bullet of a pistol? No. When they are ravaged by an incurable disease? No... It’s when they're forgotten!",

  "The cake is a lie",

  "A man chooses! A slave obeys!",

  "What do the numbers mean, Mason?",

  "Tonight, Gehrman join the hunt",

  "Farewell, good Hunter. May you find your worth in the waking world.",

  "Curse here, Curse there. Curse for he and she, why care? A bottomless curse, a bottomless sea, source of all greatness, all things that be. Listen for the baneful chants. Weep with them, as one in trance. And weep with us, oh, weep with us.",

  "Hunters have told me about the church. About the gods, and their love. But... do the gods love their creations? I am a doll, created by you humans. Would you ever think to love me? Of course... I do love you. Isn't that how you've made me?",

  "Die! Die, die! Hunters are killers, nothing less! You call ME a beast? A Beast!? What would you know? I didn't ask for this!",

  "Acts of goodness are not always wise, and acts of evil are not always foolish, but regardless, we shall always strive to be good.",

  "Again and again, it never ends...Please, I need you to do something...this village is the true secret. Testament to the old sins. It feeds this Hunter's nightmare...Please, bring an end to the horror. So our forefathers sinned? We hunters cannot bear their weight forever...it isn't fair...it just isn't fair.",

  "Do you know why the Hunters are drawn to this Nightmare? Because it sprouted from their very misdeeds. Things that some would rather keep secret. A pitiful tale of petty arrogance, really."
 ]
@titles = [
   "That restaurant was totally tubular",
   "Thats gonna be a yikes from me",
   "You either yeet or get yeeted",
   "Bruce Wayne Did nothing wrong",
   "Whats a pony my dude",
   "That was wickity wickity wack",
   "You'll never see it coming",
   "Some gansta is dissin' your flygirl",
   "Somebody once told me the world is gonna roll me",
   "What is america",
   "Who is america",
   "Why is america",
   "Language",
   "Thats my Secret Cap, im always Angry",
   "I lost the kid",
   "I don't feel so good Mr. Stark"
 ]
Reply.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

User.create(username:"admin", first_name: "admin", last_name:"admin", email:"admin@gmail.com", password:"admin", admin:true)
@disliker = User.create(username:"disliker", first_name: "disliker", last_name:"disliker", email:"disliker@gmail.com", password:"disliker")
@liker = User.create(username:"liker", first_name: "liker", last_name:"liker", email:"liker@gmail.com", password:"liker")
@favoriter = User.create(username:"favoriter", first_name: "favoriter", last_name:"favoriter", email:"favoriter@gmail.com", password:"favoriter")

def seed_posts
  (2..6).to_a.sample.times do
    Post.create(title: @titles.sample, message: @comments.sample, user: User.first)
  end
end

def seed_comments
  Post.all.each do |post|
    (2..6).to_a.sample.times do
      Comment.create(message: @comments.sample, user: User.first, post: post)
    end
  end
end

def seed_replies
  Comment.all.each do |comment|
    (2..4).to_a.sample.times do
      Reply.create(message: @comments.sample, user: User.first, comment: comment)
    end
  end
end

def seed_dislikes
  Post.all.each do |post|
    (0..1).to_a.sample.times do
      PostDislike.create(user: @disliker, post: post)
    end
  end
  Comment.all.each do |comment|
    (0..1).to_a.sample.times do
      CommentDislike.create(user: @disliker, comment: comment)
    end
  end
  Reply.all.each do |reply|
    (0..1).to_a.sample.times do
      ReplyDislike.create(user: @disliker, reply: reply)
    end
  end
end

def seed_likes
  Post.all.each do |post|
    (0..1).to_a.sample.times do
      PostLike.create(user: @liker, post: post)
    end
  end
  Comment.all.each do |comment|
    (0..1).to_a.sample.times do
      CommentLike.create(user: @liker, comment: comment)
    end
  end
  Reply.all.each do |reply|
    (0..1).to_a.sample.times do
      ReplyLike.create(user: @liker, reply: reply)
    end
  end
end

def seed_favorites
  Post.all.each do |post|
    (0..1).to_a.sample.times do
      PostFavorite.create(user: @favoriter, post: post)
    end
  end
  Comment.all.each do |comment|
    (0..1).to_a.sample.times do
      CommentFavorite.create(user: @favoriter, comment: comment)
    end
  end
  Reply.all.each do |reply|
    (0..1).to_a.sample.times do
      ReplyFavorite.create(user: @favoriter, reply: reply)
    end
  end
end

seed_posts
seed_comments
seed_replies
seed_dislikes
seed_likes
seed_favorites
