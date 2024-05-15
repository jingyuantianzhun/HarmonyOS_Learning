import SongItem from '../model/SongItem';

@Observed
export  class UserSong{

  /**
   * 歌曲id
   */
  id:number

  /**
   * 歌曲路径
   */
  image:Resource

  /**
   * 歌曲名称
   */
  name:string

  /**
   * 歌曲类型描述
   */
  typeDescription:string

  /**
   * 歌曲作者
   */
  author:string

  /**
   * 歌曲音频路径
   */
  src:string

  /**
   * 歌曲歌曲下标
   */
  index:number

  /**
   * 歌曲id
   */
  like:number

  /**
   * 歌曲id
   */
  comment:number

  /**
   * 是否收藏
   */
  isCollection:boolean

  constructor(id: number, image: Resource,name:string, typeDescription: string,
              author: string, src: string, index: number, like: number, comment: number,isCollection:boolean) {
    this.id=id
    this.image=image
    this.name=name
    this.typeDescription=typeDescription
    this.author=author
    this.src=src
    this.index=index
    this.like=like
    this.comment=comment
    this.isCollection=isCollection
  }
}