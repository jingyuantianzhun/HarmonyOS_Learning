
/**
 * 数据库表中的字段信息
 */
export class FieldInfo{

  /**
   * 数据库表中字段对应对象中的属性名称
   */
  propertyName:string

  /**
   * 数据库表的字段名
   */
  fieldName:string

  /**
   * 数据库表中该字段的类型，或者是对象中该属性的类型
   */
  type: FieldType

  constructor(propertyName: string, fieldName: string, type: FieldType) {
    this.propertyName=propertyName
    this.fieldName=fieldName
    this.type=type
  }

}

/**
 * 数据类型信息的枚举
 */
export enum FieldType{
  /**
   * 对应数据类型的long类型
   */
  LONG,
  /**
   * 对应数据类型的double类型
   */
  DOUBLE,
  /**
   * 对应数据类型的string类型
   */
  STRING,
  /**
   * 对应数据类型的blob类型
   */
  BLOB
}