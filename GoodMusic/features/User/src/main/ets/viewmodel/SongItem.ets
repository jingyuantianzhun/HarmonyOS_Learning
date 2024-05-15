import SongItem from '../model/SongItem'
import {UserSong} from './UserSong'

const songs1:SongItem[] = [
  {id:1 ,image:$rawfile('../../resources/rawfile/zhimibuwu.jpg') ,name:'执迷不悟（伤感女声版）',typeDescription: '超清母带',author: 'Jessie熙熙',src:'zhimibuwu.mp3' ,index: 0,like:996,comment:669},
  {id:2 ,image:$rawfile('../../resources/rawfile/WILD.jpg') ,name:'WILD（0.8x）',typeDescription: '超清母带',author: 'XXXDAION - Side',src:'WILD.mp3' ,index: 1,like:1001,comment:569},
  {id:3 ,image:$rawfile('../../resources/rawfile/Avicii-Waiting For Love.jpg') ,name:'Avicii-Waiting For Love（Slowed）',typeDescription: '超清母带',author: 'AD_概 - By: Avicii-Waiting For Love',src:'Avicii-Waiting For Love（Slowed）.mp3' ,index: 2,like:666,comment:668},
  {id:4 ,image:$rawfile('../../resources/rawfile/jh.jpg') ,name:'句号',typeDescription: '超清母带',author: '木夕 - 句号',src:'juhao.mp3' ,index: 3,like:795,comment:463},
  {id:5 ,image:$rawfile('../../resources/rawfile/TimeMan.jpg') ,name:'TimeMan',typeDescription: '超清母带',author: '罗浩文BF - TimeMan',src: 'TimeMan.mp3' ,index: 4,like:956,comment:467},
  {id:6 ,image:$rawfile('../../resources/rawfile/The Greatest.jpg') ,name:'The Greatest',typeDescription: '超清母带',author: 'wildbeezy - The Greatest',src:'The Greatest.mp3' ,index: 5,like:456,comment:369},
  {id:7 ,image:$rawfile('../../resources/rawfile/Something Just Like This.jpg') ,name:'Something Just Like This',typeDescription: '超清母带',author: 'Asher - Something Just Like This',src:'Something Just Like This.mp3' ,index: 6,like:576,comment:269},
  {id:8 ,image:$rawfile('../../resources/rawfile/So Far Away.jpg') ,name:'So Far Away（Acoustic）',typeDescription: '超清母带',author: 'Adam Christopher - So Far Away',src:'So Far Allway.mp3' ,index: 7,like:596,comment:269},
  {id:9 ,image:$rawfile('../../resources/rawfile/ruobani.jpg') ,name:'若把你',typeDescription: '超清母带',author: 'Kirsty刘瑾睿 - 若把你',src:'ruobani.mp3' ,index: 8,like:596,comment:269},
  {id:10 ,image:$rawfile('../../resources/rawfile/Temple.jpg') ,name:'Temple（慢速版）',typeDescription: '超清母带',author: 'Liu/Zerky - Temple',src:'Template.mp3' ,index: 9,like:496,comment:169},
  {id:11 ,image:$rawfile('../../resources/rawfile/Drive My Car.jpg') ,name:'Drive My Car',typeDescription: '超清母带',author: 'DEAMN - Drive My Car',src:'Drive My Car.mp3' ,index: 10,like:1096,comment:463},
  {id:12 ,image:$rawfile('../../resources/rawfile/m1.jpg') ,name:'ロクデナシ',typeDescription: '超清母带',author: 'にんじん/ninzin',src:'m1.mp3' ,index: 11,like:396,comment:569},
  {id:13 ,image:$rawfile('../../resources/rawfile/m2.jpg') ,name:'ありがとう･･･ (カバー)',typeDescription: '超清母带',author: '磐田みゆき',src:'m2.mp3' ,index: 12,like:936,comment:469},
  {id:14 ,image:$rawfile('../../resources/rawfile/m3.jpg') ,name:'勾指起誓',typeDescription: '超清母带',author: '泠鸢yousa',src:'m3.mp3' ,index: 13,like:596,comment:269},
  {id:15 ,image:$rawfile('../../resources/rawfile/qifenle.jpg') ,name:'起风了',typeDescription: '超清母带',author: '买辣椒也用券',src:'qifenle.mp3' ,index: 14,like:396,comment:669},
  {id:16 ,image:$rawfile('../../resources/rawfile/xuanni.jpg') ,name:'悬溺',typeDescription: '超清母带',author: '葛东琪',src:'xuanni.mp3' ,index: 15,like:1096,comment:769},

]


const userSong1:UserSong[] = [
  new UserSong (1,$rawfile('../../resources/rawfile/zhimibuwu.jpg'),'执迷不悟（伤感女声版）','超清母带','Jessie熙熙','zhimibuwu.mp3',0,996,669,false),
  new UserSong (2 ,$rawfile('../../resources/rawfile/WILD.jpg') ,'WILD（0.8x）', '超清母带','XXXDAION - Side','WILD.mp3' , 1,1001,569,true),
  new UserSong (3 ,$rawfile('../../resources/rawfile/Avicii-Waiting For Love.jpg') ,'Avicii-Waiting For Love（Slowed）', '超清母带','AD_概 - By: Avicii-Waiting For Love','Avicii-Waiting For Love（Slowed）.mp3' , 2,666,668,true),
  new UserSong (4 ,$rawfile('../../resources/rawfile/jh.jpg') ,'句号', '超清母带','木夕 - 句号','juhao.mp3' , 3,795,463,false),
  new UserSong (5 ,$rawfile('../../resources/rawfile/TimeMan.jpg') ,'TimeMan', '超清母带','罗浩文BF - TimeMan', 'TimeMan.mp3' , 4,956,467,true),
  new UserSong (6 ,$rawfile('../../resources/rawfile/The Greatest.jpg') ,'The Greatest', '超清母带','wildbeezy - The Greatest','The Greatest.mp3' , 5,456,369,false),
  new UserSong (7 ,$rawfile('../../resources/rawfile/Something Just Like This.jpg') ,'Something Just Like This', '超清母带','Asher - Something Just Like This','Something Just Like This.mp3' , 6,576,269,true),
  new UserSong (8 ,$rawfile('../../resources/rawfile/So Far Away.jpg') ,'So Far Away（Acoustic）', '超清母带','Adam Christopher - So Far Away','So Far Allway.mp3' , 7,596,269,true),
  new UserSong (9 ,$rawfile('../../resources/rawfile/ruobani.jpg') ,'若把你', '超清母带','Kirsty刘瑾睿 - 若把你','ruobani.mp3' , 8,596,269,true),
  new UserSong (10 ,$rawfile('../../resources/rawfile/Temple.jpg') ,'Temple（慢速版）', '超清母带','Liu/Zerky - Temple','Template.mp3' , 9,496,169,true),
  new UserSong (11 ,$rawfile('../../resources/rawfile/Drive My Car.jpg') ,'Drive My Car', '超清母带','DEAMN - Drive My Car','Drive My Car.mp3' , 10,1096,463,false),
  new UserSong (12 ,$rawfile('../../resources/rawfile/m1.jpg') ,'ロクデナシ', '超清母带','にんじん/ninzin','m1.mp3' , 11,396,569,false),
  new UserSong (13 ,$rawfile('../../resources/rawfile/m2.jpg') ,'ありがとう･･･ (カバー)', '超清母带','磐田みゆき','m2.mp3' , 12,936,469,false),
  new UserSong (14 ,$rawfile('../../resources/rawfile/m3.jpg') ,'勾指起誓', '超清母带','泠鸢yousa','m3.mp3' , 13,596,269,true),
  new UserSong (15 ,$rawfile('../../resources/rawfile/qifenle.jpg') ,'起风了', '超清母带','买辣椒也用券','qifenle.mp3' , 14,396,669,false),
  new UserSong (16 ,$rawfile('../../resources/rawfile/xuanni.jpg') ,'悬溺', '超清母带','葛东琪','xuanni.mp3' , 15,1096,769,true)
]


// const  songs2:SongItem[] = [
//   {id:10 ,image:$rawfile('Temple.jpg') ,name:'Temple（慢速版）',typeDescription: '超清母带',author: 'Liu/Zerky - Temple',src:'Template.mp3' ,index: 9},
//   {id:11 ,image:$rawfile('Drive My Car.jpg') ,name:'Drive My Car',typeDescription: '超清母带',author: 'DEAMN - Drive My Car',src:'Drive My Car.mp3' ,index: 10},
//   {id:12 ,image:$rawfile('m1.jpg') ,name:'ロクデナシ',typeDescription: '超清母带',author: 'にんじん/ninzin',src:'m1.mp3' ,index: 11},
//   {id:13 ,image:$rawfile('m2.jpg') ,name:'ありがとう･･･ (カバー)',typeDescription: '超清母带',author: '磐田みゆき',src:'m2.mp3' ,index: 12},
//   {id:14 ,image:$rawfile('m3.jpg') ,name:'勾指起誓',typeDescription: '超清母带',author: '泠鸢yousa',src:'m3.mp3' ,index: 13},
//   {id:15 ,image:$rawfile('qifenle.jpg') ,name:'起风了',typeDescription: '超清母带',author: '买辣椒也用券',src:'qifenle.mp3' ,index: 14},
//   {id:16 ,image:$rawfile('xuanni.jpg') ,name:'悬溺',typeDescription: '超清母带',author: '葛东琪',src:'xuanni.mp3' ,index: 15},
//   {id:1 ,image:$rawfile('zhimibuwu.jpg') ,name:'执迷不悟（伤感女声版）',typeDescription: '超清母带',author: 'Jessie熙熙',src:'zhimibuwu.mp3' ,index: 0},
//   {id:2 ,image:$rawfile('WILD.jpg') ,name:'WILD（0.8x）',typeDescription: '超清母带',author: 'XXXDAION - Side',src:'WILD.mp3' ,index: 1},
//   {id:3 ,image:$rawfile('Avicii-Waiting For Love.jpg') ,name:'Avicii-Waiting For Love（Slowed）',typeDescription: '超清母带',author: 'AD_概 - By: Avicii-Waiting For Love',src:'Avicii-Waiting For Love（Slowed）.mp3' ,index: 2},
//   {id:4 ,image:$rawfile('jh.jpg') ,name:'句号',typeDescription: '超清母带',author: '木夕 - 句号',src:'juhao.mp3' ,index: 3},
//   {id:5 ,image:$rawfile('TimeMan.jpg') ,name:'TimeMan',typeDescription: '超清母带',author: '罗浩文BF - TimeMan',src: 'TimeMan.mp3' ,index: 4},
//   {id:6 ,image:$rawfile('The Greatest.jpg') ,name:'The Greatest',typeDescription: '超清母带',author: 'wildbeezy - The Greatest',src:'The Greatest.mp3' ,index: 5},
//   {id:7 ,image:$rawfile('Something Just Like This.jpg') ,name:'Something Just Like This',typeDescription: '超清母带',author: 'Asher - Something Just Like This',src:'Something Just Like This.mp3' ,index: 6},
//   {id:8 ,image:$rawfile('So Far Away.jpg') ,name:'So Far Away（Acoustic）',typeDescription: '超清母带',author: 'Adam Christopher - So Far Away',src:'So Far Allway.mp3' ,index: 7},
//   {id:9 ,image:$rawfile('ruobani.jpg') ,name:'若把你',typeDescription: '超清母带',author: 'Kirsty刘瑾睿 - 若把你',src:'ruobani.mp3' ,index: 8}
// ]

// const mines:RecommendSing[] = [
//   new RecommendSing('', $r('app.media.mine1'), '我喜欢的音乐'),
//   new RecommendSing('', $r('app.media.mine2'), '飞鱼'),
//   new RecommendSing('', $r('app.media.mine3'), '天尊之殇'),
//   new RecommendSing('', $r('app.media.mine4'), '奥义')
// ]
//
// const newSings:RecommendSing[] = [
//   new RecommendSing('Papercuts',$r('app.media.xd1'),'Linkin Park'),
//   new RecommendSing('不够善良的我们',$r('app.media.xd2'),'蔡健雅'),
//   new RecommendSing('SCIENCE FICTION',$r('app.media.xd3'),'宇多田ヒカル'),
//   new RecommendSing('镜像',$r('app.media.xd4'),'脆莓(Brickleberry)'),
//   new RecommendSing('Scarlet 2 CLAUDE',$r('app.media.xd5'),'Doja Cat'),
//   new RecommendSing('棘アリ',$r('app.media.xd6'),'トゲナシトゲアリ')
// ]
//
// const recommends:RecommendSing[]=[
//   new RecommendSing('相似歌曲',$r('app.media.recommend_1'),'从你喜欢听的歌听起'),
//   new RecommendSing('私人雷达',$r('app.media.recommend_2'),'你爱的歌值得反复聆听'),
//   new RecommendSing('电音日推',$r('app.media.recommend_3'),'你喜欢的电音歌曲'),
//   new RecommendSing('相似艺人',$r('app.media.recommend_4'),'从你喜欢的艺人听起'),
//   new RecommendSing('私人漫游',$r('app.media.recommend_5'),'多种听歌模式随心播放')
// ]
//
// const ranks: RecommendSing[] = [
//   new RecommendSing('', $r('app.media.chart1'), '罗马、我在原地等你、Fortnight'),
//   new RecommendSing('', $r('app.media.chart2'), '罗马、OK了、谢谢天帝'),
//   new RecommendSing('', $r('app.media.chart3'), '如果爱忘了(live)、还是会想你'),
//   new RecommendSing('', $r('app.media.chart4'), '与地球的单独约会'),
//   new RecommendSing('', $r('app.media.chart5'), '妥协、Fast Cars & Superstars'),
//   new RecommendSing('', $r('app.media.chart6'), 'Repeat（重复）Fortnight')
// ]
//
// const recommendSings:RecommendSing[]=[
//   new RecommendSing('850.1',$r('app.media.rs1'),'热血澎湃 激发你的血脉'),
//   new RecommendSing('27.0.1',$r('app.media.rs2'),'追光者和更多好听的华语私人怀旧动态歌曲 持续为您推荐'),
//   new RecommendSing('4180',$r('app.media.rs3'),'今天免费听《Creep》'),
//   new RecommendSing('177.6',$r('app.media.rs4'),'你曾经听过的好歌'),
//   new RecommendSing('132.5',$r('app.media.rs5'),'从WILD开启你的听歌之旅')
// ]
// export {songs1,songs2,mines,newSings,recommends,ranks,recommendSings}
export {songs1,userSong1}