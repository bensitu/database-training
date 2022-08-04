# SQL的DDL、DML、DCL

## 基础知识

### 标识符命名规则

- 数据库名、表名不得超过30个字符，变量名限制为29个
- 必须只能包含 A–Z, a–z, 0–9, _共63个字符
- 数据库名、表名、字段名等对象名中间不要包含空格
- 同一个MySQL软件中，数据库不能同名；同一个库中，表不能重名；同一个表中，字段不能重名
- 必须保证字段没有和保留字、数据库系统或常用方法冲突。如果坚持使用，请在SQL语句中使用`（着重号）引起来
- 保持字段名和类型的一致性：在命名字段并为其指定数据类型的时候一定要保证一致性，假如数据类型在一个表里是整数，那在另一个表里可就别变成字符型了



### 数据类型

| 类型             | 类型举例                                                     |
| ---------------- | ------------------------------------------------------------ |
| 整数类型         | TINYINT、SMALLINT、MEDIUMINT、INT(或INTEGER)、BIGINT         |
| 浮点类型         | FLOAT、DOUBLE                                                |
| 定点数类型       | DECIMAL                                                      |
| 位类型           | BIT                                                          |
| 日期时间类型     | YEAR、TIME、DATE、DATETIME、TIMESTAMP                        |
| 文本字符串类型   | CHAR、VARCHAR、TINYTEXT、TEXT、MEDIUMTEXT、LONGTEXT          |
| 枚举类型         | ENUM                                                         |
| 集合类型         | SET                                                          |
| 二进制字符串类型 | BINARY、VARBINARY、TINYBLOB、BLOB、MEDIUMBLOB、LONGBLOB      |
| JSON类型         | JSON对象、JSON数组                                           |
| 空间数据类型     | 单值:GEOMETRY、POINT、LINESTRING、POLYGON;集合: MULTIPOINT、MULTILINESTRING、MULTIPOLYGON、GEOMETRYCOLLECTION |

其中，常用的几类类型介绍如下：

| 数据类型      | 描述                                                         |
| ------------- | ------------------------------------------------------------ |
| INT           | 从-2^31到2^31 -1的整型数据。存储大小为 4个字节。默认长度为11 |
| CHAR(size)    | 定长字符数据。若未指定，默认为1个字符，最大长度255           |
| VARCHAR(size) | 可变长字符数据，根据字符串实际长度保存，必须指定长度         |
| FLOAT(M,D)    | 单精度，占用4个字节，M=整数位+小数位，D=小数位。 D<=M<=255,0<=D<=30，默认M+D<=6 |
| DOUBLE(M,D)   | 双精度，占用8个字节，D<=M<=255,0<=D<=30，默认M+D<=15         |
| DECIMAL(M,D)  | 高精度小数，占用M+2个字节，D<=M<=65，0<=D<=30，最大取值范围与DOUBLE相同。 |
| DATE          | 日期型数据，格式’YYYY-MM-DD’                                 |
| BLOB          | 二进制形式的长文本数据，最大可达4G                           |
| TEXT          | 长文本数据，最大可达4G                                       |



## 创建和管理数据库

### 创建数据库	

- 方式1：创建数据库

`CREATE DATABASE 数据库名;`

- 方式2：创建数据库并指定字符集

`CREATE DATABASE 数据库名 CHARACTER SET 字符集;`

- 方式3：判断数据库是否已经存在，不存在则创建数据库（推荐 ）

`CREATE DATABASE IF NOT EXISTS 数据库名;`

- 如果MySQL中已经存在相关的数据库，则忽略创建语句，不再创建数据库。

> 注意：DATABASE 不能改名。一些可视化工具可以改名，它是建新库，把所有表复制到新库，再删旧库完成的。



### 使用数据库

- 查看当前所有的数据库

`SHOW DATABASES; #有一个S，代表多个数据库`

- 查看当前正在使用的数据库

`SELECT DATABASE();	#使用的一个 mysql 中的全局函数`

- 查看指定库下所有的表

`SHOW TABLES FROM 数据库名;`

- 查看数据库的创建信息

`SHOW CREATE DATABASE 数据库名;`
`#或者：`
`SHOW CREATE DATABASE 数据库名\G`

- 使用/切换数据库

`USE 数据库名;`

> 注意：要操作表格和数据之前必须先说明是对哪个数据库进行操作，否则就要对所有对象加上“数据库名.”。



### 修改数据库

- 更改数据库字符集

`ALTER DATABASE 数据库名 CHARACTER SET 字符集;	#比如：gbk、utf8等`



#### 删除数据库

- 方式1：删除指定的数据库

`DROP DATABASE 数据库名;`

- 方式2：删除指定的数据库（推荐 ）

`DROP DATABASE IF EXISTS 数据库名;`



## 创建和管理表

### 创建表

语法格式：

`CREATE TABLE [IF NOT EXISTS] 表名(`
`字段1, 数据类型 [约束条件] [默认值],`
`字段2, 数据类型 [约束条件] [默认值],`
`字段3, 数据类型 [约束条件] [默认值],`
`……`
`[表约束条件]`
`);`

> 加上了IF NOT EXISTS关键字，则表示：如果当前数据库中不存在要创建的数据表，则创建数据表；如果当前数据库中已经存在要创建的数据表，则忽略建表语句，不再创建数据表。

MySQL在执行建表语句时，将id字段的类型设置为int(11)，这里的11实际上是int类型指定的显示宽度，默认的显示宽度为11。也可以在创建数据表的时候指定数据的显示宽度。在MySQL 8.x版本中，不再推荐为INT类型指定显示长度，并在未来的版本中可能去掉这样的语法



### 查看数据表结构

语法格式如下：

`SHOW CREATE TABLE 表名\G`



### 修改表

#### 追加一个列

使用 **ALTER ... ADD ...** 语法格式如下：

`ALTER TABLE 表名 ADD [COLUMN] 字段名 字段类型 [FIRST|AFTER 字段名];`

例：

`ALTER TABLE dept80 ADD job_id varchar(15);`



#### 修改一个列

使用 **ALTER ... MODIFY ...**：

- 可以修改列的数据类型，长度、默认值和位置
- 修改字段数据类型、长度、默认值、位置的语法格式如下：

`ALTER TABLE 表名 MODIFY 字段名1 字段类型 [DEFAULT 默认值][FIRST|AFTER 字段名2];`

例：

`ALTER TABLE dept80 MODIFY last_name VARCHAR(30);`

注： 不能重命名列



#### 重命名一个列

使用 **CHANGE** old_column new_column dataType 子句重命名列。语法格式如下：

`ALTER TABLE 表名 CHANGE 列名 新列名 新数据类型;`

例：

`ALTER TABLE dept80 CHANGE department_name dept_name varchar(15);`



#### 删除一个列

使用**ALTER ... DROP ...** 删除表中某个字段的语法格式如下：

`ALTER TABLE 表名 DROP 字段名`

例：

`ALTER TABLE dept80 DROP COLUMN job_id;`



### 重命名表

- 方式一：使用RENAME

`RENAME TABLE emp TO myemp;`

- 方式二：

`ALTER table dept` 

`RENAME [TO] detail_dept;	-- [TO]可以省略`



### 删除表

- 在MySQL中，当一张数据表没有与其他任何数据表形成关联关系 时，可以将当前数据表直接删除。
- 数据和结构都被删除
- 所有正在运行的相关事务被提交
- 所有相关索引被删除
- 语法格式： `DROP TABLE [IF EXISTS] 数据表1 [, 数据表2, …, 数据表n];`

> IF EXISTS 的含义为：如果当前数据库中存在相应的数据表，则删除数据表；如果当前数据库中不存在相应的数据表，则忽略删除语句，不再执行删除数据表的操作。



### 清空表

TRUNCATE TABLE语句：

- 删除表中所有的数据
- 释放表的存储空间

`TRUNCATE TABLE detail_dept;`

**TRUNCATE语句不能回滚，而使用 DELETE 语句删除数据，可以回滚**



## 拓展

【强制 】表名、字段名必须使用小写字母或数字，禁止出现数字开头，禁止两个下划线中间只出现数字。数据库字段名的修改代价很大，因为无法进行预发布，所以字段名称需要慎重考虑。

- 正例：aliyun_admin,rdc_config,level3_name

- 反例：AliyunAdmin，rdcConfig,level_3_name

【 强制 】禁用保留字，如 desc、range、match、delayed 等，请参考 MySQL 官方保留字。
【 强制 】表必备三字段：id, gmt_create, gmt_modified。

- 说明：其中 id 必为主键，类型为BIGINT UNSIGNED、单表时自增、步长为 1。gmt_create,gmt_modified 的类型均为 DATETIME 类型，前者现在时表示主动式创建，后者过去分词表示被动式更新

【推荐 】表的命名最好是遵循 “业务名称_表的作用”。

- 正例：alipay_task 、 force_project、trade_config
  【推荐 】库名与应用名称尽量一致。
  【参考】合适的字符存储长度，不但节约数据库表空间、节约索引存储，更重要的是提升检索速度。
- 正例：无符号值可以避免误存负数，且扩大了表示范围。