import CommentItem from '../viewmodel/CommentItem'
import Song from '../viewmodel/Song'

const comments:CommentItem[] = [
  new CommentItem(0,'永远跟你走',$r('app.media.QQimage1'),'其实很多事我都可以介意，只是习惯说没关系',$r('app.media.comment1'),new Song($r('app.media.song_img1'),'小尖尖','薛之谦','543','4214')),
  new CommentItem(1,'爱你没烦恼',$r('app.media.QQimage2'),'欲买桂花同载酒，终不似，少年游',$r('app.media.comment2'),new Song($r('app.media.song_img2'),'问心','南方的凯','423','4325')),
  new CommentItem(2,'海螺姑娘',$r('app.media.QQimage3'),'少年自负凌云笔，到而今，春花落尽，满怀萧瑟',$r('app.media.comment3'),new Song($r('app.media.song_img3'),'身骑白马','张杰','454','1231')),
  new CommentItem(3,'幼稚的小吴',$r('app.media.QQimage4'),'山有木兮木有枝，心悦君兮君不知',$r('app.media.comment4'),new Song($r('app.media.song_img4'),'做我老婆好不好','刘士鸣','798','455')),
  new CommentItem(4,'月落三千丈',$r('app.media.QQimage5'),'平君莫话封侯事，一将功成万骨枯',$r('app.media.comment5'),new Song($r('app.media.song_img5'),'算了','万妮达','456','7866')),
  new CommentItem(5,'睡觉睡觉',$r('app.media.QQimage6'),'春风得意马蹄疾，一日看尽长安花',$r('app.media.comment6'),new Song($r('app.media.song_img6'),'苦茶子','邵帅','464','1132')),
  new CommentItem(6,'煞风景',$r('app.media.QQimage7'),'今朝有酒今朝醉，明日愁来明日愁',$r('app.media.comment7'),new Song($r('app.media.song_img7'),'迷途羔羊','张震岳','43','424')),
  new CommentItem(7,'是否是',$r('app.media.QQimage8'),'少年不惧岁月长，彼方尚有荣光在',$r('app.media.comment8'),new Song($r('app.media.song_img8'),'单车','陈奕迅','543','9999')),

]
export {comments}