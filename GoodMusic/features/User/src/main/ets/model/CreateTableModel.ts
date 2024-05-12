import { FieldInfo, FieldType } from './FieldInfo'

export default class CreateTableModel{

  /**
   * 用户表表名
   */
  static readonly usersTableName:string='Users'

  /**
   * 用户表创建语句
   */
  static readonly usersSQL:string=`
  create table if not exists Users(
  id integer primary key autoincrement,
  name varhcar(32) default '',
  concern_Number INTEGER ,
  fans_Number INTEGER,
  image varchar(64),
  gender INT,
  QRCode varchar(64),
  create_Date TIMESTAMP,
  province varchar(64),
  birthday TIMESTAMP,
  region varchar(64),
  university varchar(64),
  music_Tags varchar(64),
  synopsis varchar(64),
  cloud_Music_Grade INTEGER,
  images varchar(64)
`

  static usersTableColumnInfo:FieldInfo[]=[
    new FieldInfo('name','name',FieldType.STRING),
    new FieldInfo('concernNumber','concern_Number',FieldType.LONG),
    new FieldInfo('fansNumber','fans_Number',FieldType.LONG),
    new FieldInfo('image','image',FieldType.STRING),
    new FieldInfo('gender','gender',FieldType.LONG),
    new FieldInfo('QRCode','QRCode',FieldType.STRING),
    new FieldInfo('createDate','create_Date',FieldType.LONG),
    new FieldInfo('province','province',FieldType.STRING),
    new FieldInfo('birthday','birthday',FieldType.LONG),
    new FieldInfo('region','region',FieldType.STRING),
    new FieldInfo('university','university',FieldType.STRING),
    new FieldInfo('musicTags','music_Tags',FieldType.STRING),
    new FieldInfo('synopsis','synopsis',FieldType.STRING),
    new FieldInfo('cloudMusicGrade','cloud_Music_Grade',FieldType.LONG),
    new FieldInfo('images','images',FieldType.STRING)
  ]



}