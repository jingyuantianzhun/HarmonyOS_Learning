
export default class Song{
  /**
   * 歌曲图片
   */
  songPicture:ResourceStr
  /**
   * 歌曲名字
   */
  songName:string
  /**
   * 歌曲作者
   */
  songWriter:string
  /**
   * 评论数量
   */
  NumberOfReviews:string
  /**
   * 点赞数
   */
  likeNumber:string

    constructor(songPicture:Resource,songName:string,songWriter:string,NumberOfReviews:string,likeNumber:string) {
      this.songPicture = songPicture
      this.songName = songName
      this.songWriter = songWriter
      this.NumberOfReviews = NumberOfReviews
      this.likeNumber = likeNumber
    }
}