import relationalStore from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common'
import Logger from './LogUtil'
import { FieldInfo, FieldType } from '../model/FieldInfo'

/**
 * 项目数据库名称
 */
const DB_NAME:string='GoodMusic.db'

class DBUtils{

  /**
   * 工具类中保存项目数据库实例
   */
  rdbStore:relationalStore.RdbStore


  /**
   * 数据库初始化，数据库构建成功后把数据库对象保存到当前工具类中的rdbStore属性中
   * @param context 应用上下文
   * @returns  返回一个承诺值void
   */
  initDB(context:common.UIAbilityContext):Promise<void>{

    //数据库配置信息
    let config:relationalStore.StoreConfig={
      name: DB_NAME,
      securityLevel: relationalStore.SecurityLevel.S1
    }
    return new Promise((resolve,reject)=>{
      relationalStore.getRdbStore(context,config)
        .then(res=>{
          this.rdbStore=res
          Logger.COMMON.log(`数据库${DB_NAME}构建成功`)
          resolve()
        })
        .catch(err=>{
          Logger.COMMON.error(`数据库${DB_NAME}构建失败`,JSON.stringify(err))
          reject()
        })

    })
  }



  /**
   * 创建数据库表
   * @param sql 创建表语句
   * @returns 返回一个承诺值void
   */
  createTable(sql:string):Promise<void>{
    return new Promise((resolve,reject)=>{
      this.rdbStore.executeSql(sql)
        .then(()=>{
          Logger.COMMON.log('表创建成功',sql)
          resolve()
        })
        .catch(err=>{
          Logger.COMMON.error('表创建失败',JSON.stringify(err))
          reject()
        })
    })
  }

  /**
   * relationalStore.ValuesBucket对象是一个含有多个键值对的对象，例如{'id':1,'name':'zhangsan','age':12}
   * 这个对象中的键值是表的字段名称，值为该条记录中对应字段的值，
   * 这个方法负责，把一个目标对象obj的每一个属性和它所属的表的每一个字段进行一一映射
   * @param obj 目标字段
   * @param columns 目标字段所处表的所有字段信息
   * @returns
   */
  buildValueBucket(obj:any,fieldInfos:FieldInfo[]):relationalStore.ValuesBucket{
    let result:relationalStore.ValuesBucket
    fieldInfos.forEach((field:FieldInfo,index)=>{
      //取出目标对象中当前属性的值
      let value=obj[field.propertyName];
      if (typeof value !== 'undefined') {
        //把目标对象obj的当前属性值和表中的字段名和值进行一一对应
        result[field.fieldName]=value
      }
    })
    return result
  }

  /**
   * 向数据库表tableName中插入obj对象的数据
   * @param tableName 目标表名称
   * @param obj 被插入的记录信息
   * @param fieldInfos 被插入对象的每一个属性名称和目标表每一个字段名称的一一映射数组
   * @returns 返回插入的记录数目
   */
  insert(tableName:string,obj:any,fieldInfos:FieldInfo[]):Promise<number>{

    let valueBucket=this.buildValueBucket(obj,fieldInfos)

    Logger.COMMON.log(JSON.stringify(obj),`对象映射成表中的一行记录成功`)

    return new Promise((resolve,reject)=>{
      this.rdbStore.insert(tableName,valueBucket)
        .then((res)=>{
          Logger.COMMON.log(`向表${tableName}插入数据成功`,JSON.stringify(valueBucket))
          resolve(res)
        })
        .catch(err=>{
          Logger.COMMON.error(`向表${tableName}插入数据失败`,JSON.stringify(valueBucket),JSON.stringify(err))
          reject(err)
        })
    })

  }

  /**
   * 向数据库表tableName中插入obj对象的数据
   * @param tableName 目标表名称
   * @param objs 被插入的记录信息数组
   * @param fieldInfo 被插入对象的每一个属性名称和目标表每一个字段名称的一一映射数组
   * @returns 返回插入的记录数目
   */
  batchInsert(tableName:string,objs:any[],fieldInfo:FieldInfo[]):Promise<number>{
    if (objs.length <= 0 || objs === null) {
      Logger.COMMON.error('批量插入操作失败，提供的对象数组为空')
      return
    }
    let valueBucket=[]
    objs.forEach(obj=>{
      let temp=this.buildValueBucket(obj,fieldInfo)
      valueBucket.push(temp)
    })
    return new Promise((resolve,reject)=>{
      this.rdbStore.batchInsert(tableName,valueBucket)
        .then((res)=>{
          Logger.COMMON.log(`向表${tableName}批量插入数据成功`,JSON.stringify(valueBucket))
          resolve(res)
        })
        .catch(err=>{
          Logger.COMMON.error(`向表${tableName}批量插入数据失败`,JSON.stringify(valueBucket),JSON.stringify(err))
          reject(err)
        })
    })
  }

  /**
   * 删除数据库表中的记录
   * @param predicates 条件谓词
   * @returns 返回删除的行数
   */
  delete(predicates:relationalStore.RdbPredicates):Promise<number>{

    return new Promise((resolve,reject)=>{
      this.rdbStore.delete(predicates)
        .then((res)=>{
          Logger.COMMON.log(`删除记录成功`,JSON.stringify(predicates))
          resolve(res)
        })
        .catch(err=>{
          Logger.COMMON.error(`删除记录失败`,JSON.stringify(predicates))
          reject(err)
        })
    })
  }

  /**
   * 根据条件查询
   * @param predicates 条件谓词
   * @param columns 查询条件对应的字段信息数组
   * @returns 返回对象数组
   */
  queryForList<T>(predicates:relationalStore.RdbPredicates,columns:FieldInfo[]):Promise<T[]>{
    return new Promise((resolve,reject)=>{

      this.rdbStore.query(predicates,columns.map((field:FieldInfo)=>field.fieldName))
        .then(res=>{
          Logger.COMMON.log('数据查询成功',JSON.stringify(res))
          resolve(this.resultSetToList(res,columns))
        })
        .catch(err=>{
          Logger.COMMON.error('数据查询失败',JSON.stringify(err))
          reject(err)
        })
    })
  }

  /**
   * 将数据库查询到的resultSet结果集进行解析成一个对象数组
   * @param result 目标结果集
   * @param columns 目标结果集对应的字段集
   * @returns 返回对象数组
   */
  resultSetToList<T>(result:relationalStore.ResultSet,columns:FieldInfo[]):T[]{

    let arr=[]
    if (result.rowCount <= 0) {
      return arr
    }
    while (!result.isAtLastRow){
      result.goToNextRow()
      let obj={}
      columns.forEach(field=>{
        let val=null
        switch (field.type){
          case FieldType.LONG:
            val=result.getLong(result.getColumnIndex(field.fieldName))
            break

          case FieldType.DOUBLE:
            val=result.getDouble(result.getColumnIndex(field.fieldName))
            break

          case FieldType.STRING:
            val=result.getString(result.getColumnIndex(field.fieldName))
            break

          case FieldType.BLOB:
            val=result.getBlob(result.getColumnIndex(field.fieldName))
            break
        }
        obj[field.propertyName]=val
      })
      arr.push(obj)
      Logger.COMMON.log(`数据数据解析成功`,JSON.stringify(obj))
    }
    return arr
  }


}

const dbUtil=new DBUtils()
export default dbUtil as DBUtils