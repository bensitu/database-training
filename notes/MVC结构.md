

我们在 com.example 目录下新建四个目录，分别是 controller、dao (Mapper)、entity (domain)、service。

- controller层负责具体的业务模块流程的控制
- entity层用于存放我们的实体类，与数据库中的属性值基本保持一致，实现set和get的方法
- dao层主要是做数据持久层的工作，负责与数据库联络，封装了增删改查基本操作
- service层主要负责业务模块的逻辑应用设计，具体要调用到已定义的DAO层的接口

然后在 resource 目录下新建 mapper 目录。这个 mapper 目录是用来存放 SQL 语句的地方。



MVC 框架，即 model-view-controller 三层架构。

model层=entity层，与数据库的数据表对应

mapper层=dao层，对数据库进行数据持久化操作

view层是做前端界面的展示，controller层做业务模流程块的控制

不管是什么框架，我们很多时候都会与数据库进行交互。如果遇到一个场景我们都要去写SQL语句，那么我们的代码就会很冗余。所以，我们就想到了把数据库封装一下，让我们的数据库的交道看起来像和一个对象打交道，这个对象通常就是DAO。当我们操作这个对象的时候，这个对象会自动产生SQL语句来和数据库进行交互，我们就只需要使用DAO就行了。**SQL语句通常写在mapper文件里面的**

Service层是建立在DAO层之上的，建立了DAO层后才可以建立Service层，而Service层又是在Controller层之下的，因而Service层应该既调用DAO层的接口，又要提供接口给Controller层的类来进行调用，它刚好处于一个中间层的位置。每个模型都有一个Service接口，每个接口分别封装各自的业务处理方法。



用户从页面前端，也就是我们所说的 view 层进行查询访问，进入到 controller 层找到对应的接口，接 着 controller 进行对 service 层进行业务功能的调用，service 要进入 dao 层查询数据，dao 层调用 mapper.xml 文件生成 sql 语句到数据库中进行查询。

在数据库中查询到数据，dao 层拿到实体对象的数据，接着交付给 service 层，接着 service 进行业务 逻辑的处理，返回结果给 controller，controller 根据结果进行最后一步的处理，返回结果给前端页 面。

创建一个访问用户信息的流程为：

entity->dao->mapper->service->controller，这里 mapper 指的是存放 SQL 语句的 xml 文件。

OR

domain -> mapper -> service -> controller