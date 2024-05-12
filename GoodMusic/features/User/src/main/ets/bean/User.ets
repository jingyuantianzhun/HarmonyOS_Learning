import { City } from './City'
import { Gender } from './Gender'
import { MusicTag } from './MusicTag'
import { Province } from './Province'
import { Region } from './Region'
import { University } from './University'

export class User{

  /**
   * 用户id唯一标识
   */
  id:number

  /**
   * 用户网名
   */
  name:string

  /**
   * 用户关注的歌手数量
   */
  concernNumber:number

  /**
   * 用户的粉丝数量
   */
  fansNumber:number

  /**
   * 用户头像资源
   */
  image:Resource

  /**
   * 用户性别
   */
  gender:Gender

  /**
   * 用户二维码
   */
  QRCode:Resource

  /**
   * 用户村龄
   */
  createDate:Date

  /**
   * IP属地(省份)
   */
  province:string

  /**
   * 生日
   */
  birthday:Date

  /**
   * 地区
   */
  region:Region

  /**
   * 大学
   */
  university:string

  /**
   * 音乐标签
   */
  musicTags:MusicTag[]

  /**
   * 用户简介
   */
  synopsis:string

  /**
   * 云音乐等级
   */
  cloudMusicGrade:number

  /**
   * 个人相册
   */
  images:Resource[]

  constructor($$: {
    /**
     * 用户id唯一标识
     */
    id:number

    /**
     * 用户网名
     */
    name:string

    /**
     * 用户关注的歌手数量
     */
    concernNumber:number

    /**
     * 用户的粉丝数量
     */
    fansNumber:number

    /**
     * 用户头像资源
     */
    image:Resource

    /**
     * 用户性别
     */
    gender:Gender

    /**
     * 用户二维码
     */
    QRCode:Resource

    /**
     * 用户村龄
     */
    createDate:Date

    /**
     * IP属地(省份)
     */
    province:string

    /**
     * 生日
     */
    birthday:Date

    /**
     * 地区
     */
    region:Region

    /**
     * 大学
     */
    university:string

    /**
     * 音乐标签
     */
    musicTags:string[]

    /**
     * 用户简介
     */
    synopsis:string

    /**
     * 云音乐等级
     */
    cloudMusicGrade:number

    /**
     * 个人相册
     */
    images:Resource[]
  }) {
    // this.id=$$.id
    this.name=$$.name
    this.concernNumber=$$.concernNumber
    this.fansNumber=$$.fansNumber
    this.image=$$.image
    this.gender=$$.gender
    this.QRCode=$$.QRCode
    this.createDate=$$.createDate
    this.province=$$.province
    this.birthday=$$.birthday
    this.region=$$.region
    this.university=$$.university
    this.musicTags=$$.musicTags
    this.synopsis=$$.synopsis
    this.cloudMusicGrade=$$.cloudMusicGrade
    this.images=$$.images
  }
}

// const users:Array<User>=[
//   new User({id:1,name:'我美吗？',concernNumber:8,fansNumber:2,image:$rawfile('user1.jpg'),gender:Gender.WOMAN,QRCode:$rawfile('code1.jpg'),createDate:new Date('2012-01-12 12:34:04'),province:Province.JXS,birthday:new Date('2000-01-12 12:34:04'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.DXM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:2,images:[$rawfile('user1.jpg'),$rawfile('user2.jpg'),$rawfile('user3.jpg')]}),
//   new User({id:2,name:'我想逃',concernNumber:4,fansNumber:1,image:$rawfile('user2.jpg'),gender:Gender.MAN,QRCode:$rawfile('code1.jpg'),createDate:new Date('2015-11-12 04:33:08'),province:Province.JXS,birthday:new Date('1999-05-01 01:34:19'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.YGYM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:1,images:[$rawfile('user1.jpg'),$rawfile('user2.jpg'),$rawfile('user3.jpg')]}),
//   new User({id:3,name:'云想衣裳花想容',concernNumber:7,fansNumber:5,image:$rawfile('user3.jpg'),gender:Gender.MAN,QRCode:$rawfile('code1.jpg'),createDate:new Date('2018-09-12 08:23:04'),province:Province.JXS,birthday:new Date('2003-08-09 18:08:06'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.MYM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:3,images:[$rawfile('user1.jpg'),$rawfile('user2.jpg'),$rawfile('user3.jpg')]}),
//   new User({id:4,name:'万紫千红',concernNumber:6,fansNumber:2,image:$rawfile('user4.jpg'),gender:Gender.WOMAN,QRCode:$rawfile('code1.jpg'),createDate:new Date('2000-05-12 03:15:04'),province:Province.JXS,birthday:new Date('2001-03-18 12:20:23'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.DXM,MusicTag.MYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:10,images:[$rawfile('user1.jpg'),$rawfile('user2.jpg'),$rawfile('user3.jpg')]}),
//   new User({id:5,name:'宇宙第一帅',concernNumber:1,fansNumber:0,image:$rawfile('user5.jpg'),gender:Gender.MAN,QRCode:$rawfile('code1.jpg'),createDate:new Date('2019-02-12 01:46:04'),province:Province.JXS,birthday:new Date('1995-11-07 09:07:12'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.GFM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:4,images:[$rawfile('user1.jpg'),$rawfile('user2.jpg'),$rawfile('user3.jpg')]})
// ]

const users:Array<User>=[
  new User({id:1,name:'我美吗？',concernNumber:8,fansNumber:2,image:$rawfile('../../resources/rawfile/user1.jpg'),gender:Gender.WOMAN,QRCode:$rawfile('../../resources/rawfile/code1.jpg'),createDate:new Date('2012-01-12 12:34:04'),province:Province.JXS,birthday:new Date('2000-01-12 12:34:04'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.DXM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:2,images:[$rawfile('../../resources/rawfile/user1.jpg'),$rawfile('../../resources/rawfile/user2.jpg'),$rawfile('../../resources/rawfile/user3.jpg')]}),
  new User({id:2,name:'我想逃',concernNumber:4,fansNumber:1,image:$rawfile('../../resources/rawfile/user2.jpg'),gender:Gender.MAN,QRCode:$rawfile('../../resources/rawfile/code1.jpg'),createDate:new Date('2015-11-12 04:33:08'),province:Province.JXS,birthday:new Date('1999-05-01 01:34:19'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.YGYM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:1,images:[$rawfile('../../resources/rawfile/user1.jpg'),$rawfile('../../resources/rawfile/user2.jpg'),$rawfile('../../resources/rawfile/user3.jpg')]}),
  new User({id:3,name:'云想衣裳花想容',concernNumber:7,fansNumber:5,image:$rawfile('../../resources/rawfile/user3.jpg'),gender:Gender.MAN,QRCode:$rawfile('../../resources/rawfile/code1.jpg'),createDate:new Date('2018-09-12 08:23:04'),province:Province.JXS,birthday:new Date('2003-08-09 18:08:06'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.MYM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:3,images:[$rawfile('../../resources/rawfile/user1.jpg'),$rawfile('../../resources/rawfile/user2.jpg'),$rawfile('../../resources/rawfile/user3.jpg')]}),
  new User({id:4,name:'万紫千红',concernNumber:6,fansNumber:2,image:$rawfile('../../resources/rawfile/user4.jpg'),gender:Gender.WOMAN,QRCode:$rawfile('../../resources/rawfile/code1.jpg'),createDate:new Date('2000-05-12 03:15:04'),province:Province.JXS,birthday:new Date('2001-03-18 12:20:23'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.DXM,MusicTag.MYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:10,images:[$rawfile('../../resources/rawfile/user1.jpg'),$rawfile('../../resources/rawfile/user2.jpg'),$rawfile('../../resources/rawfile/user3.jpg')]}),
  new User({id:5,name:'宇宙第一帅',concernNumber:1,fansNumber:0,image:$rawfile('../../resources/rawfile/user5.jpg'),gender:Gender.MAN,QRCode:$rawfile('../../resources/rawfile/code1.jpg'),createDate:new Date('2019-02-12 01:46:04'),province:Province.JXS,birthday:new Date('1995-11-07 09:07:12'),region:new Region(Province.JXS,City.GZS),university:University.JXLGDX,musicTags:[MusicTag.GFM,MusicTag.YGYM],synopsis:'我是一个乐观向上的人',cloudMusicGrade:4,images:[$rawfile('../../resources/rawfile/user1.jpg'),$rawfile('../../resources/rawfile/user2.jpg'),$rawfile('../../resources/rawfile/user3.jpg')]})
]

export default users as Array<User>










