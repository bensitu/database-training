# MySQL多表查询

### 等值连接

使用多个表中相同名字的列进行关联

**SELECT xxx FROM 表1, 表2 **

**WHERE 表1.某字段=表2.某字段**

或者

**SELECT xxx FROM 表1, 表2, 表3 **

**WHERE 表1.某字段=表2.某字段 AND 表2.某字段=表3.某字段**

例：

`SELECT employees.employee_id, employees.last_name, employees.department_id, departments.department_id, departments.location_id`
`FROM employees, departments`
`WHERE employees.department_id = departments.department_id;`

- 使用别名可以简化查询。
- 列名前使用表名前缀可以提高查询效率。
- 连接 n个表,至少需要n-1个连接条件。比如，连接三个表，至少需要两个连接条件。



### 自连接

使用同一张表进行内链。

例：

`SELECT CONCAT(worker.last_name ,' works for ', manager.last_name)`
`FROM employees worker, employees manager`
`WHERE worker.manager_id = manager.employee_id ;`

- 内连接: 合并具有同一列的两个以上的表的行, 结果集中不包含一个表与另一个表不匹配的行
- 外连接: 两个表在连接过程中除了返回满足连接条件的行以外还返回左（或右）表中不满足条件的行 ，这种连接称为左（或右）外连接。没有匹配的行时, 结果表中相应的列为空(NULL)。
- 如果是左外连接，则连接条件中左边的表也称为 主表 ，右边的表称为 从表 。 如果是右外连接，则连接条件中右边的表也称为 主表 ，左边的表称为 从表 。



### SQL92: 使用(+)创建连接

- 在 SQL92 中采用（+）代表从表所在的位置。即左或右外连接中，(+) 表示哪个是从表。
- Oracle 对 SQL92 支持较好，而 MySQL 则不支持 SQL92 的外连接。

`#左外连接`
`SELECT last_name,department_name`
`FROM employees ,departments`
`WHERE employees.department_id = departments.department_id(+);`
`#右外连接`
`SELECT last_name,department_name`
`FROM employees ,departments`
`WHERE employees.department_id(+) = departments.department_id;`

- 而且在 SQL92 中，只有左外连接和右外连接，没有满（或全）外连接。



### SQL99: 语法实现多表查询

#### 基本语法 (JOIN ON)

使用**JOIN…ON**子句创建连接的语法结构：

`SELECT table1.column, table2.column,table3.column`
`FROM table1`
`JOIN table2 ON table1 和 table2 的连接条件`
`JOIN table3 ON table2 和 table3 的连接条件`

**语法说明：**

- 可以使用 ON 子句指定额外的连接条件。
- 这个连接条件是与其它条件分开的。
- ON 子句使语句具有更高的易读性。
- 关键字 JOIN、INNER JOIN、CROSS JOIN 的含义是一样的，都表示内连接



#### 内连接 (INNER JOIN)

语法：

`SELECT 字段列表`
`FROM A表 INNER JOIN B表`
`ON 关联条件`
`WHERE 等其他子句;`



#### 左外连接 (LEFT OUTER JOIN)

语法：

`#实现查询结果是A`
`SELECT 字段列表`
`FROM A表 LEFT JOIN B表`
`ON 关联条件`
`WHERE 等其他子句;`



#### 右外连接 (RIGHT OUTER JOIN)

语法：

`FROM A表 RIGHT JOIN B表`
`ON 关联条件`
`WHERE 等其他子句;`



#### 满外连接 (FULL OUTER JOIN)

- 满外连接的结果 = 左右表匹配的数据 + 左表没有匹配到的数据 + 右表没有匹配到的数据。
- SQL99是支持满外连接的。使用FULL JOIN 或 FULL OUTER JOIN来实现。
- 需要注意的是，**MySQL不支持FULL JOIN**，但是可以用 LEFT JOIN UNION RIGHT join代替。

`SELECT last_name,department_name FROM employees e FULL OUTER JOIN departments d ON e.department_id = d.department_id;`



### UNION的使用

合并查询结果 利用UNION关键字，可以给出多条SELECT语句，并将它们的结果组合成单个结果集。合并时，两个表对应的列数和数据类型必须相同，并且相互对应。各个SELECT语句之间使用UNION或UNION ALL关键字分隔。

语法：

`SELECT column,... FROM table1`
`UNION [ALL]`
`SELECT column,... FROM table2`

**UNION操作符**

UNION 操作符返回两个查询的结果集的并集，去除重复记录。

**UNION ALL操作符**

UNION ALL操作符返回两个查询的结果集的并集。对于两个结果集的重复部分，不去重。

> 注意：执行UNION ALL语句时所需要的资源比UNION语句少。如果明确知道合并数据后的结果数据不存在重复数据，或者不需要去除重复的数据，则尽量使用UNION ALL语句，以提高数据查询的效率

`#UNION方式1`
`SELECT * FROM employees WHERE email LIKE '%a%' OR department_id>90;`

`#UNION方式2`
`SELECT * FROM employees WHERE email LIKE '%a%'`
`UNION`
`SELECT * FROM employees WHERE department_id>90;`



`
UNIONALL方式`
`SELECT id,cname FROM t_chinamale WHERE csex='男'`
`UNION ALL`
`SELECT id,tname FROM t_usmale WHERE tGender='male';`



### 7种SQL JOINS的实现

`#中图：内连接 A∩B`
`SELECT employee_id,last_name,department_name`
`FROM employees e JOIN departments d`
`ON e.department_id = d.department_id;`



`#左上图：左外连接`
`SELECT employee_id,last_name,department_name`
`FROM employees e LEFT JOIN departments d`
`ON e.department_id = d.department_id;`



`#右上图：右外连接`
`SELECT employee_id,last_name,department_name`
`FROM employees e RIGHT JOIN departments d`
`ON e.department_id = d.department_id;`



`#左中图：A - A∩B`
`SELECT employee_id,last_name,department_name`
`FROM employees e LEFT JOIN departments d`
`ON e.department_id = d.department_id`
`WHERE d.department_id IS NULL`



`#右中图：B-A∩B`
`SELECT employee_id,last_name,department_name`
`FROM employees e RIGHT JOIN departments d`
`ON e.department_id = d.department_id`
`WHERE e.department_id IS NULL`



`#左下图：满外连接`

`#*左中图 + 右上图 A∪B*`

`SELECT employee_id,last_name,department_name`

`FROM employees e LEFT JOIN departments d`

`ON e.department_id = d.department_id`

`WHERE d.department_id IS NULL`

`UNION ALL	#没有去重操作，效率高`

`SELECT employee_id,last_name,department_name`

`FROM employees e RIGHT JOIN departments d`

`ON e.department_id = d.department_id;`



`#右下图`
`#左中图 + 右中图	A ∪B- A∩B 或者 (A -	A∩B) ∪ （B - A∩B）`
`SELECT employee_id,last_name,department_name`
`FROM employees e LEFT JOIN departments d`
`ON e.department_id = d.department_id`
`WHERE d.department_id IS NULL`
`UNION ALL`
`SELECT employee_id,last_name,department_name`
`FROM employees e RIGHT JOIN departments d`
`ON e.department_id = d.department_id`
`WHERE e.department_id IS NULL`