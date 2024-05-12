## this使用细节

1. this关键字可以用来访问本类的属性、方法、构造器
2. this用于区分当前类的属性和局部变量
3. 访问成员方法的语法：this(参数列表)；只能在构造器中访问另外一个构造器，并且在构造器的第一行。
4. this不能在类定义的外部使用，只能在类定义的方法中使用

## 面向对象的基本特征（封装、继承、多态）

#### 封装

------

**概念**：封装，把客观事物封装成抽象的类，并且类可以把自己的数据和方法只让可信的类或对象操作，对不可信的进行信息隐藏。

**规则**：

1. 将类的某些信息隐藏在类的内部，不允许外部的程序直接访问。
2. 通过该类提供的方法来实现对隐藏信息的操作和访问。

**封装的实现**

1. 修改私有属性（设为private）
2. 创建getter/setter方法（设为public用于属性的读写）
3. 在getter/setter方法中加入属性控制语句（对属性的合法性进行判断)

#### 继承

------

**概念**：可以使子类具有父类的属性和方法，还可以在子类中重新定义、追加属性和方法

**格式**：public class 子类名 extends 父类名{}

**父类**：也称基类、超类

**子类**：派生类

将相同的属性和方法定义到一个基类中，不同的属性和方法放到子类中，解决代码的冗余性。

**优点**：提高了代码的复用性，提高了代码的维护性，如果代码方法需要修改，直接在父类中修改。

**缺点**：增加了类的耦合性，当父类改变时，子类也会随着父类改变，削弱了子类的独立性。

继承中的子类成员访问特点：

1. 子类局部范围->子类成员范围->父类范围查找->如果没有，报错。

super：代表父类存储空间的标识，可以理解为父类对象的引用

this：代表子类对象的引用。

super关键字可以用来访问父类的属性、方法、构造函数。

继承中构造方法的访问特点：

1. 子类中所有的构造方法默认都会访问父类的无参构造方法。
2. 因为子类会继承父类中的数据和方法，可能还会使用父类中的数据，所以子类初始化前，需要对父类进行初始化。
3. 每个子类构造方法的第一句默认都是super()

如果父类中没有无参构造方法，只有带参构造方法，怎么解决？

1. 通过super关键字显示调用父类的有参构造方法
2. 父类中单独定义自己的无参构造方法。

继承中的子类成员方法访问特点：

子类成员范围->父类成员范围。

**方法重写**：

概念：当子类中出现了和父类一模一样的方法，子类有自己独特的方法，就可以通过重写父类中的方法，这样既延续了父类的功能，又定义了子类自己的特有内容。

通过@override注解可以检查子类中的方法是否可以重写父类方法。

1. 父类中的私有方法，子类是无法重写的。父类中的私有方法无法被子类继承。
2. 子类方法访问权限不能比父类方法访问权限高。

**权限修饰符**：	同一个类	同一个包  不同包的子类	不同包的非子类

private私有		ok				no			no						no

default默认		ok				ok			no						no

protected保护	ok				ok			ok						no

public公开			ok				ok			ok						ok

权限可以用于修饰属性、方法、类。

java中继承注意事项：

1. java中类只支持单继承，不支持多继承（一个子类不能有两个父类）
2. java中类支持多层继承。

包：本质就是一个文件夹，作用对类实现分类管理。

类的名称组成：包的名称+类的名称（类的全限定名）

在相同包下，类的名称不可以重复；在不同包下，类的名称可以重复。

同一个包下不需要导包，不同包下需要导入包，如果需要导入多个，可以带*。也可以直接在类名前面加上包名的方式引入包中的类。

**状态修饰符**:

1.final（最终态）

2.static（静态）

final关键字修饰的类、成员属性、成员方法

特点：

1. 修饰变量：该变量的值，不能被修改，必须初始化
2. 修饰方法：该方法，不能被重写
3. 修饰类：该类，不能被继承

final关键字修饰的局部变量

基本数据类型：final修饰的基本数据类型的值不能够被修改

引用是数据类型：final修饰的引用数据类型地址不能够发生变化，但是引用类型的地址里面的值是可以发生变化的。

static可以修饰成员方法、成员变量。

static修饰的特点：被类的所有对象共享访问。

获取：通过类名或者对象，但是所有对象共享一个静态成员。

**static访问特点**

非静态成员方法

1. 能够访问静态的成员变量
2. 能够访问非静态的成员变量
3. 能够访问静态的成员方法
4. 能够访问非静态的成员方法

静态的成员方法

1. 能够访问静态成员变量，但是不能直接访问成员变量
2. 能够访问静态成员方法，但是不能直接访问成员方法

static关键字对的用途：

方便在没有创建对象的情况下调用（方法、变量）

被static关键字修饰的方法或者变量不需要依赖于对象来进行访问，只要类被加载了，就可以通过类名进行访问。

statci可以用来修饰类的成员方法、类的成员变量，另外也可以编写static代码块来优化程序性能。

static关键字的应用场景：

java中的常量(Constant)

常量：定义好之后，值不能被修改；常量名称全部都是大写，快捷键ctrl+shift+u;常量可以直接访问类名.

**main方法**

1. main方法是Java虚拟机在调用，作为主程序的运行入口 HotStop(TM)调用
2. Java虚拟机需要调用类的main()方法，所有该方法的访问权限必须是public（因为调用的时候java虚拟机和main方法不在同一个类）
3. java虚拟机执行main方法的时候不必创建对象，所以该方法必须是static
4. main方法接受String类型的数组参数，该数组中保存执行java命令时传递给执行的类的参数。

main方法参数作用：方便开发者 在以后运行java程序时 向main方法注入一些参数。

#### 多态

------

**多态的概述**：同一个对象，在不同的时刻表现出来的不同形态。

多态的前提和体现：

1. 有继承/实现关系(两个类以上)
2. 方法重写（子类重写父类方法）
3. 有父类引用指向子类对象

多态的访问特点：

成员变量、；编译看父类，执行看父类；

成员方法：编译看父类，执行看子类；

成员变量和成员方法的访问特点不一样，因为成员变量没有重写方法，而成员方法有。

多态的优缺点：

多态的好处：提高了程序的扩展性

具体体现：定义方法的时候，使用父类型作为参数，将来使用的时候，使用具体的子类型参与操作

多态的弊端：不能使用子类的特有功能。

多态中的转型：

1. 向上转型（多态机制）：从子到父 父类引用指向子类对象
2. 向下转型（强转）：从父到子 父类引用转向子类对象

#### 抽象类概述

------

在Java中，一个没有方法体的方法应该定义为抽象方法，而类中如果有抽象方法，该类必须为抽象类，抽象类和抽象方法用abstract关键字来修饰。

抽象类：abstract class 类名{}

抽象方法：public abstract void eat();//抽象方法中没有方法体。

**抽象类特点**

1. 抽象类中不一定有抽象方法，但是有抽象方法的类必须为抽象类
2. 抽象类不能实例化
3. 抽象类由具体的子类进行实例化；
4. 子类必须对父类（抽象类）中的所有抽象方法进行重写
5. 在抽象类中可以定义非抽象方法
6. 子类如果不重写抽象类中的抽象方法，则该类还是为抽象类
7. 抽象类中可以有构造方法，用于子类访问父类时的数据初始化。

抽象类案例：

需求：加入我们在开发一个系统时需要对员工类进行设计，员工包含3个属性：姓名、工号以及工资(salary)。

经理(Manager)也是员工，除了含有员工的属性外，另外还有一个奖金（bouns）的属性。

headman(组长)也是员工

然后定义工作的方法。

请使用继承的思想设计出员工类和经理类。

abstract**关键字不能和哪些关键字共存**

private	冲突	abstract的方法必须被重写，而private不能被继承

final	冲突	final修饰的方法、变量都不能修改，而abstract修饰的方法必须重写

static	不能共存 无意义 statci是静态的，abstract方法中无方法体，无法调用

#### 接口

------

**接口概念**：

接口就是一种公共的规范标准，只要符合规范标准，大家都可以通用

Java中的接口更多的体现在对行为的抽象！

1. 接口 用关键字interface修饰
2. 类实现接口用 implements表示
3. 接口不能够实例化：参照多态的方式，通过实现类对象实例化，这叫接口多态。
4. 多态的形式：具体类多态、抽象类多态、接口多态
5. 多态的前提：有继承或者实现关系；有方法重写‘有父（类/接口引用）指向（子/实现）类对象
6. 接口的实现类：要么重写接口中的所有抽象方法、要么是抽象类

**接口成员特点**：

1. 成员变量只能是常量，默认修饰符 public static final
2. 成员方法只能是抽象方法， 默认修饰符 public abstract
3. 接口没有构造方法，因为接口主要对行为进行抽象，没有具体存在，一个类没有父类，默认继承Object类
4. 在jdk8以后，可以在接口中定义非抽象方法，使用default关键字。

**类和接口的区别**

1. 类和类的继承关系（一个类只能够继承一个父类 不能够多继承n多个不同的父类）继承关系，只能单继承，但是可以多层继承
2. 类和接口的实现关系（一个类可以实现n多个不同的接口)实现关系，可以单实现，也可以多实现，还可以在继承一个类的同时实现多个接口
3. 接口和接口继承的关系（一个接口是可以继承n多个不同的接口）继承关系，可以单继承，也可以多继承。

**抽象类和接口的区别**

1. 成员区别：抽象类：变量 常量；有构造方法；有抽象方法，也有非抽象方法。接口：常量，抽象方法(在Jdk8开始，可以在接口中定义 非抽象方法)
2. 关系区别：类与类 继承单继承；类与接口 实现，单实现和多实现；接口与接口 继承，单继承和多继承
3. 设计区别：抽象类 对类抽象，包括属性行为（对事物的抽象）；接口 对行为抽象，主要是行为（对行为的抽象）

**内部类**

概念：就是在一个类中定义一个类，就是内部类。

比如：在一个类A的内部定义了一个类B,类B就称为内部类，类A相应的称为外部类

内部类访问特点：

内部类可以直接访问外部类对的成语，包括私有

外部类要访问内部类的成员，必须创建内部类对象

**内部类的分类**

1. 成员内部类
2. 静态内部类
3. 方法内部类
4. 匿名内部类

有时候也分为成员内部类（成员内部类、静态内部类），局部内部类（方法内部类、匿名内部类）

**成员内部类**

按照内部类在类中定义的位置不同，分为以下两种格式：

1. 成员位置（成员内部类 例如：静态内部类）
2. 局部位置（局部内部类 例如：匿名内部类）

成员内部类，外界如何创建对象使用呢？

格式：外部类名.内部类名 对象名 = 外部类对象.内部类对象

例如：MayiktA.MayktB mayiktB = new MayiktA().new MayiktB();

在实际开发中是不会这样使用对的。因为一般内部类就是不让外界直接访问的。成员内部的常见修饰符 private为了保证数据的安全性。

**静态内部类**

有static关键字修饰的内部类为静态内部类；

静态内部类访问外部类的静态成员变量或方法必须是静态的。

访问格式：new MayiktA.MayiktB()

**局部内部类**

局部内部类是在方法中定义的类，所以外界是无法直接使用，需要在方法内部创建对象并使用；该类可以直接访问外部类的成员，也可以访问方法内部的局部变量

**匿名内部类**

本质：是一个继承了该类（子类）或者实现了该接口的（实现类）匿名对象

匿名内部类可以new接口（实现类）或者是抽象类

使用匿名内部类，就不需要创建实现类或者子类。

匿名内部类底层实现原理：编译器在编译阶段，帮我们实现了接口或者抽象类的null名的实现类或子类，并重写了抽象方法。

### javaseAPI及异常

------

**API**

1. API就是应用程序编程接口。
2. Java中的API：指的就是JDK中提供的各种功能的Java类，这些类将底层的实现封装了起来，我们不需要关系这些类是怎么实现的，只需要学习这些类如何使用即可，我们可以通过帮助文档来学习这些api如何使用。

**Object类**

Object是类层次结构的根，每个类都可以将Object作为超类，所有的类都直接或间接的继承Object。

构造方法：public Object()

在顶级父类（Object类中）只有无参构造方法

常见方法：clone()、getClass()、wait()、notify()、hashCode()、toString()、equals()。

**toString()方法**

该方法是通过Object类的getClass和getName方法获取类名并用@符号与生成的哈希值转换为十六进制拼接在一起。如果在子类中重写了toString方法，根据多态的访问机制，就会执行子类中的toString方法。

**String类**

String 保存字符串的底层原理：在JDK8以前是通过字符数组实现，在JDK9及以后使用的是字节数组实现。

ASCII在java中，一个字符无论是英文还是中文字符都是占用一个字节。

jdk9为何要将String的底层实现由char[]改为了byte[]

答案：节省String占用jvm的内存空间

**equals()方法**

Object中的equals()可以比较两个对象是否相对，如果相等，则返回true,否则false.

可以重写父类中的equals()方法 比较两个对象的成员属性是否相同。

注意：调用equals方法的对象不能为空。

**instanceof关键字**

instanceof关键字返回一个布尔值来指出，某个对象是否时某个特定类或者是该特定类的子类的一个实例。

1. 如果object是class的一个实例，则instanceof运算符返回true。如果object不是指定类的一个实例，或者object是null，则返回false。class可以是类，可以是接口。
2. instanceof在java的编译状态和运行状态是有区别的：在编译状态中，class可以是object对象的父类，自身类，子类。在这三种情况下java编译不会报错。在运行状态中，class可以是object对象大的父类，自身类，不能是子类。在前两中情况下为true,最后一种为false。但是class为子类时编译不会报错，运行结果为false。（大致就是判断表达式：class 变量 = (class)object的引用是否成立）。

**JVM元空间**

JAVA虚拟机JVM，编译器将java源代码编译为class文件，然后通过类加载器读取class文件中的信息到JVM内存中。

1. jdk1.8以前的HoSpot JVM有方法区，也叫永代区(permanent generation)，jdk1.8开始改为元空间。
2. 方法区用于存放已被虚拟机加载的类信息、常量、静态变量，即编译器编译后的代码
3. jdk1.7开始了方法区的部分移除：符号引用(Symbols)移至native heap，字面量和静态变量移至java heap。
4. 在jdk1.7以后，将字符串常量池 从方法区改为堆中存放。

通过反汇编来查看方法区的信息：javap -p -v 字节码文件名

在方法区会通过一个表格来记录类信息，

**Math类**

1. java.lang.Math(类)：Math包含执行基本数字运算的方法
2. 它不能创建对象，它的构造方法被“私有”了。因为它内部都是静态方法，通过类名直接调用即可。

常见方法abs()、ceil()、floor()、round()、max()、min()、pow()、random()。

**System类**

在java.lang包下

常用字段：in、err、out。

常用方法：exit()退出当前运行的JVM，0正常退出，非0异常退出

currentTimeMills()返回当前时间，以毫秒为单位，以1970.1.1为参考

以上方法都是静态的。

**Arrays类**

位置：java.util.Arrays ，此类中包含用来操作数组的各种方法，比如排序和搜索等。其所有方法都是静态方法。

常见方法：sort()，toString()方法

sort()：排列 如果是数值，默认按照从小到大升序排列，如果是字符串，默认按照字母的升序

toString()：转换为字符串类型。

**工具类**

工具类设计思想：

1. 构造方法用private修饰，外部无法new
2. 成员方法使用public static修饰 通过类名称访问

**基本数据类型包装类**

java中基本数据类型：四种整数类型(byte、short、long、int)、两种浮点类型（float、double）、一种字符类型(char)、布尔类型(boolean)

需求：int类型范围? 最小 -2147483647 最大 +2147483647

目的用于基本数据类型与字符串之间的转化。

基本数据类型对应的包装类：

基本数据类型	包装类

byte					Byte

short					Short

int						Integer		intValueOf()

long 					Long			longValueOf()

float					 Float

double				 Double

char					 Character

boolean				Boolean		booleanValueOf()

**Integer用法**

Integer a = new Integer(30)//jdk9以后不推荐使用

使用的valurOf()方法。

**int类型和String类型相互转换**

基本类型包装类最常见的操作就是：用于基本类型与字符串之间的转换。

int转换为String

public statci valueOf(int i)：返回int参数的字符串串表示形式，该方法是String类中的方法。

String 转换为int

public static parseInt(String s)：将字符串转换为int类型，该方法是Integer中的方法。

**int与Integer的区别**

1int属于基本数据类型 Integer属于int包装 对象 类

2基本数据类型 存放在栈空间中 -- 局部变量表（方法）

3Integer包装类 属于对象 存放在 堆空间

4输出integer底层 会走integer包装类中toString方法 属性对应的基本数据类型

5Integer 属于包装类 默认是为null  基本数据类型默认为0

int基本数据类型默认值是0，引用数据类型Integer默认值是null。

使用Integer integer = 29，Integer封装类底层会根据值调用其valueOf()方法，通过构造方法设置对象值为29并返回，直接在控制台输出，会调用Integer的toString方法输出。包装类输出时会使用toString方法。

包装类 引用传递

基本数据类型 值传递

实际开发中包装类 比较多 实体类

**java中基本数据类型和包装类的区别**

1. 包装类是对象，拥有方法和字段，对象的调用都是通过对象的引用地址；基本数据类型不是
2. 声明方式不同：基本数据类型不需要new关键字；包装类型需要new在堆内存中进行new来分配内存空间。
3. 存储位置不同：基本数据类型直接将值保存在值栈中；包装类型是把对象放在堆中，然后通过对象来调用
4. 初始值不同：int的初始值为0、boolean的初始值为false;包装类型的初始值为null
5. 包装类型是引用的传递，基本类型是值的传递。

**java装箱和拆箱**

装箱：就是自动将基本数据类型转换为包装器类型；

拆箱：就是自动将包装器类型转换为基本数据类型；

Integer i = 5装箱

int j = i;拆箱

在装箱的时候自动调用的是Integer的valueOf(int)方法。

在拆箱的时候自动调用的是intValue方法

Integer j = 0;

j += 1;

在j+1时，进行拆箱，将Integer转换为基本数据类型int通过intValue方法，j+1赋值给j，将基本数据类型自动转换为Integer类型通过Integer的valueOf方法

**字符串中的数据排序**

需求：有一个字符串：“97，16，36，18，50”，输出结果“16，18，36，50，97”

思路：

1. 将字符串按照空格分割成一个字符串数组
2. 将其中的每一个元素准换为数字
3. 将转换后的数字保存到一个整形数组中
4. 使用Arrays提供的排序方法或者使用我们自己写的排序方法对数组进行排序

**Date类**

Date代表了一个特定的时间，精确到毫秒，不要引用java.sql下的date类，而是java.util下的date类

CST表示中国标准时间

构造方法：

| 方法名称               | 说明                                                         |
| ---------------------- | ------------------------------------------------------------ |
| public Date()          | 分配一个Date对象，并初始化，以便代表它所分配的时间，精确到毫秒 |
| public Date(Long Date) | 分配一个Date对象，并将其初始化为表示标准基准时间起指定的毫秒数GMT格林威治时间 |

常用方法

| 方法名称                       | 说明                                                  |
| ------------------------------ | ----------------------------------------------------- |
| public long getTime()          | 获取的日期对象时间从1970.01.01 00:00:00到现在的毫秒值 |
| public void setTime(Long time) | 设置时间，给的是毫秒值                                |

**格式化日期**

SimpleDateFormat是用于以区域设置敏感的方式格式化和解析日期，它允许格式化（日期文本）（文本日期）

1. 对时间日期进行格式化处理
2. 把Date对象转化为年月日时分秒格式字符串
3. 把字符串转化为Date对象

常用的模式字母及对应关系如下表：

| 模式 | y    | M    | d    | h    | H    | m    | s    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 字母 | 年   | 月   | 日   | 时   | 时   | 分   | 秒   |

**日期工具类**

1. 需求：定义一个日期工具类(DateUitls)包含两个方法：把日期转换为指定格式的字符串；把字符串解析为指定格式的日期
2. 工具类设计 构造方法私有化、方法提供public statci修饰 静态方法访问

**Calendar日历类**

Calendar为某一时刻和一组日历字段之间的转换提供了一些方法，并为操作日历字段提供了一些方法。Calendar提供了一个类方法getInstance用于获取Calendar对象。

Calendar是一个抽象类，不能直接new

其日历字段已使用当前日期和时间初始化：

获取年月日

c.get(Calendar.YEAR);//获取年

c.get(Calendar.MONTH)+1;//获取月

c.get(Calendar.DATE);//获取日

c.add(Calendar.Year,-2)//修改年

c.set(2020,8,23)//设置日历日期

**二月份有多少天**

需求：获取任意一年的二月有多少天

注意：平年2月28天，闰年2月29天

平年2月28天，平年姨奶奶365天；闰年2月29天，闰年一年366天。

思路：

1. 键盘录入任意年份

2. 使用Calendar设置日历对象的年月日

3. 年：来自于键盘录入

4. 月：设置为3月，月份是从0开始的，所以设置的值是2

5. 日：设置为1日

6. 3月1日往前推一天，就是2月的最后一天。

   ------

   

**异常**

1. 异常：就是程序执行报错或者出现了不正常现象
2. 如果程序出现了问题，我们没有做任何处理，jvm最终会做默认处理，将异常的名称，异常的原因及异常出现的位置等信息输出在控制台。

如果发生异常不处理，会中断程序的继续运行，返回异常的原因和位置。

**异常捕获**：

try{

可能出现异常的代码;

}catch(异常类名 变量名){

异常的处理代码;

}

执行流程：

执行流程：

程序从try里面的代码开始执行，出现异常，会自动生成一个异常类对象，该异常对象将被提交给java运行时系统。

当java运行时系统接收到异常对象时，会到cathc中去找匹配的异常类，找到后进行异常的处理，执行完毕之后，程序还可以继续向下执行。

**Throwable**

Throwable类是Java语言中所有错误和异常的超类。

Throwable的成员方法：

| 方法名                      | 说明                            |
| --------------------------- | ------------------------------- |
| public String getMeaasge    | 返回此throwable的详细消息字符串 |
| public String toString      | 返回此可抛出的简短描述          |
| public void printStackTrace | 把异常的错误信息输出在控制台    |



**编译时异常和运行时异常的区别**：

Java中的异常分为两大类：编译时异常和运行时异常，也被称为受检查异常和非受检查异常所有的RuntimeException类及子类都被称为运行时异常，其他的异常都是编译时异常。

编译时异常：必须显示处理，否则程序会发生错误，无法通过编译。必须进行try catch进行捕获

运行时异常：无需显示处理，也可以通过编译时异常一样处理。运行时异常，有可能发生异常。



**异常处理之throws**

Java允许在方法的后面使用throws关键字对外声明该方法可能发生异常，这样调用者在调用该方法时，就明确地知道该方法有异常，并且必须在程序中对异常进行处理，否则编译无法通过。

在定义方法时抛出的是Exception异常，需要捕获或抛出；如果抛出的是属于运行时异常，则不需要显示的捕获。

**自定义异常**

自定义异常，继承Exception即可。如果想要自定义运行时异常，则继承Runtime即可。

### Java集合框架

1. 集合框架API知识 List/Set/Map集合
2. 常见数据结构 数组/链表/队列/树
3. 集合源代码解读List/Set/Map



集合概念：存放多个元素内容

框架：底层封装好 提供简单的api 给开发人员使用

集合框架：JDK帮我们封装好的。

**集合类特点**：提供一种存储空间可变的存储模型，存储的数据容量可以发生改变。

![image-20230327160125932](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230327160125932.png)



**在集合框架中单列与多列的区别**

单列----------一行就只有一列数据

多列----------一行就两列数据	key第一列	value第二列

**集合框架组成部分**

1. Collection存放单列数据 

   ###List接口 存放数据可以运行重复

   ######ArrayList 底层基于数组数据结构实现

   ######LinkedList 底层基于链表数据结构实现

   ###Set接口 不允许存入重复数据

   ######HashSet 不允许存入重复数据 底层基于Map集合实现

   Set集合对数据去重

2.Map(存入队列数据 key value)

####HashMap 底层 基于数组+链表实现(jdk1.7)	(jdk1.8)基于数组+链表+红黑树实现

####HashTable

**ArrayList集合常见方法**

| 方法名称                           | 说明                             |
| ---------------------------------- | -------------------------------- |
| public boolean add(E e)            | 将元素插入到指定位置的arrylist中 |
| public E remove(int index)         | 删除arraylist里的某个元素        |
| public E set(int index, E element) | 替换arraylist中指定索引的元素    |
| public E get(int index)            | 通过索引值获取arraylist中的元素  |
| public int size()                  | 返回arraylist元素数量            |

在集合中使用<泛型>，只能使用引用类型，基本数据类型使用包装类型。

1. ArrayList类是一个可以动态修改的数组，与普通数组的区别就是没有固定大小的限制。
2. ArrayList继承了AbstractList，并实现了List接口
3. ArrayList类位于java.util包中，使用前需要导入
4. 初始化：ArrayList<E>  objectName = new ArrayList<>();E：泛型数据类型，用于设置objectName的数据类型，只能为引用数据类型。ArrayList中的元素实际上是对象，在以上实例中，数组列表元素都是字符串String类型。如果我们要存储其他类型，而<E>只能为引用数据类型，这时我们就需要使用到基本类型的包装类。

List接口下 实现类 arrayList LinkedList 存入数据 都是保证有序性 允许存入数据

可以重复







**学生管理系统**

设计思路：

1. 需要定义学生类 成员属性 学号 姓名 年龄 地址
2. 容器ArrayList集合存入Student对象;
3. 定义StudentManager对Student对象集合实现增删改查
4. 备注：学生的学号 存入在我们 学生对象集合中 不允许重复



**Scanner使用注意**

问题：

在调用nextLine()函数前调用了Scanner的另一个函数nextInt()（或是nextDouble()）。出现这种情况的原因是两个函数的处理机制不同，nextInt()函数在缓冲区中遇到“空格”、“回车符”等空白字符时会将空白字符前的数据读取走，但空白字符不会被处理掉，而nextLine()函数是在缓冲区中读取一行数据，这行数据以“回车符”为结束标志，nextLine()会把包括回车符在内的数据提走。所以nextInt()后的nextLine()函数并非读取不到数据，因为nextInt()将“回车符”留在了缓冲区，nextLine()读取时遇到的第一个字符便是“回车符”，所以直接结束了
解决方法：

避免在nextLine()之前调用nextInt()等函数，可以统一使用nextLine()来读取数据，之后再进行类型转换。
在要使用nextLine()前先调用一次nextLine()，这样留在缓冲区的“回车符”就会被处理掉，这时第二个nextLine()函数可以正常读取到数据。



**Collection集合的遍历**

概念：Iterator:迭代器，集合的专用遍历方式

1. Iterator<E> iterator()返回在此collection的元素上进行迭代的迭代器
2. boolean hasNext() 如果仍有元素可以迭代，则返回true
3. E.next()返回迭代的下一个元素

iterator.next()方法是通过计数器count,get(count++)调用实现。

**手写Iterator迭代器**

声明一个next()方法和hasNext()方法，next()方法中返回list.get(count++)。

```java
public class feiYuIterator {
    private List<Object> list;//集合
    private int count =0;//计数器初始值为0

    public feiYuIterator(List list) {
        this.list = list;
    }

    public Object next() {

        if (list == null){
            throw new feiYuException("list is null");
        }
        if (count>=list.size()){
            throw new feiYuException("无法向下继续获取元素了");
        }
        return list.get(count++);
    }

    public boolean hasNext(){
        return count != list.size();
    }
}

```

**List集合概念和特点**

List集合概述：

1. 有序集合，用可以精确的控制列表中每个元素的插入位置。可以通过整数索引访问元素，并搜索列表中的元素。
2. 与set集合不同，List集合通常允许重复的元素。
3. List集合的特点：有序：存储和取出的元素顺序一致；可重复：存储的元素可以重复

**listIterator**

1. 列表迭代器：ListIterator listIterator():List集合特有的迭代器；该迭代器继承了Iterator迭代器，所以可以直接使用hasNext()和next()方法。
2. 特有功能：Object previos()获取上一个元素；boolean hasPrevious():判断有没有上一个元素
3. 注意：ListIterator可以逆向遍历list,前提是先正向遍历list，才能逆向遍历。一般情况下不使用。



**增强型for循环（for each）**jdk1.5以后。

增强for循环是专门用来遍历数组和集合的。它的内部原理其实是个Iterator迭代器，所以在遍历的过程中，不能对集合中的元素进行增删操作。

可以使用三种方式遍历集合List

1. 传统for循环
2. 迭代器
3. 增强for each循环

**泛型**（generics）

1. Java泛型是jdk5中引入的一个新特性，泛型提供了编译时类型安全检测机制，该机制允许程序员在编译时监测到非法的类型。
2. 早期的时候，使用Object来代表任意类型。但是这样在向上转型的是没有问题，但是在向下转型的时候存在类型转换的问题，这样的程序其实是不安全的。所以Java在jdk5之后提供了泛型来解决这个问题
3. 泛型的本质是参数化类型，也就是说操作的数据类型被指定为一个参数
4. 泛型是一种把类型的明确工作推迟到创建对象或者调用对象方法的时候采取明确的特殊类型。

注意：类型参数只能代表引用类型，不能是原始类型。泛型可以使用在 方法、接口、类分别称作：泛型类、泛型方法、泛型接口

泛型类：

```java
public class feiYu<T> {
    private T t;

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }
}
```

泛型方法：

```java
/*泛型方法*/
    public <T> T show(T t){
        return t;
    }
```

泛型接口：

```java
public interface fyy<E> {
    void add(E e);
    E get(int index);
}

```

**类型通配符**

1. 类型通配符<?>一般用于接受使用
2. List<?>:表示元素类型未知的list,它的元素可以匹配任何类型。
3. 带通配符的List仅表示它是各种泛型List的父类，并不能把元素添加到其中。
4. 类型通配符上限：<? extends 类型>List<?extends MayiktParent>:它表示的类型是MayiktParent或者子类型
5. 类型通配符下限：<?super类型> List<?super MayiktParent>:它表示的类型是MayiktParent或者其父类型。



**泛型原理 底层 使用擦除机制**

在编译阶段限制传递的类型。

擦除机制：将一个List集合 泛型赋值给一个没有使用到泛型List集合 直接去除泛型。

泛型 是在编译阶段限制传递的类型 在运行阶段都是擦除  底层class

文件在运行 里面是没有 泛型。

**ArrayList 底层是如何实现的？**

底层基于数组实现 

1.根据index 下标查询效率非常高 时间复杂度o(1) 

2.底层基于数组实现扩容 删除 增删效率是非常低。

底层基于数组实现 原生数组没有扩容的机制 当增加的元素超过底层最开始默认初始化的容量10 就会触发扩容机制 新创建一个容量更大的数组 并将原来数组中的内容拷贝到新数组中。

3.删除 需要遍历找到对应元素 删除之后 需要将元素位置向前移动一位。

4.修改 根据index下标修改 效率是非常高的，只需要一次 时间复杂度o(1)

提供了一个get(index)方法参数为下标。

时间复杂度

o(1)：基于数组的小标index查询，只需要查询一次 

o(n)：从头到尾查询 从头遍历查询。

```java
public class feiYuArrayList<E> {
    /*底层存放集合需要存放元素*/
    private Object []elementData;
    private int size;//0

    public feiYuArrayList() {
        this.elementData = new Object[10];
    }

    public void grow(){

    }

    public void add(E e){
        elementData[size++] = e;//size=0
    }
}
```

**ArrayList与Vecotr的区别：**

相同的：

1. ArrayList和Vector 默认初始化容量=10
2. 底层都是基于数组实现
3. List接口下子类

不同点：

1. ArrayList 线程不安全 Vector 线程是安全的
2. ArrayList每次扩容是原来的1.5倍
3. Vector每次扩容是原来的2倍
4. Vector 可以设置每次扩容的容量。
5. ArrayList 懒加载的形式 初始化容量 Vector 直接通过构造函数初始化容量为10

总结：

Arraylist底层是基于数组实现

add方法如何实现？

1. 判断集合容量是否装得下
2. 如果装不下则扩容 是以1.5倍 将原来的旧数组拷贝到新数组中

get方法如何实现？

1. 根据index下标查询效率高

Remove方法如何实现的呢？

1. 查找到删除对应的index 下标 位置+1 到最后index位置向前移动一位。

数组数据结构：

1. 数组数据结构 根据index下标查询效率是非常高的
2. 数组数据结构 增加 删除效率非常低

**链表数据结构**

1. 链表数据结构 增加 删除 效率非常高
2. 链表数据结构查询 需要遍历 效率非常低o(n)

链表类型：

1. 单项链表
2. 双向链表
3. 环形链表

链表增加操作：找到尾节点，把尾部节点的next指向新增节点

链表删除操作：找到删除节点的上一个节点的next指向删除节点的next节点。

**LinkedList**

LinkedList底层是基于链表实现 增删 效率非常高 查询效率是非常低

底层基于双向链表实现

1. LinkedList是双向链表实现的List
2. LinkedList是非线程安全的
3. LinkedList元素允许为null，允许重复元素
4. LinkedList是基于链表实现的，因此插入删除效率高 查询效率低
5. LinkedList是基于链表实现的，因此没有容量不足够的说法，没有扩容方法
6. LinkedList还实现了栈和队列的操作方法，因此也可以作为栈、队列和双端队列来使用。

```java
public class fyLinkedList<E> {
    /*整个列表的头结点*/
    private Node<E> first;
    /*整个列表的尾结点*/
    private Node<E> last;
    /*链表的元素数量*/
    private int size;
    /*链表是基于链表数据结构实现的*/
    /*双向链表*/
    private static class Node<E>{
        private E item;//当前节点的值
        Node<E> pre;//当前节点的上一个节点
        Node<E> next;//当前节点的下一个节点

        /**
         * create by: yhf
         * description: TODO
         * create time: 2023/3/28 17:56
         * @Param: pre 上一个节点
         * @Param: item 当前节点值
         * @Param: next 下一个节点
        */
        public Node(Node<E> pre,E item,  Node<E> next) {
            this.pre = pre;
            this.item = item;
            this.next = next;
        }
    }

    /*LinkedList的添加元素方法*/
    public void add(E e){
        /*先获取链表的尾部节点*/
        Node l = last;
//        创建一个新的节点
        Node<E> newNode = new Node<>(l,e,null);//设置了链表的尾节点的下一个节点为空
        /*把链表的尾节点设置为新节点*/
        last = newNode;
//        判断新增前链表的尾部节点是否为空 如果为空 把链表的头结点设为当前新增节点
        if(l == null){
            first = newNode;//设置了第一个节点 并且头结点的上一个节点默认值为null
        }else{
            l.next = newNode;
        }
        size++;
    }
    /*LinkedList中根据index查询node的Get方法*/
    public E get(int index) throws RuntimeException {
        /*数组越界控制*/
        if(index >= size){
            throw new fyLinkedListOut("查询指数越界");
        }
        return node(index).item;
    }


//    折半查询
    Node<E> node(int index){
        if (index < (size>>1)){
            Node<E> f = first;
            /*查询链表左边*/
            for (int i = 0; i <index ; i++) {
                f=f.next;
            }
            return f;
        }else{
            /*查询链表右边*/
            Node<E> l = last;
            for (int i = size-1; i >index ; i--) {
                l = l.pre;
            }
            return l;
        }
    }

    /*删除方法*/
    public E remove(int index){
        return unLink(node(index));
    }


    public E unLink(Node<E> node){
        final E element = node.item;//删除节点的元素值
        final Node<E> pre = node.pre;//删除节点的上一个节点
        final Node<E> next = node.next;//删除节点的下一个节点
        if(pre == null){
            first = next;
        }else{
            pre.next = next;
            node.pre =null;
        }
        if(next == null){
            last = pre;
        }else{
            next.pre = pre;
            node.next = null;
        }
        node.item = null;
        size--;
        return element;
    }
}
```

**如何判断头结点或者尾节点**

1.如果当前节点的下一个节点为null 则为尾节点；如果当前节点的上一个节点为null,则为头结点。

transient关键字修饰，表示不能被序列化。



**Map集合概述和使用**

Map集合概述

Interface Map<k,v>k:键值类型 v:值的类型

Map集合的特点

1. 键值对映关系Key和Vaule

2. 一个键k对应一个值value

3. 键不允许重复，值可以重复 

4. 元素存取无序（键和值为一个元素 其存放顺序无序） Map集合存储顺序与Map集合遍历的顺序是无序 散列的，但是有一个有顺序的LinkedHashMap是有序的。

5. 如果k存在，直接修改value值。

   

   例子：

   | 学号  | 姓名 |
   | ----- | ---- |
   | 19101 | 李白 |
   | 19102 | 吕布 |
   | 19103 | 李信 |

   

**Map集合的常用方法**

| 方法名称                            | 作用                       |
| ----------------------------------- | -------------------------- |
| V put(K key, V value)               | 添加元素                   |
| V remove(K key, V value)            | 根据键值删除对应的键值对   |
| void clear()                        | 清除所有键值元素           |
| boolean containsKey(Object value)   | 判断集合中是否包含指定的键 |
| boolean containsValue(Object value) | 判断集合中是否包含指定的值 |
| boolean isEmpty()                   | 判断集合是否为空           |
| size()                              | 集合中的元素个数           |

**Map集合的获取方法**

| 方法名称                                          | 作用                                                         |
| ------------------------------------------------- | ------------------------------------------------------------ |
| V get(Object key)                                 | 根据键获取值                                                 |
| Set<K>keySet()                                    | 获取所有键的集合                                             |
| Collection<V> values()                            | 获取所有值的集合                                             |
| Set<Map.Entry<K,V>>entrySet()                     | 获取所有键值对象的集合                                       |
| default V getOrDefault(Object key,V defaultValue) | 如果存在相应的key则返回其对应的value，、否则返回给的的默认值defaultValue |



**HashSet集合特点**

1. HashSet基于HashMap来实现的，是一个不允许有重复元素的集合
2. HashSet允许有null值
3. HashSet是无序的，即不会记录插入的顺序。
4. HashSet底层基于HashMap集合实现 而HashMap底层 键值对是不允许重复的 且存放数据是散列没有顺序的
5. HashSet底层基于HashMap集合实现 而HashSet.add方法 底层 存放元素 采用HashMap集合 key 来存放 而HashMap key 值是不允许重复的。
6. HashSet没有get方法，底层基于HashMap实现 存放key 是散列的 没有index，但是可以使用for each遍历。

HashMap 底层add方法是如何实现新增元素 保证key 不允许重复的呢？

```java
((k = p.key) == key || (key != null && key.equals(k))))
```

将Student对象存入HashSet,

第一次 add s1对象存入HashMap集合

第二次 add 存入s2对象 s1==s2 =false ||  s1.equals(s2) 没有重写即 (s1==s2) = false。

如果内存地址相同 不能存入

判断key 在hashMap集合中是否存在 如果存在 就不能够继续新增。

所以在HashSet集合中存入Student对象，需要在Student中重写equals方法，hashCode方法。比较两个对象的属性值。

```java
public class fyHashSet<E> {
    /*HashSet底层是基于HashMap集合实现的
    * 元素中的值就是HashMap中的key*/
    private HashMap<E,Object> map;
    private static final Object PRESENT = new Object();

    /*构造器*/

    public fyHashSet() {
        this.map = new HashMap<>();
    }

    public void add(E e){
        map.put(e,PRESENT);
    }

    @Override
    public String toString() {
        return "fyHashSet{" +
                "map=" + map +
                '}';
    }
}
```

```java
@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return Objects.equals(stuID, student.stuID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(stuID);
    }
```

**去除重复数据**

可以使用HashSet去除重复数据，但是在去除重复数据之前需要重写equals方法和hashCode方法

**HashCode方法**

1. hashCode方法是属于Object父类提供的方法，hashCode方法返回该对象的哈希码值。支持该方法是为哈希表提供一些优点，例如，java.util.HashTable提供的哈希表
2. hashCode的常规协定是：

​		在Java应用程序执行期间，在同一对象上多次调用hashCode方法时，必须一致地返回相同的整数。

​	3.hashCode的存在主要是用于查找的快捷性，如Hashtable,HashMap等，hashCode是用来在散列存储结构中确定对象的存储地址的；

​	4.如果equals方法比较相等，则HashCode值也一定相等，但是hashCode值相等不代表equals比较也相等。两个对象hashCode值相等，其equals比较不相等:hashCode冲突

当两个key的哈希值相等，通过hash算法计算得到的index也就相同，后面一个key的value值覆盖前面一个key的value值。



**怎么解决哈希冲突**

在哈希底层实现的数组中，如果添加的元素，其key的哈希值与另外一个key的哈希值相同，那么根据hash算法得到的index也相同，所以在添加的时候，就可以把数组中对的每一个index位置存放一个链表，如果key不同，哈希值相同，就把index位置的entry的next指向新添加的newEntry。

![image-20230329181908105](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230329181908105.png)

如果在HashMap集合中 发生了key hash冲突 使用链表数据结构来存放。



```java
String strA = "a";

Integer int97 = 97;//整数类型 包装类型Integer hashCode值 就是该整数值97

System.out.println(strA.hashCode());

System.out.println(int97.hashCode());
```

​	5.使用集合，如果类中重写了equals方法，必须重写hashCode方法。：因为Set集合底层是基于hashMap实现的，而HashMap底层就会引用equals方法和hashCode方法。因为equals相等，不重写hashCode方法，其hashCode值不相等。

hashCode属于Object父类，java虚拟机的 是整数类型



```java
/*hashMap的键是否可以为我们的自定义对象，可以*/
/*hashMap存储数据 是无序的 */
/*hashMap 中key 可以存放null 存放在index=0*/
/*hashMap中键值对是如何封装的？ hashMap实现了Map.Entry接口*/
```

基于ArrayList实现HashMap：

优点：可以保证存放 键值对 是有序存放 不是散列

缺点：查找效率太低，需要遍历整个链表查询。

第二种 Java提供的实现方法基于hash算法.

hashMap集合底层根据hash算法 可以将key的hash对10取余作为entrys数组的index，然后可以通过entrys[index]直接查找。

存放和查找key 时间复杂度为O(1)

```java
public class fyHashMap<K,V> {
    private Entry[] entrys = new Entry[10000];

    class Entry<K,V>{
        K k;
        V v;
        private Entry<K,V> next;//解决哈希冲突 使用链表
        int hash;//key的哈希值

        public Entry(K k, V v,int hash) {
            this.k = k;
            this.v = v;
            this.hash = hash;
        }
    }

    /*哈希map集合 1.7的版本是基于链表加数组实现的 1.8以后是基于链表加数组加红黑树实现的*/
    public void put(K k,V v){
        int hash = k.hashCode();//获取当前传入的key的哈希值
        int index = hash % entrys.length;//获取当前key的index

        /*先根据index取出entry 如果能取出entry对象*/
        Entry oldEntry = entrys[index];
        if(oldEntry==null){
            entrys[index] = new Entry<>(k,v,hash);
        }else{
            oldEntry.next = new Entry<>(k,v,hash);
        }


    }
    public V get(K k){
        int hash = k.hashCode();//获取当前传入的key的哈希值
        int index = hash % entrys.length;
        for (Entry<K,V> entry = entrys[index];entry != null;entry = entry.next){//寻找到index链表，如果找到哈希值相等，并且k值相同就返回
            if(entry.hash == hash && (entry.k == k || entry.k.equals(k))){
                return entry.v;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        fyArrayListHashMap<String, String> stringStringfyArrayListHashMap = new fyArrayListHashMap<>();
        stringStringfyArrayListHashMap.put("1001","飞鱼");
        stringStringfyArrayListHashMap.put("1002","飞");
        stringStringfyArrayListHashMap.put("1003","鱼");
        System.out.println(stringStringfyArrayListHashMap.get("1003"));
    }
}
```



**Collections**

概述：Collections是集合操作的工具类，Collection单列集合

Collections类的常用方法

| 方法                                                         | 作用                               |
| ------------------------------------------------------------ | ---------------------------------- |
| public static <T extends Comparable<? super T>> void sort(List<T> list) | 将指定的列表按升序排序             |
| public static void reverse(List<?> list)                     | 翻转指定列表中元素的顺序           |
| public static void shuffle(List<?> list)                     | 使用默认的随机源随机排列指定的列表 |

Collections只可以操作collection下的List子类实现类。





**LinkedHashMap**

概述：LinkedHashMap继承自HashMap,它的多种操作都是建立在HashMap操作的基础上，同HashMap不同的是，LinkedHashMap维护了一个Entry的双向链表，保证了插入的Eentry中的顺序。

**LinkedHashSet**

LinkedHashSet是集合Set集合的一个实现，具有set集合不重复的特点，与HashSet集合不同对的是可以保证元素顺序性，也就是遍历顺序和插入顺序是一致的。

LinkedHashSet底层是基于LinkedHashMap实现



可以使用HashSet生成10个1-20不重复的随机数



### IO流

------

1. File类主要是JAVA为文件这块的操作（如删除、新增）而设计的相关类
2. File类的包名是java.io,实现了Serializable，Comparable两大接口以便于其对象可以序列化和比较
3. File它是文件和目录路径名的抽象表示，文件和目录是可以通过File封装成对象的，其封装的并不是一个真正存在的文件，仅仅是一个路径名，它是可以存在的，也可以是不存在的。通过具体的操作把这个路径的内容转换为具体存在的。



| 方法名                           | 说明                                                 |
| -------------------------------- | ---------------------------------------------------- |
| File(String pathname)            | 通过给定的字符串转换为抽象的路径名来创建新的File实例 |
| File(String parent,String child) | 从父路径名和子路径名来创建新的File实例               |
| File(File parent,String child)   | 从父抽象路径名和子路径名字符串创建新的实例。         |

**File类创建功能**

| 方法名                         | 说明                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| public boolean createNewFile() | 当具有该名称的文件不存在时，创建一个有该抽象路径名命名的新空文件 |
| public boolean mkdir()         | 创建由此抽象路径名命名的目录                                 |
| public boolean mkdirs()        | 创建由此抽象路径命名的目录，包括任何必须但不存在的父目录     |

**File类的判断方法**

| 方法名                | 说明                     |
| --------------------- | ------------------------ |
| boolean isDirectory() | 判断否是文件夹           |
| boolean isFile()      | 判断是否是文件           |
| boolean exists()      | 判断文件或文件夹是否存在 |



**File类的获取方法**

| 方法名称                 | 说明                                   |
| ------------------------ | -------------------------------------- |
| String getAbsolutePath() | 获取绝对路径                           |
| String getPath()         | 获取抽象路径名转化路径名字符串         |
| String getName()         | 获取文件或文件夹的名称                 |
| String[] list()          | 获取目录下的所有内容，返回字符串数组   |
| File[] listFiles()       | 获取目录下的所有内容，返回File对象数组 |

绝对路径是直接写死的 如果将该代码 放入到其他电脑上运行 没有该路径，就会报错

相对路径 动态获取运行项目路径----灵活

大多时候使用相对路径

**File类的删除方法**

| 方法名           | 说明                                                         |
| ---------------- | ------------------------------------------------------------ |
| boolean delete() | 如果删除路径是一个目录，不能够直接删除目录，需要先删除该目录中所有内容，最后在删除目录。如果删除是一个文件可以直接删除 |



栈是有深度的，可以设置参数，-Xss50m

递归算法：

1. 在使用递归算法是，需要注意栈空间的深度

2. 减少递归调用深度 通过一定条件退出

3. 避免栈空间 “栈溢出”

   JVM设置该参数：-Xss10m



**递归遍历目录**

需求：给定一个路径 通过递归算法遍历该目录下所有内容，并将所有文件的绝对路径输出在控制台

```java
public class Test11 {
    public static void main(String[] args) {
        String pathname = "D:\\IO\\day01";
        File file = new File(pathname);
        getAllFile(file);
        deletes(file);
    }

    /*获取整个目录*/
    public static void getAllFile(File file){
        File [] files = file.listFiles();
        if (file == null)return;
        for (File f:files
             ) {
            if (f.isDirectory())getAllFile(f);
            if (f.isFile()) System.out.println(f.getAbsolutePath());
        }
    }


    public static void deletes(File file){
        File[] files = file.listFiles();
        for (File f:files
             ) {
            if (f.isDirectory())deletes(f);
            if (f.isFile()){
                /*删除文件*/
                f.delete();
            }

        }
        /*直接删除整个目录*/
        file.delete();
    }
}
```



**IO流概述**

1. IO：输入（Input读取数据）/输出(Output写数据)
2. 流：是一种抽象概念，是对数据传输的总称，也就是说数据在设备间的传输称为流，流的本质是数据传输IO流就是用来处理设备间数据传输问题的
3. 常见的应用：文件上传、下载、复制等。

**Io流的分类**

1. 根据数据流向分类：
   1. 输入流：读数据 将硬盘中的数据读取到内存中
   2. 输出流： 写数据 将程序中的数据写到硬盘中
2. 按照数据类型来分
   1. 字节流 字节输入流 /字节输出流
   2. 字符流 字符输入流/字符输出流
3. IO流应用场景：
   1. 纯文本文件，优先使用字符流
   2. 图片、视频、音频等二进制文件，优先使用字节流
   3. 不确定文件类型，优先使用字节流，字节流是万能的流

**字节流写入数据**

1. InputStream：这个抽象类是表示字节输入流的所有类的超类
2. OutptStream：这个抽象类是表示字节输出流的所有类的超类 
3. 子类名特点：子类名都是以其父类名作为子类名的后缀
4. FileOutputStream：文件输出流用于将数据写入File
5. FileOutputStream(String name)：创建文件输出流以指定的名称写入文件
6. 输出流步骤：调用系统功能创建了文件->创建字节输出流对象=>字节输出流对象指向文件

**字节流写入数据常用的三种方式**

| 方法名称                              | 说明                                                         |
| ------------------------------------- | ------------------------------------------------------------ |
| void write(int b)                     | 将指定的字节写入此文件 输出流一次写一个字节数据              |
| void write(byte[] b)                  | 将b.length字节从指定的字节数组写入此文件输出流 一次写一个字节数组数据 |
| void write(byte[] b, int off,int len) | 将len字节从指定的字节数组开始，从偏移量off开始写入此文件输出流 一次写一个字节数组的部分数据 |

IO资源的关闭，以及字符串写入文件，如果新创建了一个FileOutputStream对象，在文件中追加写入，FileOutputStream第二个参数为true。

```java
public class Test33 {
    public static void main(String[] args) {
        /*写入字符串到文件*/
        FileOutputStream fileOutputStream = null;
        try {
            String pathname = "F:\\IO\\fy.txt";
            fileOutputStream = new FileOutputStream(pathname,true);//追加写入数据
            fileOutputStream.write("feiyu666612fnfakjbfwekl".getBytes());//写入数据
            for (int i = 0; i < 10; i++) {
                fileOutputStream.write("feiYu\n".getBytes());
            }
            /*如果把关闭资源写到此处，可能异常退出，就关闭不了资源*/
           /* System.out.println("关闭IO资源");
            fileOutputStream.close();*/
        }catch (IOException e){
            e.printStackTrace();
        }finally {
//            关闭io资源 finally只要/jvm是正常退出的话，就一定会执行finally中的语句
            if(fileOutputStream != null){
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
```



**字节流读取数据**

| 方法名称                              | 说明                                                         |
| ------------------------------------- | ------------------------------------------------------------ |
| int read(byte[]bytes,int off,int len) | 从该输入流中读取一个字节数组部分数据，返回值为-1时说明文件读取完毕 |

```java
public class Test1 {
    public static void main(String[] args)  {
        /*读取磁盘中的数据*/
        String pathname = "D:\\IO\\fy.txt";
        FileInputStream fileInputStream = null;
        try{
            fileInputStream =new FileInputStream(pathname);
            /*System.out.println((char)fileInputStream.read());//读取第一个字节数据
            System.out.println((char)fileInputStream.read());//读取第二个字节数据*/
            System.out.println("读取到的文件内容为：");
            int read;
            while((read=fileInputStream.read()) != -1){
                System.out.print((char)read);
            }
            System.out.println("读取数据完毕");
        }catch (IOException e){
            e.printStackTrace();
        }finally {
            if (fileInputStream !=null){
                try {
                    fileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }
}

```

**字节流文件内容拷贝**

字节流复制数据：

1. 先读取源文件中的数据通过输入流读取到内存中
2. 将内容写到目标文件内通过输出流FileOutputStream。

字节流以单字节读取拷贝内容

```java
public class Test2 {
    public static void main(String[] args) {
        String pathname1 = "D:\\IO\\fy1\\fy.txt";
        String pathname2 = "D:\\IO\\fy2\\fy.txt";
        FileInputStream fileInputStream =null;
        FileOutputStream fileOutputStream=null;
        try{
            fileInputStream = new FileInputStream(pathname1);//读取数据到输入流中
            fileOutputStream = new FileOutputStream(pathname2);
            int bt;
            while ((bt = fileInputStream.read()) != -1){//读数据
                fileOutputStream.write(bt);//写数据
            }

        }catch(IOException e){
            e.printStackTrace();
        }finally {
            if (fileInputStream !=null){
                try {
                    fileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOutputStream !=null){
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

```

**字节流以字节数组的形式读取数据**

采用字节数组的形式读取文件内容数据，并且输出到控制台

```java
public class Test03 {
    public static void main(String[] args) throws IOException {
        String pathname1 = "D:\\IO\\fy.txt";
        /*以字节数组读取数据*/
        /**/
        FileInputStream fileInputStream = new FileInputStream(pathname1);
        byte[] bytes = new byte[8];//一般以1024,2的整数倍为单位来读取
        int len;
        /*可以使用-1 或者 len>0来判断读完状态*/
        while((len = fileInputStream.read(bytes))!=-1){//一次读取8个字节放入bytes
            System.out.println(len);
            System.out.println(new String(bytes,0,len));
        }
        fileInputStream.close();
    }
}
```

**图片拷贝**

```java
public class Test4 {
    public static void main(String[] args) throws IOException {
        FileInputStream fileInputStream = new FileInputStream("D:\\IO\\fy1\\fy.jpg");
        FileOutputStream fileOutputStream = new FileOutputStream("D:\\IO\\fy2\\fy.jpg");
        byte[] bytes = new byte[1024];
        int len;
        while((len = fileInputStream.read(bytes)) != -1){
            fileOutputStream.write(bytes,0,len);
        }
    }
}
```

**字节缓冲流**

1. 传统方式一个一个字节读取或者写入数据，会频繁的发生系统内核调用（用户态->内核态切换）效率非常低
2. 我们可以使用字节缓冲流，缓冲区是一个内存区域的概念，类似于池子 以“快"的形式写入或者读取数据 减少系统调用频率

BufferedInputStream(InputStream in)：字节缓冲输入流

BufferedOutputStream(OutputStream in)：字节缓冲输出流

构造函数传递字节流对象，不是文件路径，缓冲流提供了一个缓冲区，做了封装以块的形式读取数据，读写数据还是依赖字节流对象。

注意：字节缓冲流的缓冲区大小默认是8K,即8192字节。

![image-20230330190509251](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230330190509251.png)

字节缓冲流的缓冲区底层本质是基于字节数组实现的，默认8192

**字节缓冲流和单个字节流复制视频**

需求：将一个视频从源文件中复制到目标文件中

```java
package com.javase.io.BufferedStream;

import java.io.*;

/**
 * @author ：yhf
 * @date ：Created in 2023/3/30 19:51
 * @description：使用字节流和字节缓冲流复制视频
 */
public class Test2 {
    /*1.方式1使用字节缓冲流
    * 2.方式2使用字节流*/
    public static void main(String[] args) throws IOException{
        a();
        b();
    }
    /*第一种方式*/

    /**
     * create by: yhf
     * description: 字节缓冲流复制视频
     * create time: 2023/3/30 20:01
     *
     * @return null
     * @Param: null     */
    public static void a() throws IOException {
    /*获取到当前系统时间*/
        long time1 = System.currentTimeMillis();
        BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream("D:\\IO\\fy1\\fy.mp4"));
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream("D:\\IO\\fy2\\fy1" +
                ".mp4"));
        byte[] bytes = new byte[1024];
        int len;
        while((len = bufferedInputStream.read(bytes)) != -1){
            bufferedOutputStream.write(bytes,0,len);
        }
        bufferedInputStream.close();
        bufferedOutputStream.close();
        long time2 = System.currentTimeMillis();
        System.out.println(time2-time1+"毫秒");
    }

    /*第二种方式*/

    /**
     * create by: yhf
     * description: 单个字节流复制视频
     * create time: 2023/3/30 20:01
     *
     * @return null
     * @Param: null     */
    public static void b() throws IOException {
        /*获取到当前系统时间*/
        long time1 = System.currentTimeMillis();
        FileInputStream fileInputStream = new FileInputStream("D:\\IO\\fy1\\fy.mp4");
        FileOutputStream fileOutputStream = new FileOutputStream("D:\\IO\\fy2\\fy2.mp4");
//        byte [] bytes = new byte[1024];//字节缓冲流
        int b;
        while ((b = fileInputStream.read()) != -1){
            fileOutputStream.write(b);
        }
        fileInputStream.close();
        fileOutputStream.close();
        long time2 = System.currentTimeMillis();
        System.out.println(time2-time1+"毫秒");
    }

}

```

**字节缓冲流和单个字节流花费时间对比**



![image-20230330201259437](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230330201259437.png)

由于单个字节流，没写一个字节就要发生一次系统调用，而字节缓冲流以缓冲区块的形式实现读写，所以发生的系统调用次数就很少，因此时间花费少。如果IO时，推荐使用字节缓冲流。

在Java中，一个汉字存储占用多少字节？

1. 一个汉字如果是GBK编码，占用两个字节
2. 一个汉字如果是UTF-8编码，占用三个字节

```java
public class Test22 {
    public static void main(String[] args) {
        /*默认情况下使用编码UTF-8*/
        String str1 = "abc";
        String str = "余洪飞";
        System.out.println("中文字节:"+str.getBytes().length);//UTf-8编码 一个中文占用3个字节
        System.out.println("英文字节:"+str1.getBytes().length);//UTF-8编码 一个英文字符占用1个字节
        System.out.println(Arrays.toString(str.getBytes()));
        System.out.println(Arrays.toString(str1.getBytes()));
    }
}
```

![image-20230330203723177](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230330203723177.png)

编码和解码：

1. 当字节流读取存储中文数据时可能会发生乱码，我们可以使用字符流。字符流=字节流+编码表
2. 编码表：可以看做是一个字典，该字典翻译是人类的字符和机器语言（二进制）之间的对应关系
3. 编码表(ASC II)：就是人类生活的字符和计算机二进制的对照关系表
4. GBK：识别2万多中文，2个字节表示一个字符
5. Unicode：世界计算机协会制定通用码表，2个字节表示一个字符
6. UTF-8：Unicode升级版，汉字基本都是3个字节。推荐使用



**读取磁盘中的文件乱码**：

程序中设定读取编码的格式 与文件存储在磁盘中的编码格式不同 就可能会发生乱码。

例如程序中设定读取编码格式为UTF-8

该文件存储在硬盘中 编码格式 GBK

读取的时候 会发生乱码

**编码和解码**

编码：把我们能看懂的编程看不懂的（字符->字节）

1. byte[] getBytes() 使用平台的默认字符集将此String编码为byte序列
2. byte[] getBytes(String charsetName)使用指定的字符集将此String编码为byte序列

解码：把我们看不懂的编程能看懂的（字节->字符）

1. String(byte[] bytes) 通过使用平台的默认字符集解码指定的byte数组，构造一个新的String
2. String(byte[] bytes,String charsetName) 通过使用指定的字符集解码指定的byte数，构造一个新的String

乱码原因：编码和解码不一致。

**字符流**

1. Writer是写入字符流的抽象类
   1. OutputStreamWriter（输出转换流）是字符流通向字节流的桥梁，将要写入的字符编码成字节。构造方法：OutputStreamWriter(OutputStream out)创建使用默认字符编码的OutputStreamWriter。编码
   2. OutputStreamWriter(OutputStream out,String charsetName)创建使用指定字符集的OutputStreamWriter。字符流的底层还是用字节流进行读写，字符流仅仅是做了字节和字符的转换（编码和解码）。接收字符数据，首先要把字符数据编程字节数据，然后在用普通字节流，把数据写到硬盘，实现了字符数据转换为字节数据。
2. Reader是用于读取字符流的抽象类
   1. InputStreamReader（输出转换流）是字符流通向字节流的桥梁，将要写入的字符编码成字节。构造方法：InputStreamReader(InputStream in)创建使用默认字符编码的InputStreamReader。解码
   2. IntputStreamReader(InputStream in,String charsetName)创建使用指定字符集的InputStreamReader。字符流的底层还是用字节流进行读写，字符流仅仅是做了字符和字节的转换。接收一个字节流，形成了字符流。把字节流转换为字符流！底层会用字节流去硬盘读书字节数据，把字节数据转换为字符数据，然后返回。实现了把字节数据转换为字符数据。



**字符流写入和读取数据**

```java
public class Test11 {
    public static void main(String[] args) throws IOException {
        /*字符流写入数据和读取数据*/
        System.out.println("正在写入数据......");
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream("D:\\IO\\fyy.txt"),"UTF-8");//指定字符编码
        outputStreamWriter.write("余洪飞is Very Good!\nis Very luck!");
        System.out.println("写入成功......");
        outputStreamWriter.close();
        System.out.println("正在读取数据......");
        /*字符流读取数据*/
        InputStreamReader inputStreamReader = new InputStreamReader(new FileInputStream("D:\\IO\\fyy.txt"), "UTF-8");
        //指定解码方式UTF-8和编码方式一样
        char[] chars = new char[1024];
        int len;
        while((len = inputStreamReader.read(chars)) != -1){
            System.out.print(new String(chars,0,len));
        }
        inputStreamReader.close();
        System.out.println("读取数据成功");
    }
}
```



**字符流5中写入方式**

| 方法名称                                        | 说明                                       |
| ----------------------------------------------- | ------------------------------------------ |
| public void write(int c)                        | 写出一个字符                               |
| public void write(char[] cbuf)                  | 写出字符组                                 |
| public void write(char[] cbuf,int off, int len) | 写出字符数组cbuf中，从off开始，共len个字符 |
| public void write(String str)                   | 写出字符串                                 |
| public void write(String str,int off, int len)  | 写出字符串，共len个字符，从off开始         |

**字符流中读取方式**

| 方法名称              | 功能                   |
| --------------------- | ---------------------- |
| int read()            | 一次读取一个数据       |
| int read(char[],cbuf) | 一次读一个字符数组数据 |



**字符流拷贝文件**

```java
public class Test33 {
    public static void main(String[] args) throws IOException {
        InputStreamReader inputStreamReader = new InputStreamReader(new FileInputStream("D:\\IO\\f.txt"),"UTF-8");
        char[] chars = new char[1024];
        int len;
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream("D:\\IO\\y.txt"),"UTF-8");
        while((len =inputStreamReader.read(chars)) != -1){
            outputStreamWriter.write(chars,0,len);
        }

        inputStreamReader.close();
        outputStreamWriter.close();

    }
}
```



转换流的便捷形式：FileWriter和FileReader

需求：使用FileWriter和FileReader拷贝文件。

```java
package com.javase.io.charStream;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * @author ：yhf
 * @date ：Created in 2023/3/30 22:15
 * @description：便捷转换流拷贝文件
 */
public class Test44 {
    public static void main(String[] args) throws IOException {
        FileReader fileReader = new FileReader("D:\\IO\\fyy.txt");
        char[] chars = new char[1024];
        int len;
        FileWriter fileWriter = new FileWriter("D:\\IO\\fyy1.txt");
        while ((len = fileReader.read(chars)) != -1){
            fileWriter.write(chars,0,len);
        }
        fileReader.close();
        fileWriter.close();
    }
}

```

**字符缓冲流**

1. BufferedReader:从字符输入流读取文本，缓冲各个字符，从而实现字符、数组和行的高效读取。FileReader:内 部使用InputStreamReader,解码过程，byte->char， 默认缓存大小为8k。BufferReader:默认缓存大小为8k，但可以手动指定缓存大小，把数据读取到缓存中，减少每次转换过程效率更高。
2. BufferedWriter:将文本写入字符输出流，缓冲各个字符，从而提供单个字符、数组和字符串的高效写入。FileWriter:内 部使用InputreamWriter，解码过程，byte->char， 默认缓存大小为8k .BufferWriter:默认缓存大小为8k，但可以手动指定缓存大小，把数据读取到缓存中，减少每次转换过程，效率更高。
3. BufferedWriter-字符缓冲写入流
4. BufferedReader-字符缓冲输入流

Api设计思想与字节缓冲流思想一-样。

字符缓冲流有 void newLine()可以实现写入换行操作和String readLine()读取换行操作

可以使用while循环读取所有数据。

```java
String s;

while((s = bufferedReader.readLine()) != null){

​	System.out.print(s);

}
```

**字符缓冲流拷贝java代码**

```java
package com.javase.io.BufferedReaderandBufferedWriter;

import java.io.*;

/**
 * @author ：yhf
 * @date ：Created in 2023/3/30 22:29
 * @description：字符缓冲流拷贝文件
 */
public class Test11 {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new FileReader("D:\\IO\\fy.java"));
        /*一行一行的读取*/
        String s;
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter("D:\\IO\\fy1.java"));
        while ((s = bufferedReader.readLine()) != null){
            bufferedWriter.write(s);
            bufferedWriter.newLine();
        }
        bufferedReader.close();
        bufferedWriter.close();
    }
}

```

### 多线程

**进程和线程**

进程**是资源分配的最小单位，线程是程序执行的最小单位**。计算机在执行程序时，会为程序创建相应的进程，进行资源分配时，是以进程为单位进行相应的分配。每个进程都有相应的线程，在执行程序时，实际上执行相应的一系列线程。

进程：cpu从硬盘中读取一段程序到内存中，该执行程序的实例就叫做进程，一个程序如果被cpu多次读取到内存中，则变成多个独立的进程

线程：线程是程序执行的最小单位，在一个进程中可以有多个不同的线程同时执行，为同一进程提供并行处理



文本编辑器：交互线程（监听）渲染线程（文字显示）保存线程（保存数据到磁盘）

并行/串行区别：

串行也就是单线程执行 代码执行效率非常低，代码从上向下执行；

并行就是多个线程并行一起执行，效率比较高

**使用多线程一定能提高效率吗**？

不一定，需要了解cpu调度的算法

就是先把前一个任务的cpu上下文（也就是cpu寄存器和程序计数器）保存起来，然后加载新任务的上下文到这些寄存器和程序计数器，最后再跳转到程序计数器所指对的新位置，运行新任务。

程序计数器，记录线程程序执行的位置或状态

**cpu调度时间片**

cpu执行多线程，也就是不断执行上下文切换，根据时间片来切换线程的执行。

线程执行状态：就绪、执行、死亡。

cpu调度时间片 几十毫秒

如果单核cpu开启多线程，并不是真正意义上的多线程执行。

多核8核cpu或单核cpu，开启许多线程去竞争cpu资源，需要不断的切换上下文，对程序执行效率会有影响。

实现真正意义上的多线程，其线程数至少要与cpu核数相对应。

**多线程的应用场景**

1. 客户端/开发
2. 异步发送短信/发送邮件
3. 将执行比较耗时的代码改用多线程异步执行
4. 异步写入日志 日志框架底层
5. 多线程下载

**同步和异步**

同步：从上往下按照顺序执行，单线程串行调度执行任务

异步：将执行的任务分为多个模块，模块之间不相互影响，多线程并行调度执行多个任务模块。提高了吞吐量，一次能执行多个，提高了执行效率。



**多线程的创建方式**

1. 继承Thread类创建线程
2. 实现Runnable接口创建线程  new Thread(实现Runnbale接口的实现类对象)
3. 使用匿名内部类的形式创建线程  new Thread(new Runnable(){重写run方法})
4. 使用lambda表达式创建线程   Runnable接口,函数式接口只有一个抽象函数的run函数的lambda表达
5. 使用Callable和Future创建线程
6. 使用线程池例如Executor框架
7. spring@Async异步注解



lambda 函数式接口（只有一个抽象函数）的函数才能使用



Callable和Future线程可以获取到返回结果 底层基于LockSupport

线程 异步执行 比较耗时- 有些时候需要拿到执行结果

LockSupport有park()和unpark（）方法，可以阻塞线程和恢复线程，即Callable和Future获取到执行结果依靠的LockSupport.

Callable和Future创建线程

1.实现Callable接口，重写call()方法

```java
public class CallableImpl implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        System.out.println(Thread.currentThread().getName()+"开始执行......");
        Thread.sleep(3000);//任务
        System.out.println(Thread.currentThread().getName()+"返回1");
        return 1;
    }
}
```



2.创建线程

```java
/*Callable和Future创建线程，可以拿到执行结果*/
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        CallableImpl callable = new CallableImpl();
        FutureTask<Integer> integerFutureTask = new FutureTask<>(callable);
        new Thread(integerFutureTask).start();
        Integer res = integerFutureTask.get();//主线程等待子线程返回执行结果
        System.out.println(Thread.currentThread().getName()+","+res);
//        LockSupport.park();阻塞主线程
//        LockSupport.unpark(Thread.currentThread());//恢复主线程

        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("我是子线程开始");
                LockSupport.park();//阻塞子线程
                System.out.println("我是子线程结束");
            }
        });
        t.start();//开启一个子线程
        try{
            Thread.sleep(3000);
        }catch (Exception e){

        }
        LockSupport.unpark(t);//在主线程中恢复子线程


    }
```

**线程池**

线程池：一种使用线程的模式，存放了很多可复用的线程，对线程统一管理。我们可以使用new 的方式去创建线程，但若是并发线程太高，每个线程执行时间不长，这样频繁的创建销毁线程是比较耗费资源的，线程池就是用来解决此问题的。

线程池优点：

1. 降低资源消耗：线程可以复用，不需要在创建和销毁线程上浪费资源
2. 提高响应速度：任务到达时，线程可以复用已有的线程，及时响应。
3. 可管理性：无限制的创建线程会降低系统效率，线程池可以对线程进行管理、监控、调优

ThreadPoolExecutor线程池类

线程安全问题：当多个线程同时写同一个全局变量时，会产生线程的安全性问题。

解决线程安全问题：上锁

锁：悲观锁、乐观锁、重入锁、公平锁、非公平锁

Synichronized非公平锁，用在具体代码块，其中this为对象锁，多个线程竞争该锁，竞争到，其他线程就不能获取该锁，自能等待线程执行完毕，释放锁其他线程才能争抢。这个上锁同时会降低效率，竞争锁是需要花费时间的，在jvm中底层为我们实现了自动上锁和释放锁，而Lock锁需要手动。

**同步代码块**

```java
Synichronized(this){

发生多线程安全的代码块

}
```

**静态方法同步代码块**

```java
synchronized (ThreadCount.class){
             if(count > 1) {
                count--;
                System.out.println(Thread.currentThread().getName() + "," + count);
            }
        }
```

**实例方法同步代码块**

```java
public synchronized void cal2(){
        if(count > 1) {
            count--;
            System.out.println(Thread.currentThread().getName() + "," + count);
        }
    }
```



如果是同一把锁，在多线程的情况下，只能被一把锁使用。

synchronized死锁问题：

线程1线程2同时执行

线程1：先获取到自定义的lock锁，然后进入方法a，需要使用this锁

线程2：先获取到this锁，进入到方法b,需要自定义lock锁

最终两个线程都没有释放锁，造成死锁。

```java
package com.javase.multithreading;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 14:44
 * @description：线程死锁
 */
public class Thread2 implements Runnable {
    private int count =1;
    private String lock = "lock";
    @Override
    public void run() {
        while(true){
            count ++;
            if (count%2==0){
                synchronized (lock){
                    a();
                }
            }else {
                synchronized (this){
                    b();
                }
            }
        }
    }

    public synchronized void a(){
        System.out.println(Thread.currentThread().getName()+","+count);
    }

    public void b(){
        synchronized (lock){
            System.out.println(Thread.currentThread().getName()+","+count);
        }
    }

    public static void main(String[] args) {
        Thread2 thread2 = new Thread2();
        new Thread(thread2).start();
        new Thread(thread2).start();
    }

}

```



**等待通过机制**

等待/通知的相关方法是任意JAVA对象都具备的，因为这些方法被定义在所有对象的超类Obejct上。方法如下：

1. notify():通知一个在对象上等待的线程，使其从main()方法返回，而返回的前提是该线程获取到了对象的锁
2. notifyAll()：通知所有等待在该对象的线程
3. wait()：调用该方法的线程进入WAITING状态，只有等待其他线程的通知或者被中断，才会返回。需要注意调用wait()方法后，会释放对象。



**生成者消费者线程**

```java
package com.javase.multithreading;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 15:33
 * @description：线程安全问题
 */
public class Test44 {
    /*共享资源对象*/
    class Res{
        public String name;
        public char sex;
        public boolean flag;//默认false
        /*flag为false:执行写入
        * flag为true:执行输出*/

    }
    class InputThread extends Thread{
        private Res res;

        public InputThread(Res res) {
            this.res = res;
        }

        @Override
        public void run() {
            int count =0;
            while(true){
                synchronized (res){
                    if(res.flag){
                        try {
                            res.wait();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                    if (count == 0){
                        res.name = "余洪飞";
                        res.sex = '男';
                    }else {
                        res.name = "小兰";
                        res.sex = '女';
                    }
                    res.flag = true;
                    res.notify();
                }

                count = (count+1)%2;

            }
        }
    }

    class OutputThread extends Thread{
        private Res res;

        public OutputThread(Res res) {
            this.res = res;
        }

        @Override
        public void run() {
            while(true){
                synchronized (res){
                    if (!res.flag){
                        try {
                            res.wait();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }

                    }

                    System.out.println(res.name+","+res.sex);
                    res.flag = false;
                    res.notify();
                }
            }
        }
    }

    public void print(){
        /*全局对象*/
        Res res = new Res();
        /*输入线程*/
        InputThread inputThread = new InputThread(res);
        /*输出线程*/
        OutputThread outputThread = new OutputThread(res);
        /*启动线程*/
        inputThread.start();
        outputThread.start();
    }

    public static void main(String[] args) {

        new Test44().print();

    }

}

```

**线程池**

```java
package com.javase.multithreading;

import java.sql.SQLOutput;
import java.util.LinkedList;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 16:12
 * @description：
 */
public class ThreadPool {
    private int threadPoolSize;
    private LinkedList<Runnable> tasks = new LinkedList<Runnable>();
    public ThreadPool(){
        threadPoolSize = 10;
        //启动10个消费任务线程
        synchronized (tasks){
            for (int i = 0; i <threadPoolSize ; i++) {
                new TaskConsumeThread("任务消费者线程"+i).start();
            }
        }
    }

    public void add(Runnable r){
        synchronized (tasks){
            tasks.add(r);
            tasks.notifyAll();
        }
    }


    class TaskConsumeThread extends Thread{

        public TaskConsumeThread(String name) {
            super(name);
        }

        Runnable task;

        @Override
        public void run() {
            System.out.println("启动线程："+this.getName());
            while(true){
                synchronized (tasks){
                    while(tasks.isEmpty()){
                        try {
                            tasks.wait();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                    task = tasks.removeLast();
                    tasks.notifyAll();
                }
                System.out.println(this.getName()+"：获取到任务，并执行");
                task.run();
            }
        }
    }
    public static void call(){
        ThreadPool threadPool = new ThreadPool();
        for (int i = 0; i <100 ; i++) {
            Runnable task = new Runnable() {
                @Override
                public void run() {
                    System.out.println("hello");
                }
            };

            threadPool.add(task);

            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }
    }

    public static void main(String[] args) {
        call();
    }

}

```

在run方法中，添加Thread.sleep()可以避免cpu占用过高。

**守护线程与用户线程**

java中线程分为两列，用户线程和守护线程。

默认使用的是用户线程。

通过Thread.setDaemon(true)设置线程为守护线程。

1. 守护线程是依赖于用户线程，用户线程退出来，守护线程也就会退出，典型的守护线程如垃圾回收线程
2. 用户线程是独立存在的，不会因为其他用户线程退出而退出。



**中断线程**

```java
package com.javase.multithreading;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 17:07
 * @description：中断线程
 */
public class InterruptThread extends Thread{
    private volatile boolean isStart = true;
    @Override
    public void run() {
        while (isStart){

//            try {
//                System.out.println("1");
//                Thread.sleep(100000000);
//                System.out.println("2");
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
        }
    }

    public static void main(String[] args) {
        InterruptThread interruptThread = new InterruptThread();
        interruptThread.start();
        System.out.println("中断子线程");
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        interruptThread.isStart = false;//停止线程
    }
}

```



在jdk1.5以后新增了ReentrantLock类同样可以实现锁，并且更灵活。

API:

使用ReentrantLock实现同步

lock()方法：上锁

unlock()方法：释放锁

使用Condition实现等待/通知 类似于wait和notify()等。

Lock底层基于AQS实现，需要自己封装实现自选锁。

设置线程优先级：thread.setPriority(Thread.MIN_PRRORITY)

**join/wait与sleep之间的区别**

sleep(long)方法在睡眠时不释放对象锁

join(long)方法先执行另外的一个线程，在等待的过程中释放对象锁，底层基于wait实现

wait(long)方法在等待的过程中释放对象锁。



### ConcurrentHashMap原理(线程集合)

HashMap和HashTable的区别

1. HashMap实现不同步，线程不安全。HashTable线程安全 HashMap中的key-value都是存储在Entry中的。
2. HashMap允许键为null，并作为index为0的位置存放。HashTable则不允许为null，为null则找不到k.hash值。

多线程情况下，使用synchronized实现同步，有锁的竞争，执行put操作，执行效率低。

ConcurrentHashMap：核心思想：减少多个线程竞争。

JDK1.7版本分段锁设计：

就是将一个大的HashTable集合拆分为n多个小的HashTable集合，默认16个。---分段锁设计

如果多线程写入的key最终计算落到不同的小的HAshTable集合中，就可以实现多线程同时写入不会发生锁的竞争。

可以同时执行16个线程，减少了锁的竞争，提高了效率。

### Java反射机制

1. Java反射机制的核心是在程序运行时动态加载并获取类的详细信息，从而操作类或对象的属性和方法。本质上JVM得到class对象之后，再通过class对象反编译，从而获取对象的各种信息。
2. Java属于先编译再运行的语言，程序中对象的类型在编译期就确定下来了，而当 程序运行时可能需要动态加载某些类，这些类因为之前用不到，所以没有加载到JVM.通过反射，可以在运行时动态的创建对象并调用其属性，不需要提前在编译期指导运行的对象是谁。

Java反射机制可以动态方式获取到class相关信息 class中成员方法、属性。反射技术灵活调用方法或者给我们成员属性赋值，class.forName初始化对象（创建我们的对象）

![image-20230401183600109](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230401183600109.png)

class只会在内存中存放一份。

反射获取的是在内存中的class信息。

获取class方式 

1. 直接类名称：Class<类名称> 类名 = 类名称.class
2. 对象获取class：Class<? extends 类名称> aClass = 对象名称.getClass();
3. 类的完整路径 包的名称+类名称组合：Class<?> aClass = Class.forName("com.javase.Test");

反射的优点：在运行时获得类的各种内容，进行反编译，对应Java这种先编译后运行的语言，能够让我们很方便的创建灵活的代码，这些代码可以在运行时装配，无需在组件之间进行源代码的链接，更加容易实现面向对象。

缺点：

1. 反射会销毁移动的系统资源，因此，如果不需要动态地创建一个对象，那么久不需要用反射
2. 反射调用方法时可以忽略权限检查，因此可能会破坏封装性而导致安全问题。



**反射机制应用场景**

1. JDBC中Class.forName("类的完整路径")
2. Spring底层基于反射初始化对象
3. 第三方框架扩展功能

**注意**：在运行期间，一个类只有一个Class对象产生。



**通过反射创建对象**

反射使用无参构造方法初始化对象

使用Class对象的newInstance()方法来创建Class对象对应类的实例。

```java
package com.javase.reflex;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 18:59
 * @description：使用反射初始化对象
 */
public class Test11 {
    public static void main(String[] args) {
        try {
            /*获取类*/
            Class<?> aClass = Class.forName("com.javase.reflex.Student");
            Student student = (Student) aClass.newInstance();//默认使用无参构造方法
            /*获取有参构造方法*/
            Constructor<?> constructor = aClass.getConstructor(String.class,Character.class,Integer.class);
            Student s = (Student) constructor.newInstance("飞鱼", '男', 23);
            System.out.println(s);
            /*获取所有的公有构造方法*/
            Constructor<?>[] constructors = aClass.getConstructors();
            for (int i = 0; i <constructors.length ; i++) {
                System.out.println(constructors[i]);
            }
            /*获取所有的构造方法，包括私有的*/
            Constructor<?>[] declaredConstructors = aClass.getDeclaredConstructors();
            for (int i = 0; i <declaredConstructors.length ; i++) {
                System.out.println(declaredConstructors[i]);
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}

```



**通过反射获取和设置class的字段**

```java
package com.javase.reflex;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 20:06
 * @description：通过反射获取成员属性（字段），给字段赋值
 */
public class getAttr {
    public static void main(String[] args) throws ClassNotFoundException, NoSuchFieldException, NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        /*获取class*/
        Class<?> aClass = Class.forName("com.javase.reflex.Student");
        /*获取指定的公有字段*/
        Field name = aClass.getField("name");
        System.out.println("获取指定的公有字段："+name);
        /*获取类中的所有公有字段*/
        Field[] fields = aClass.getFields();
        System.out.println("获取类中的所有公有字段:");
        for (int i = 0; i <fields.length ; i++) {
            System.out.println(fields[i]);
        }
       /*获取class中的指定私有字段*/
        Field sex = aClass.getDeclaredField("sex");
        System.out.println("获取class中的指定私有字段:"+sex);
        /*获取class中的所有字段，包括私有字段*/
        Field[] declaredFields = aClass.getDeclaredFields();
        System.out.println("获取class中的所有字段，包括私有字段:");
        for (Field f:declaredFields
             ) {
            System.out.println(f);
        }


        System.out.println("通过反射给私有属性字段赋值");
        Constructor<?> constructor = aClass.getConstructor();//无参构造方法，若有参则添加参数类型 类型.class
        Student s = (Student) constructor.newInstance();
        Field c = aClass.getDeclaredField("sex");
        c.setAccessible(true);
        s.setSex('男');
        System.out.println(s.getSex());

    }
}

```

**通过反射调用class方法**

```java
package com.javase.reflex;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/1 20:28
 * @description：通过反射调用class方法
 */
public class Test22 {
    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InstantiationException, InvocationTargetException, NoSuchFieldException {
        /*获取class*/
        Class<?> aClass = Class.forName("com.javase.reflex.Student");
        System.out.println("通过反射获取class的所有公有方法 包括继承的");
        Method[] methods = aClass.getMethods();
        for (Method m:methods
             ) {
            System.out.println(m);
        }

        System.out.println("通过反射获取class的所有方法,包括私有方法");
        Method[] declaredMethods = aClass.getDeclaredMethods();
        for (Method m:declaredMethods
        ) {
            System.out.println(m);
        }

        /*获取公有方法使用getMethods("方法名","参数类型【类型.class】")*/

        System.out.println("通过反射获取class中的指定私有方法");
        Method addUser = aClass.getDeclaredMethod("addUser", String.class,Character.class,Integer.class);
        System.out.println(addUser);
        addUser.setAccessible(true);//设置可访问
        Student s = (Student) aClass.newInstance();//通过反射获取实例
        String invoke = (String) addUser.invoke(s, "feiYu",'男',23);
        System.out.println("通过反射调用class中的私有方法"+invoke);
    }
}

```



### Socket网络编程

Web开发基础

C/S架构

服务器-客户机，即Client-Server结构。C/S结构通常采取两层结构。服务器负责数据的管理，客户机负责完成与用户的交互任务。但是客户端软件需要升级，用户需要重新下载最新版安装。

B/S架构

浏览器/服务器结构，Borwser指的是Web浏览器，特点：客户端只需安装浏览器，应用程序的逻辑和数据都存放到服务器端共享访问。

优点：易于维护升级，服务器端升级后，用户不用获取最新版本

缺点：会占用服务器端带宽资源

静态Web资源：html、css、images等，值web页面中供人们浏览器的数据始终是不变

动态Web资源：指Web页面中供人们浏览器的数据是由程序产生的，不同时间点访问web页面看到的内容各不相同。

在Java中，动态web资源开发技术统称JavaWeb。

**http**

特点：

1. 底层基于TCP协议实现，面向连接方式安全；
2. 基于请求(Requset)与响应(response)模型；
3. Http协议是无状态的协议，对于事物处理是没有任何记忆功能
4. Http协议多次请求无法共享，在Javaweb开发中我们可以通过cookie、session解决问题
5. http协议数据传输过程中，属于同步过程.如果服务器端没有响应客户端请求就会导致客户端阻塞，所以设置超时时间。

**Http请求格式**

请求数据格式：

请求行 请求方法(get、post)、url(/首页) http协议版本

请求头

请求体

1. 请求行：请求数据第一行
   1. 由3部分组成，分别为：请求方法、URL以及协议版本，之间由空格分隔
   2. 请求方法包括GET、HEAD、PU、POST、TRACE、OPTIONS、DELETE以及扩展方法，当然并不是所有服务器都实现了所有的方法，部分方法即便支持，处于安全性的考虑也是不可用的。
2. 请求头requestHeader
3. 请求体

get与post请求区别：

1. get请求请求的参数在请求行中，没有请求体
2. post请求请求参数在请求体中；
3. get请求请求参数有大小限制，post请求没有



**Http响应格式**

1. 响应行：响应数据第一行 

   200表示响应状态码 ok为 成功状态

2. 响应头：第二行开始 格式为key value

3. 响应体：存放服务响应给客户端的数据

http协议常见状态码

1. 404发送的请求地址错误或者不存在
2. 500服务器发生了错误

网络编程三要素：

1. IP地址
2. 端口号码
3. 协议tcp/udp

**Tcp协议**

tcp协议 需要先经历三次握手成功之后 再将数据发送给服务器端 确保服务器端是在 再将数据发送给服务端。

三次握手，四次挥手

第一次握手：客户端向服务端发送码为syn=1，随机产生一个seq_number=x的数据包到服务端(syn)

第二次握手：服务端接受到客户端请求之后，确认ack=x+1,于是就想客户端发送syn(服务端独立生成随机数字Y)+ack

第三次握手：客户端接收syn+ack,向服务端发送ack=y+1，此包发送完毕即可 建立tcp连接.

**客户端**

1. 创建发送端Socket对象（创建连接）
2. 获取输出流对象
3. 发送数据
4. 释放资源

```java
package com.javase.Socket;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/2 15:22
 * @description：tcp发送数据
 */
public class tcpClient {
    public static void main(String[] args) throws IOException {
        /*客户端发送数据*/
       /* 1. 创建发送端Socket对象（创建tcp连接）
        2. 获取输出流对象
        3. 发送数据
        4. 释放资源*/
       /*创建Socket对象*/
        Socket socket = new Socket("localhost", 8080);
        /*获取输出流对象*/
        OutputStream outputStream = socket.getOutputStream();
        /*发送数据*/
        outputStream.write("feiyu666".getBytes());
//        释放资源
        outputStream.close();
        socket.close();

    }
}

```

**服务端**

1. 创建接收端ServerSocket对象
2. 监听（阻塞：如果建立失败，程序会一直阻塞，不往下执行）
3. 获取输入流对象
4. 获取数据
5. 输出数据
6. 释放数据

```java
package com.javase.Socket.TCp;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.UUID;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/2 16:03
 * @description：
 */
public class TcpServer {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(8080);
        System.out.println("服务器端启动成功");
        while (true){
            Socket accept = serverSocket.accept();
            /*这里一般使用多线程来处理*/
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        InputStream inputStream = accept.getInputStream();//接收数据 读数据
                        byte[] bytes = new byte[1024];
                        int len = inputStream.read(bytes);
                        System.out.println("服务器端收到数据："+new String(bytes,0,len));
                        /*回应数据给客户端*/
                        OutputStream outputStream = accept.getOutputStream();
                        String str = "我收到了"+ UUID.randomUUID().toString();
                        outputStream.write(str.getBytes());
                        /*关闭资源*/
                        inputStream.close();
                        accept.close();

                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }).start();
        }
    }
}

```

**实现服务器验证账户和密码**

```java
服务端：
package com.javase.Socket.loginyz;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.UUID;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/2 16:41
 * @description：
 */
public class TcpServer {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(8080);
        System.out.println("服务器端启动成功");
        while (true){
            Socket accept = serverSocket.accept();
            /*这里一般使用多线程来处理*/
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try{
                        /*接收客户端数据*/
                        InputStream inputStream = accept.getInputStream();//接收数据 读数据
                        byte[] bytes = new byte[1024];
                        int len = inputStream.read(bytes);
                        /*服务端接收客户端数据包：userName=feiYu&userPwd=fy666*/
                        String reqText = new String(bytes,0,len);
                        String userName = reqText.split("&")[0].split("=")[1];
                        String userPwd = reqText.split("&")[1].split("=")[1];
                        OutputStream outputStream = accept.getOutputStream();
                        if("feiYu666".equals(userName) && "fy666".equals(userPwd)){
                            outputStream.write("ok".getBytes());
                        }else {
                            outputStream.write("fail".getBytes());
                        }
                        /*关闭资源*/
                        outputStream.close();
                        inputStream.close();
                        accept.close();

                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }).start();
        }
    }
}


客户端：
package com.javase.Socket.loginyz;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/2 16:41
 * @description：
 */
public class TcpClient {
    public static void main(String[] args) throws IOException {
        while(true){
            Socket localhost = new Socket("localhost", 8080);
            OutputStream outputStream = localhost.getOutputStream();//发送数据
            Scanner scanner = new Scanner(System.in);
            System.out.println("请输入用户的名称：");
            String userName = scanner.nextLine();
            System.out.println("请输入用户的密码：");
            String userPwd = scanner.nextLine();
            String reqText = "userName="+userName+"&"+"userPwd="+userPwd;
            outputStream.write(reqText.getBytes());
            InputStream inputStream = localhost.getInputStream();
            byte[] bytes = new byte[1024];
            int len = inputStream.read(bytes);
            String resp = new String(bytes,0,len);
            if ("ok".equals(resp)) {
                System.out.println("登录成功");
            }else {
                System.out.println("登录失败");
            }
            outputStream.close();
            inputStream.close();
            localhost.close();

        }

    }
}

```

Http服务器：

```java
package com.javase.Socket.http;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/2 17:13
 * @description：
 */
public class HttpServer {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(80);
        while(true){

            Socket socket = serverSocket.accept();//建立连接
            new Thread(new Runnable() {
                @Override
                public void run() {
                    OutputStream outputStream = null;
                    try {
                        /*获取客户端 浏览器发送数据给服务端*/
                        InputStream inputStream = socket.getInputStream();
                        byte[] bytes = new byte[1024];
                        int reqLen = inputStream.read(bytes);
                        String reqText = new String(bytes,0,reqLen);
                        String reqAddress = reqText.split("\r\n")[0].split(" ")[1];
                        //浏览器->服务器 直接静态资源给客户端
                        outputStream = socket.getOutputStream();
                        /*发送静态资源文件给客户端*/
                        File file = new File("D:\\IO\\html\\"+reqAddress);
                        FileInputStream fileInputStream = new FileInputStream(file);
                        byte[] bytes1 = new byte[1024];
                        int repsLen = fileInputStream.read(bytes1);//将静态资源加载到内存中
                        outputStream.write(bytes1, 0, repsLen);//发送静态资源数据
                    } catch (Exception e) {
                        e.printStackTrace();
                        try {
                            outputStream.write("500".getBytes());
                        } catch (IOException ex) {
                            ex.printStackTrace();
                        }
                    }finally {
                       try{
                           if(outputStream != null)
                               outputStream.close();
                           if(socket!=null)
                               socket.close();
                       }catch (Exception e){
                           e.printStackTrace();
                       }
                    }
                }

            }).start();


        }

    }
}

```

### MySQL数据库

**mysql安装服务器端**

mysql数据库安装，官网下载链接：

> https://dev.mysql.com/downloads/mysql/

将下载的压缩包解压，并在解压对的根目录下，创建data文件夹，配置my.ini文件，其配置如下：

```shell
[mysqld]
# 设置3306端口
port=3306
# 设置mysql的安装目录
basedir=D:\\MySql\\mysql-8.0.32-winx64
# 设置mysql数据库的数据的存放目录
datadir=D:\\MySql\\mysql-8.0.32-winx64\\data
# 允许最大连接数
max_connections=200
# 允许连接失败的次数。这是为了放置有人从该主机试图攻击数据库系统
max_connect_errors=10
# 服务端使用的字符集默认为UTF-8
character-set-server=utf8
# 创建新表是将使用的默认存储引擎
default-storage-engine=INNODB
[mysql]
# 设置mysql客户端默认字符集
default-charcater-set=utf8
[client]
# 设置mysql客户端连接服务端时默认使用的端口
port=3306
default-character-set=utf8

```

配置环境变量：在环境变量->系统变量里新建MYSQL,值mysql根路径。之后在PATH中新加一个路径：%MYSQL_HOME%\bin然后确定。

打开命令提示符窗口通过管理员打开，进入到mysql安装目录

1. 初始化：mysqld --initialize --user=mysql --console

   初始化成功之后：

   > 2023-04-03T03:03:53.045532Z 6 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: xsUf:%)Nn5r:

   > ![image-20230403111458032](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230403111458032.png)

   账号：root

   密码：xsUf:%)Nn5r:

2. 添加服务：mysqld -install

   > ![image-20230403111327001](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230403111327001.png)

3. 启动服务：net start mysql

   > ![image-20230403111341922](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230403111341922.png)

4. 登进数据库（密码就输入刚才生成的随机密码）mysql -u root -p

   > ![image-20230403112226821](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230403112226821.png)

5. 修改密码：ALTER USER root@localhost IDENTIFIED BY 'root';修改密码为了root，exit退出数据库

   > ![image-20230403112546407](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230403112546407.png)

   

数据库管理工具：navicat、SQLyog、Dbeaver

navicat下载地址：https://www.navicat.com.cn/download/navicat-premium

客户端安装navicat





**ddl**

ddl对数据库或者表结构 创建 修改删除的操作

dml对数据库或者表结构中的数据 创建 修改 删除的操作

DDL 对数据库  表结构 增加、修改 删除操作
DML 表结构中的数据  增加（insert）、修改（update） 删除（delete） 查询（select ）

ddl数据库基本操作：

```ddl
-- 注释 ddl-数据库基本操作
CREATE DATABASE IF NOT EXISTS feiyu;
-- 查询数据库
SHOW DATABASES;

-- 打开 cmd 命令提示符窗口 编写sql语句
-- 使用databases
USE feiyu;
-- 修改字符集
ALTER DATABASE feiyu CHARACTER SET utf-8;
-- 删除数据库
DROP DATABASE  if EXISTS feiyu;
```

ddl数据表结构创建

```
-- 指定表结构在什么数据库
CREATE DATABASE IF not EXISTS feiyu;

-- 使用数据库名称
USE feiyu;

-- 创建表结构
CREATE TABLE feiyu_user(
			id int ,
			name VARCHAR(20),
			age int ,
			address VARCHAR(100),
			CREATE_TIME DATE		
);

```

mySql数据类型，大致可以分为3类：数值、日期/时间和字符串（字符）类型。



dml插入数据：

> INSERT INTO 表名称 (列名1，列名2 ...)  VALUES (值1, 值2,....)    // 插入数据列与值的顺序需要一一对应。
> INSERT INTO 表名称  VALUES (值1, 值2,....)    // 向表中插入所有列

dml修改数据

> 语法格式：
> update 表名称 set 字段=值，字段=值，...；  ---直接修改整张表的所有行数据
> update 表名称 set 字段=值，字段=值，... where 条件 ---- 根据条件查找到对应行数据 修改
> 例子: 
> UPDATE mayikt_user ` SET `name` = 'mm', `age` = 25  WHERE `id` = 1;
> UPDATE mayikt_user ` SET `name` = 'mm', `age` = 25  ---修改所有

dml删除数据

> 语法格式：
> delete from 表名称 where 条件 根据条件删除表中的数据
> TRUNCATE mayikt_user   --清空表中所有的数据
>
> 例子：
> delete from mayikt_user  where  where id=1; 根据条件id=1 删除id=1 行数据
> delete from mayikt_user  ---清空表中所有的数据
> TRUNCATE mayikt_user   --清空表中所有的数据
>
> TRUNCATE 与delete  不同？
> truncate:会清空表中所有的数据，速度快，不可回滚；实质是删除整张表包括数据再重新创建表；
> delete:逐行删除数据，每步删除都是有日志记录的，可以回滚数据；实质是逐行删除表中的数据；

**DQL**

查询数据。

```
-- 创建数据库 ddl
create DATABASE if not EXISTS mayikt;
-- 使用mayikt数据库
use mayikt;
drop table mayikt_student;
-- 创建mayikt_student学生表
CREATE TABLE `mayikt_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) not null COMMENT '姓名',
  `age` tinyint  COMMENT '年龄',
  `address` varchar(255) COMMENT '地址',
  `class_id` int  COMMENT '班级id',
  PRIMARY KEY (`id`)
);
-- 新增测试数据 dml
INSERT INTO mayikt_student VALUES(NULL,'余胜军',28,'湖北武汉','01');
INSERT INTO mayikt_student VALUES(NULL,'小哈',21,'上海','01');
INSERT INTO mayikt_student VALUES(NULL,'张三',17,'北京','02');
INSERT INTO mayikt_student VALUES(NULL,'李四',22,'山东','02');
INSERT INTO mayikt_student VALUES(NULL,'王麻子',11,'四川','02');

-- 基本查询dql
select *from mayikt_student;

select s.name,s.age from mayikt_student as s;

select * from mayikt_student as student;

select name as 姓名,age 年龄  from mayikt_student as student;

select DISTINCT class_id from mayikt_student;
-- 算术运算符查询
select name,age+5 as age  from mayikt_student;

select 6+2;
select 6-2;
select 6*2;
select 6/4;
select 6%2;

SELECT s.name,s.age+5 as '年龄' from mayikt_student as s;
-- 比较和逻辑运算符查询
-- 查询学生的名称是为余胜军
-- 查询学生的名称不是为余胜军
-- 查询学生年龄是为17岁
-- 查询学生年龄是大于17岁
-- 查询学生年龄是小于17岁
-- 查询学生年龄是18岁-40岁之间
-- 查询年龄是在17或者 28岁的学生
select * from mayikt_student where name = '余胜军';
select * from mayikt_student where name != '余胜军';
select * from mayikt_student where name <> '余胜军';
select * from mayikt_student where not (name = '余胜军');
select * from mayikt_student where age = 17;
select * from mayikt_student where age > 17;
select * from mayikt_student where age < 17;
select * from mayikt_student where age > 17 and age <=40;
select * from mayikt_student where age >= 18 and age <41;
select * from mayikt_student where age >= 17 && age <=40;
select * from mayikt_student where age BETWEEN 18 and 40;
select * from mayikt_student where age = 18 || age =40;
select * from mayikt_student where age = 18 OR age =40;
select * from mayikt_student where age in (18,40,11);


-- 模糊查询

--查询名称含有“军”
--查询名称开头“小”
--查询名称第二字“汉”
--查询地址是为null学生
--查询地址不是为null的学生
SELECT * from mayikt_student WHERE name like '%军%';
SELECT * from mayikt_student WHERE name like '小%';
SELECT * from mayikt_student WHERE name like '_汉%';
SELECT * from mayikt_student WHERE address is not null;
SELECT * from mayikt_student WHERE address is null;
-- 排序查询
ALTER TABLE mayikt.mayikt_student AUTO_INCREMENT 1;
SELECT * from mayikt_student  order by age;
SELECT * from mayikt_student  order by age desc;
SELECT * from mayikt_student where age>18  order by age desc;
SELECT * from mayikt_student order by age desc ,class_id asc ;
SELECT DISTINCT class_id from mayikt_student ORDER BY class_id desc;
SELECT *from mayikt_student ORDER BY name;
-- 分页查询
-- m=（当前页-1）*条数
-- 分页在语句的最后面
SELECT * from mayikt_student limit 5,5;
SELECT * from mayikt_student ORDER BY age limit 0,5;

-- 聚合查询
SELECT count(*) from mayikt_student;
SELECT count(*) from mayikt_student where age>18;
SELECT SUM(age) from mayikt_student where class_id='1';
SELECT max(age) from mayikt_student ;
SELECT max(age),min(age) from mayikt_student;
SELECT avg(age) from mayikt_student ;
-- null值统计
SELECT count(address) from mayikt_student;

-- 分组查询
-- 注意分组 返回的列 只能是分组的字段 或者 聚合函数
SELECT class_id as '班级', count(*) as '人数' from mayikt_student GROUP BY class_id HAVING count(*) > 1 ORDER BY count(*);




```



### JDBC

jdbc的本质就是：java官方提供的一套规范接口，用于帮助程序员开发者操作不同的关系型数据库(mysql/Oracle/SQLServer)

在java官方只是提供JDBC规范的接口，如果需要连接到具体的数据库，例如mysql：

1.导入mysql驱动jar包;

2.注册驱动 javase 反射机制Class.forName()

3.获取数据库连接

4.获取执行者对象

5.执行sql语句并获取返回结果

6.对结果进行处理

7.释放jdbc资源

**jdbcAPI**

DriverManager   驱动程序管理器是负责管理驱动程序的，驱动注册以后，会保存在DriverManager中的已注册列表中后续的处理就可以对这个列表进行操作.
注册驱动方式

**注册驱动方式**
1.DriverManager.registerDriver();
2.写代码实现
  Class.forName("com.mysql.jdbc.Driver");

开发者是不需要调用DriverManager.registerDriver();方法，因为我们在使用class.forName 会加载到我们的
com.mysql.jdbc.Driver 通过Driver静态代码快 注册我们的Driver驱动

mysql5之后，在jar包中存在一个java.sql.Driver配置文件，文件指定加载com.mysql.cj.jdbc.Driver
通过SPI机制实现。

类加载器、spi 反射技术 javase进阶基础

分层架构

com.mayikt.entity---实体类----创建实体类与数据库表结构字段一一对应的

com.mayikt.dao----数据库访问层----db打交道

com.mayikt.serivce---业务逻辑层

com.mayikt.controller---控制层

如果在db数据类型是为varchar 对应 string

如果在db数据类型是为int对应 Integer



事务是必须满足4个条件（ACID）：原子性（Atomicity，或称不可分割性）、一致性（Consistency）、隔离性（Isolation，又称独立性）、持久性（Durability）。
1.原子性：一个事务（transaction）中的所有操作，要么全部完成，要么全部不完成，不会结束在中间某个环节。事务在执行过程中发生错误，会被回滚（Rollback）到事务开始前的状态，就像这个事务从来没有执行过一样。
2.一致性：在事务开始之前和事务结束以后，数据库的完整性没有被破坏。这表示写入的数据必须完全符合所有的预设规则，这包含数据的精确度、串联性以及后续数据库可以自发性地完成预定的工作。
3.隔离性：数据库允许多个并发事务同时对其数据进行读写和修改的能力，隔离性可以防止多个事务并发执行时由于交叉执行而导致数据的不一致。事务隔离分为不同级别，包括读未提交（Read uncommitted）、读提交（read committed）、可重复读（repeatable read）和串行化（Serializable）。
4.持久性：事务处理结束后，对数据的修改就是永久的，即便系统故障也不会丢失。

JDBC中的事务    

在使用手动提交事务，如果不提交数据也不回滚数据 容易引发行锁问题 导致该行数据一直被锁住，无法被其他线程修改。

Connection的三个方法与事务有关：
setAutoCommit（boolean）:设置是否为自动提交事务，如果true（默认值为true）表示自动提交，也就是每条执行的SQL语句都是一个单独的事务，如果设置为false，那么相当于开启了事务了；con.setAutoCommit(false) 表示开启事务。
commit（）：提交结束事务。
rollback（）：回滚结束事务。



手动事务应用场景：

增加、删除、修改数据---写操作 加上事务

查询操作---不需要加上事务的？

开启事务

提交事务

回滚事务



**数据库连连接池**

1.我们在JDBC编程中，每次创建和断开Connection对象都会消耗一定的时间和IO资源，如果需要频繁的与数据库打交道，该过程效率非常低。因为在Java程序与数据库之间建立连接时，数据库端要验证用户名和密码，并且要为这个连接分配资源,Java程序则要把代表连接的java.sql.Connection对象等加载到内存中,所以建立数据库连接的开销很大。

2.为了避免频繁的创建数据库连接，与时我们可以通过数据库连接池负责分配、管理和释放数据库连接,它允许应用程序重复使用现有的数据库连接，而不是重新建立。

3.数据库连接池大致实现原理：

数据库连接池在初始化时将创建一定数量的数据库连接放到连接池中，当应用程序访问数据库时并不是直接创建Connection,而是向连接池“申请”一个Connection。如果连接池中有空闲的Connection,则将其返回，否则创建新的Connection。使用完毕后,连接池会将该Connection回收，并交付其他的线程复用使用，以减少创建和断开数据库连接的次数，提高数据库的访问效率。

常用的德鲁伊和c3p0数据库连接池。

### Web服务器

Tomcat：由Apache组织提供的一种Web服务器，提供对jsp和Servlet的支持。它是一种轻量级的javaWeb容器（服务器），也是当前应用最广的JavaWeb服务器（免费）。

Jboss：是一个遵从JavaEE规范的、开放源代码的、纯Java的EJB服务器，它支持所有的JavaEE规范（免费）。

GlassFish： 由Oracle公司开发的一款JavaWeb服务器，是一款强健的商业服务器，达到产品级质量（应用很少，收费）。

Resin：是CAUCHO公司的产品，是一个非常流行的应用服务器  的支持，性能也比较优良，resin自身采用JAVA语言开发（收费，应用比较多）。

WebLogic：是Oracle公司的产品，是目前应用最广泛的Web服务器，支持JavaEE规范，而且不断的完善以适应新的开发要求，适合大型项目（收费，用的不多，适合大公司）。

web服务器 底层是如何实现 基于tcp协议封装 http协议、springboot框架 底层内嵌入我们的 Tomcat服务器

web服务器是一个应用程序(软件)，对http协议的进行封装，让web开发更加便捷。



**servlet**

Servlet定义：Servlet是基于Java技术的Web组件，由容器管理并产生动态的内容。Servlet与客户端通过Servlet容器实现的请求/响应模型进行交互。

springmvc----底层基于Servlet

**Servlet环境搭建**

1. 在项目中的libs中导入servlet-api.jar包
2. 在src下创建一个servlet包，用来存放servlet web组件。
3. 在servlet下创建servlet的实现类，重写servlet方法
4. 在实现类上加上注解，@WebServlet("url")，定义url的访问路径
5. 重写Servlet类中的service,在service中编写 动态资源。

servlet由tomcat web服务器创建，因为我们的项目就部署在tomcat服务器上，当服务器启动时，就会加载servlet.class到内存中，从而创建改对象

service由tomcat web服务器调用，当浏览器的url映射能够找到servlet实现类的注解url，服务器就会执行servlet实现类。



**servlet的生命周期**

1. servlet创建

   web容器负责加载Servlet，当web容器启动时或者是在第一次使用这个Servlet时，容器会负责创建Servlet实例，但是用户必须通过部署描述符（web.xml）指定Servlet的位置，或者在类上加上@WebServlet，成功加载后，web容器会通过反射的方式对Servlet进行实例化。@WebServlet(urlPatterns = "/mayiktmeite",loadOnStartup = 1)

   负数---第一次被访问时创建Servlet对象 @WebServlet(urlPatterns = "/mayiktmeite",loadOnStartup = -1)

   0或者正数：服务器启动时创建Servlet对象 数字越小优先级越高

   MeiteServlet  loadOnStartup = 1

   YushengjunServlet   loadOnStartup = 2

   底层会根据loadOnStartup （从0开始）值排序 越小越优先加载创建

   提前创建servlet 或者当你第一次访问servlet 创建servlet 对象

2. servlet初始化

   当我们的servlet类被创建时，执行servlet类初始化方法init 代码初始化

   该方法只会执行一次。在Servlet实例化之后，Servlet容器会调用init()方法，来初始化该对象，主要是为了让Servlet对象在处理客户请求前可以完成一些初始化的工作，例如，建立数据库的连接，获取配置信息等。对于每一个Servlet实例，init()方法只能被调用一次。init()方法有一个类型为ServletConfig的参数，Servlet容器通过这个参数向Servlet传递配置信息。Servlet使用ServletConfig对象从Web应用程序的配置信息中获取以名-值对形式提供的初始化参数。另外，在Servlet中，还可以通过ServletConfig对象获取描述Servlet运行环境的ServletContext对象，使用该对象，Servlet可以和它的Servlet容器进行通信。无论有多少客户机访问Servlet，都不会重复执行init()。

3. servlet请求响应

   每次客户端发送请求达到服务器端 都会执行到 servlet类service方法

   1. 如果客户端发送GET请求，容器调用Servlet的doGet方法处理并响应请求

   2. 如果客户端发送POST请求，容器调用Servlet的doPost方法处理并响应请求

   3. 或者统一用service()方法处理来响应用户请求
   4. service()是Servlet的核心，负责响应客户的请求。每当一个客户请求一个HttpServlet对象，该对象的Service()方法就要调用，而且传递给这个方法一个“请求”（ServletRequest）对象和一个“响应”（ServletResponse）对象作为参数。

4. servlet销毁

   当我们tomcat容器停止时卸载servlet

   存放销毁相关代码

   WEB容器决定销毁Servlet时，先调用Servlet的destroy()方法，通常在关闭web应用之前销毁Servlet

   destroy()仅执行一次，在服务器端停止且卸载Servlet时执行该方法。

5. servlet  对象默认是单例 在jvm内存中只会存在一份 

   当多个线程如果共享到同一个全局变量可能会存在线程安全性问题



servlet方法：

1. init()方法
2. Service()方法
3. destory()方法
4. getServletConfig()方法
5. getServletInfo()方法



**request与response对象**

代码

```java
package com.feiyu.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author ：yhf
 * @date ：Created in 2023/4/7 16:25
 * @description：
 */
@WebServlet("/httpServletDemo04")
public class HttpServletDemo04 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String userPwd = req.getParameter("userPwd");
        resp.setHeader("Content-Type", "text/html;charset=UTF-8");//必须在获取输出流写之前
        PrintWriter writer = resp.getWriter();
        if ("feiYu".equals(userName) && "12345".equals(userPwd)) {
            writer.write("<html><meta charset=\"utf-8\"/><body><h1>恭喜您登录成功,用户名称是:" + userName + "</h1></body><html/>");
        }else{
            writer.write("<html><meta charset=\"utf-8\"/><body><h1>很遗憾密码错误</h1></body></html>");
        }
        writer.close();
    }


}

```



**Request获取请求数据**

> \1. 请求行部分
>
> String getMethod()		// 获取请求方式
>
> String getContextPath()		// 获取项目访问路径 /mayikt-tomcat04
>
> StringBuffer getRequestURL()	// 获取 URL 统一资源定位符		
>
> String getRequestURI()	// 获取 URI 统一资源标识符		
>
> String getQueryString()		// 获取请求参数(Get 方式)		username=feiyu&password=123
>
> 2.请求头部分
>
> String getHeader(String name)		// 根据请求头名称, 获取值
>
> User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36
>
> 3.请求体部分 (Post 才有)
>
> 通过 流读取 来获取 Post请求的参数       userName=mayikt&password=123
>
> ServletInputStream getInputStream()		// 字节输入流
>
> BufferedReader getReader()				// 字符输入流  readLine();



**request获取请求参数**

Request对象里封装好了一个 Map集合，Map集合里放的就是所有的参数
Map<String,String[]> getParameterMap()		// 返回这个 Map 集合
String[] getParameterValues(String name)		// 根据 键名 获取值
String getParameter(String name)				// 根据 键名 获取值



**request请求转发**

请求转发：一种在服务器内部的资源跳转方式

1. 通过request对象获取请求转发器对象：

   RequestDispatcher getRequestDispatcher(String path)

2. 使用RequestDispatcher独享来进行转发：

    forward(ServletRequest request, ServletResponse response)

   

   RequestDispatcher requestDispatcher = request.getRequestDispatcher("/requestDemo6");

   ​        requestDispatcher.forward(request,response);

   浏览器地址栏路径不发生变化；

   只能转发到当前服务器内部资源中；

   转发是一场请求。

request.setAttribute("name",value)； 数据共享

有效范围是一个请求范围，不发送请求的界面无法获取到value的值，jsp界面获取使用EL表达式${num}；

只能在一个request内有效，如果重定向客户端，将取不到值。

request在当次的请求的URL之间有效，比如，你在请求某个servlet，那么你提交的信息，可以使用request.getAttribute()方式获得，而当你再次跳转之后，这些信息将不存在。

**response响应数据**

> esponse是Servlet.service方法的一个参数，类型为javax.servlet.http.HttpServletResponse。在客户端发出每个请求时，服务器都会创建一个response对象，并传入给Servlet.service()方法。response对象是用来对客户端进行响应的，这说明在service()方法中使用response对象可以完成对客户端的响应工作。
>
> //设置服务端的编码
>
> resp.setCharacterEncoding("UTF-8");
>
> //通过设置响应头设置客户端（浏览器的编码）
>
> resp.setHeader("Content-type","text/html;utf-8");
>
> //这个方法可以同时设置客户端和服务端，因为它会调用setCharacterEncoding方法
>
> resp.setContentType("text/html;charset=utf-8");
>
> resp.setContentType("text/html;charset=utf-8");
>
> 响应格式分为3个部分
>
> 1.响应行：响应数据第一行   http协议版本1.1版本 
>
> 200表示响应状态码 ok为 成功状态
>
> 2.响应头：第二行开始 格式 key value
>
> 3.响应体
>
> 
>
> response是响应对象，向客户端输出响应正文（响应体）可以使用response的响应流，repsonse一共提供了两个响应流对象：
>
> PrintWriter out = response.getWriter()：获取字符流；
>
> ServletOutputStream out = response.getOutputStream()：获取字节流；
>
> 如果响应正文内容为字符，那么使用response.getWriter()，如果响应内容是字节，例如下载时，那么可以使用response.getOutputStream()。
>
> 
>
>  //设置错误的响应码
>
> resp.setError(404,"未找到请求的资源！");
>
> //设置正确的响应码
>
> resp.setStatus(200);
>
> 
>
> HttpServletResponse 
>
> ServletResponse
>
> ServletResponse------ 接口   java提供的响应对象根接口
>
> HttpServletResponse ------ 接口（继承ServletResponse）  java提供的对http协议封装响应对象接口 
>
> org.apache.catalina.connnector.ResponseFacade —— 类（Tomcat编写的，实现HttpServletResponse ）



**response重定向**

重定向原理

当我们的客户端发送请求达到服务器端，我们的服务器端响应状态码302 ，同时在响应头中

设置重定向地址（resp.setHeader("Location","www.mayikt.com");） ；

客户端（浏览器）收到结果之后，在浏览器解析Location  www.mayikt.com 在直接重定向到

www.mayikt.com

两次请求。

地址栏有发生变化的。

首先客户浏览器发送http请求，当web服务器接受后发送302状态码响应及对应新的location给客 户浏览器，客户浏览器发现是302响应，则自动再发送一个新的http请求，请求url是新的location 地址，服务器根据此请求寻找资源并发送给客户。

 void sendRedirect(String location) 使用指定的重定向位置URL，向客户端发送临时重定向响应

resp.setStatus(302);

1.重定向之后，浏览器地址栏的URL会发生改变

2.重定向过程中会将前面Request对象销毁，然后创建一个新的Request对象

3.重定向的URL可以是其它项目工程

**重定向与转发区别**

1.转发只能将请求转发给同一个web应用（项目工程）中的其他组件（servlet程序）；重定向可以重定向到任意的地址，网络地址或是文件地址（跨项目文件夹 www.mayikt.com）

2.重定向访问结束后，浏览器地址栏URL发生变化，变成了重定向后的URL；转发则不变

重定向对浏览器的请求直接做出响应，结果就是告诉浏览器去重新发出另一个新的URL访问请求；请求转发在服务器端内部将请求转发给另一个资源，浏览器不知道服务器程序内部发生了转发过程

3.请求转发调用者与被调用者之间共享相同的请求对象，属于同一个请求和响应过程；重定向则是不同的请求和响应过程

**注意：tomcat 在运行过程中 会在lib目录中查找jar包 发现没有 就会报该错误。**

**但是我们在编译阶段是在项目中lib 查找jar包，编译阶段没有报错。**

**将该 jar包拷贝到  tomcat -lib 目录中即可**



**注意**

```java
req.setCharacterEncoding("utf-8");//设置获取的请求数据的编码格式
resp.setContentType("text/html;charset=utf-8");//设置响应给客户端的数据的编码格式
通常两者配合使用，否则会出现中文乱码
```



**jsp**



1.jsp运行在服务器

2.jsp的基础是Servlet（相当于对Servlet进行了一个包装而已）

3.jsp就是根据： html + java片段 + JSP标签(语法) + javascript(css)

1.JSP的全称是Java Server Pages，它和Servlet技术一样，都是SUN公司定义的一种用于开发动态web资源的技术。

2.jsp这门技术的最大的特点在于，写jsp就像在写HTML，但：它相对于html而言，html只能为用户提供静态数据，而jsp技术允许在页面中嵌套java代码，为用户提供动态数据。

3.相比Servlet而言，Servlet很难对数据进行排版，而jsp除了可以用java代码产生动态数据的同时，也很容易对数据进行排版。



apache对EL表达式的扩展（也就是说JSTL依赖EL），JSTL是标签语言！JSTL标签使用以来非常方便，它与JSP动作标签一样，只不过它不是JSP内置的标签，需要我们自己导包，以及指定标签库而已

f标签的test属性必须是一个boolean类型的值，如果test的值为true，那么执行if标签的内容，否则不执行。



### 会话技术

1.用户打开同一个浏览器，访问到我们的web服务器的资源建立会话，对方断开连接该会话才会结束，在一次会话中可以包含多次请求和响应。通俗易懂的理解：一种维护浏览器状态的方法，服务器需要识别多次请求是否来自于用一个浏览器，以便于在同一次会话的多次请求间共享数据。

2.这是因为http协议是无状态的，每次浏览器向服务器请求时，没有绑定会话信息服务器都会认为该请求是为新请求，没有任何记忆功能，所以我们需要会话跟踪技术实现会话内数据共享。

会话技术实现方式

实现方式：   

 1.客户端会话跟踪技术：Cookie   

 2.服务端会话跟踪技术：Session

3.token或者jwt----新的



**cookie**

Cookie:客户端会话技术，将数据保存到客户端，以后每次请求都携带Cookie数据进行访问

Cookie 数据存放在浏览器端(客户端)



**创建cookie**

1.创建Cookie

Cookie cookie = new Cookie("key","value");

2.使用response响应Cookie给客户端（浏览器）

response.addCookie(cookie);

3.使用response响应Cookie给客户端（浏览器）

**获取Cookie**

获取客户端携带的所有Cookie，使用request对象

```java
Cookie[] cookies = request.getCookies();
cookie.getName();
cookie.getValue();
```

在没有清理浏览器缓存的情况下？请问重启tomcat服务器？cookie数据会丢失吗？

不会的



**cookie的原理解析**

基本实现原理：

Cookie实现是基于HTTP协议的

1.响应头：set—cookie

客户端（浏览器端）发送请求达到服务器端，服务器端会创建cookie，会将该cookie数据

返回给客户端，在响应头中设置  set—cookie value cookie数据。

2.请求头：cookie

同一个浏览器发送请求时，在请求中设置该cookie数据 存放在请求头中。

cookie value

**Cookie过期时间**

setMaxAge(int seconds):设置Cookie存活时间 

1.正数：将Cookie写入浏览器所在的电脑硬盘，持久化存储，到期自动删除 

2.负数：默认值，Cookie存储在浏览器内存中，当浏览器关闭，内存释放，则Cookie被销毁。

3.零：删除对应Cookie



**session使用**  

1.服务器端会话跟踪技术：将数据保存在服务器端 

   底层基于cookie实现封装的

2.常用的API：

 2.1void session.setAttribute(k,v)   session存入值 key=name,value 'yushengjun'

 2.2Object session.getAttribute(k) 获取到session中的值

  2.3void removeAttribute(k) 删除我们的session



**session原理**

1.当我们客户端发送请求达到服务器端时创建session，会得到一个sessionid，在将该

sessionid  响应在响应头<sessionid  > 

2.客户端（浏览器）接受响应头中的sessionid  ，会将该sessionid的值 存放在浏览器中。

session本质上就是基于cookie实现封装的。

3.使用同一个浏览器发送请求时，访问通一个服务器端，会在请求头中设定该sessionid  的值，服务器端就会从请求头中获取到该sessionid  查找对应session。

session 数据存放在服务器端 cookie将数据存放在本地。

**session细节**

1.当客户端关闭后，服务器不关闭的话，获取到的session是否是同一个。因为客户端关闭后，cookie对象被销毁，客户端请求服务器会创建新的session。如果需要相同，可以设置cookie的最大存活时间，让cookie持久化保存两次获取Session是否为同一个

2.在默认情况下，不是同一个。如果需要两个Session相同，则可以创建一个Cookie对象，key为：JSESSIONID，设置一下最大存活时间，让Cookie持久化保存Session的ID，就可以实现客户端关闭，两次获取Session就是同一个。

2.客户端不关闭，服务器关闭后的话，两次获取的Session是同一个吗？

不是同一个，但是为了确保数据不丢失，因为同样服务器关闭后session对象会被销毁 ，如果想确保数据不丢失，可以使session钝化，即在服务器正常关闭之前，将session对象序列化到硬盘上。下次在服务器启动后，将session文件反序列化转化为内存中的session对象即可。

0D202066E021E4F4FB978F1647C0D742

tomcat自动完成以下工作：

1.session的钝化：在服务器正常关闭之前，将session对象系列化到硬盘上。

2.session的活化： 在服务器启动后，将session文件转化为内存中的session对象即可。

3.session什么时候被销毁？

1.服务器关闭；

2.session对象调用invalidate() ；

3.session默认失效时间 30分钟。

token---



**session与cookie区别**

1.session用于存储一次会话的多次请求的数据，存在服务器端；

2.session可以存储任意类型，任意大小的数据。

session与Cookie的区别：

1.session存储数据在服务器端，Cookie在客户端；

2.session没有数据大小限制，Cookie有数据大小限制；

3.session数据安全，Cookie相对于不安全

**记住密码**

思路：

用户登录成功之后，会将用户的名称和密码 写入在cookie中，

当我们用户下次登录时，会直接从cookie中获取到数据 回显到

login.jsp中 这样的话就不需要用户重复的数据用户名称和密码。



**图形验证码**

图形底层实现原理

java支持根据内容生成图片

abcd 企业实际开发中图形验证码工具类 底层细节我们自己去开发的



1.生成图形验证码内容 abch

2.调用java的api 将我们的该内容 生成一张图片abch

3.将该形验证码内容 abch 存放在session中



用户点击注册时：获取用户输入的图形验证码和session中验证码比对 如果一致的情况下

则开始做注册流程。





![img](https://cdn.nlark.com/yuque/0/2022/png/25438525/1654659286758-348ebaba-b375-49c3-ac19-64e82310c439.png)

**过滤器**

过滤器应用场景

过滤器是处于客户端与服务器资源文件之间的一道过滤网，在访问资源文件之前，通过一系列的过滤器对请求进行修改、判断等，把不符合规则的请求在中途拦截或修改。也可以对响应进行过滤，拦截或修改响应.

应用场景： 判断用户是否登录、过滤器请求记录日志、身份验证、权限控制等。

什么是过滤器  拦截过滤请求

过滤器可以 减少代码冗余性问题

**拦截器路径配置**

1.所有资源拦截：@WebFilter("/*") //这是指访问所有资源的时候都会经过过滤器

静态资源(css/js/mp4) 

2.具体资源路z径拦截：@WebFilter("/index.jsp") //这是指访问index.jsp的时候会经过过滤器

3.具体目录拦截：@WebFilter("/mayik/*") //这是指访问mayikt目录下的所有资源时会经过过滤器

127.0.0.1:8080/mayikt/A

127.0.0.1:8080/mayikt/B

4.具体后缀名拦截：@WebFilter("*.jsp") //这时指访问后缀名为.jsp的资源时会经过过滤器

**监听器**

\1. 监听器Listener就是在application,session,request三个对象创建、销毁或者往其中添加修改删除属性时自动执行代码的功能组件。

\2. Listener是Servlet的监听器，可以监听客户端的请求，服务端的操作等。

\3. Listener实现了javax.servlet.ServletContextListener 接口的服务器端程序，它也是随web应用的启动而启动，只初始化一次，随web应用的停止而销毁。主要作用是：做一些初始化的内容添加工作、设置一些基本的内容、比如一些参数或者是一些固定的对象等.

1.ServletContext监听

ServletContextListener：用于对Servlet整个上下文进行监听；

ServletContextAttributeListener：对Servlet上下文属性的监听。

2.Session监听

HttpSessionListener接口：对Session的整体状态的监听；

HttpSessionAttributeListener接口：对session的属性监听。

3.Request监听

ServletRequestListener：用于对Request请求进行监听；

ServletRequestAttributeListener：对Request属性的监听。



**axios(ajax)发送请求**

Ajax即Asynchronous Javascript And XML（异步JavaScript和XML）在 2005年被Jesse James Garrett提出的新术语，用来描述一种使用现有技术集合的‘新’方法，包括: HTML 或 XHTML, CSS, JavaScript, DOM, XML, XSLT, 以及最重要的XMLHttpRequest。 [3]  使用Ajax技术网页应用能够快速地将增量更新呈现在用户界面上，而不需要重载（刷新）整个页面，这使得程序能够更快地回应用户的操作。



**axios 介绍**

1.axios 是一个专注于网络请求的库，核心负责发请求和拿数据

在后面的vue react都会用axios来请求数据（类似于后端 httpclient）

2.Axios，是一个基于promise [5]  的网络请求库，作用于[node.js](https://baike.baidu.com/item/node.js/7567977)和[浏览器](https://baike.baidu.com/item/浏览器/213911)中，它是 isomorphic 的(即同一套代码可以运行在浏览器和node.js中)。在[服务端](https://baike.baidu.com/item/服务端/6492316)它使用原生node.js [http](https://baike.baidu.com/item/http/243074)模块, 而在客户端 (浏览端) 则使用XMLHttpRequest。

3.https://www.axios-http.cn/



**axios 发送get/post请求**

页面引入axios  cdn依赖  

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

```
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

  // 1. 调用 axios 方法得到的返回值是 Promise 对象
   axios({
     // 请求方式
     method: 'GET',
     // 请求的地址
     url: '接口地址',
     // URL 中的查询参数
     params: {
       id: 1
     }
   }).then(function (result) {
     console.log(result)
   })

 
```



**json**

JSON: JavaScript Object Notation(JavaScript 对象表示法)；

JSON 是存储和交换文本信息的语法。类似 XML；

JSON ---数据交换格式

客户端与服务器端之间通讯  ---数据交换格式

JSON  体积XML 更小减少带宽传输

JSON 比 XML 更小、更快，更易解析；



1、JSON是由键值对构成的；

2、键要用引号（单双都行）引起，也可以不引；

3、取值范围：

数字（整数或浮点数）

字符串（在双引号中）

逻辑值（true 或 false）

数组（在中括号中）

对象（在大括号中）

null，不常用



**fastonjson用法**

常见解析器：JsonLib，Gson，fastjson(阿里)，jackson（Spring MVC内置解析器



### Maven

Maven就是一款帮助程序员构建项目的工具，我们只需要告诉Maven需要哪些Jar 包，它会帮助我们下载所有的Jar，极大提升开发效率

> 1.清理，把之前项目编译的东西删除掉，为新的编译代码做准备。
> 2.编译，把程序源代码编译为执行代码，java-class文件
> 批量的，maven可以同时把成千上百的文件编译为class
> javac不一样，javac一次编译一个文件。
> 3.测试：maven可以执行测试程序代码，验证你的功能是都正确。
> 批量的，maven可以同时执行多个测试代码，同时测试很多功能。
> 4.报告，生成的测试结果的文件，测试通过没有。
> 5.打包，把你的项目中所有的class文件，配置文件等所有资源放到一个压缩文件中。
> 这个压缩文件就是项目的结果文件，通常java程序压缩文件是jar扩展名的。对于web应用， 压缩文件扩展名是.war。
> 6.安装，把5中生成的文件jar，war安装到本地仓库
> 7.部署，把程序安装好可以执行

**Maven规定的统一的目录结构**

```
maven项目标准目录结构：
 maven的java工程：
  src/main/java目录  核心代码部分
  src/main/resources  配置文件部分
  src/test/java目录  测试代码部分
  src/test/resources  测试配置文件
 maven的web工程：
  src/main/webapp 页面资源，js，css，图片等等
```

**maven下载jar包原理**

 本地仓库  当前计算机电脑自己   安装maven环境  缓存jar包

 私服仓库

 远程仓库

仓库-----缓存我们的jar包

使用maven统一管理维护我们项目中所有的jar包

原理

1.当前我们的项目会引入jar包，先去maven本地仓库

中查找该jar包，如果maven本地仓库中有该jar包则直接

使用maven本地仓库中的jar包。

2.如果maven本地仓库中没有该jar包，则会maven中央仓库

中下载该jar包 在缓存到我们maven本地仓库中。

3.如果去maven中央仓库下载jar包 速度可能会非常慢

maven本地仓库→maven私服→maven中央仓库

本地仓库适合于： 在同一台计算机电脑上 多个不同的项目 共享同一个本地仓库

maven私服适合于 多个不同的开发 共享使用同一个maven私服仓库

![img](https://cdn.nlark.com/yuque/0/2022/png/25438525/1655962907259-156d6c12-e11e-4666-8dfa-ea6850ddae5b.png)



**maven环境的安装**

第一步：下载Maven的安装包（https://maven.apache.org/download.cgi）

第二步：  解压apache-maven-3.6.3-bin.zip这个文件

第三步：进入我的电脑-->右击属性-->高级设置-->点击环境变量

 添加MAVEN_HOME的变量名 为 maven安装路径

 MAVEN_HOME=D:\path\maven\apache-maven-3.2.5

 第四步：进入Path，添加%MAVEN_HOME%\bin

 第五步：检查自己的maven是否配置成功

 按下win+r 并输入cmd 进入命令行模式。

 在命令行模式输入 mvn -version； 



**maven常用命令**

```
命令	描述
mvn clean	对项目进行清理，删除target目录下编译的内容
mvn compile	编译项目源代码
mvn test	对项目进行运行测试
mvn package	打包文件并存放到项目的target目录下，打包好的文件通常都是编译后的class文件
mvn install	在本地仓库生成仓库的安装包，可供其他项目引用，同时打包后的文件放到项目的target目录下
```

配置

```
   <dependencies>
        <!--servlet 自动去远程仓库下载jar ，在缓存到本地仓库中-->
        <dependency>
            <groupId>jakarta.servlet</groupId>
            <artifactId>jakarta.servlet-api</artifactId>
            <version>5.0.0</version>
        </dependency>
        <!--mysql驱动-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.37</version>
        </dependency>
    </dependencies>
    settings.xml配置私服仓库
    <mirror>
          <id>nexus-aliyun</id>
          <mirrorOf>central</mirrorOf>
          <name>Nexus aliyun</name>
          <url>http://maven.aliyun.com/nexus/content/groups/public</url> 
      </mirror>
      
      
```











### mybatis

mybatis是一个用java编写的持久层框架，使用ORM实现了结果集的封装。

ORM是Object Relational Mapping 对象关系映射。把数据库表和实体类及实体类的属性对应起来，让开发者操作实体类就实现操作数据库表，它封装了jdbc操作细节，使用时只需关注sql语句，不用管理驱动注册、连接等过程。

ORM是一种程序设计思想，mybatis就是orm的一种实现方式，将数据库中查询的数据映射到对应的实体中。

**安装步骤**

1.引入mybatis相关依赖 已经完成了

2.mybatis-config.xml（该配置文件名称是可以改） 存放就是我们数据库相关连接信息

3.定义mapper ----编写我们mybatis 相关  sql语句  每个表 对应一个mapper 

4.定义java对象--需要注意下 类中的 成员属性与数据库表中字段 映射 默认 类中的 成员属性数据库表中字段名称对应的。

5.使用 mybatis api开始执行该 sql语句即可 得到结果

 maven依赖

```xml

        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>3.4.5</version>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.18</version>
        </dependency>
```

定义xml配置数据库

```xml
存放数据库连接信息mybatis-config.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
    <environments default="development">
        <environment id="development">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://127.0.0.1:3306/feiyu?serverTimezone=GMT%2B8"/>
                <property name="username" value="root"/>
                <property name="password" value="root"/>
            </dataSource>
        </environment>
    </environments>
    <mappers>
        <mapper resource="mybatis/userMaaper.xml"/>
    </mappers>
</configuration>
```

mapper文件

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="userMapper">
    <select id="getByUsers" resultType="com.mayikt.entity.UserEntity">
        select * from mayikt_users
  </select>
</mapper>
```

测试代码

```java
public class Test01 {
    public static void main(String[] args) throws IOException {
        // 1.读取加载mybatis-config.xml
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        // 2.获取到获取到
        SqlSession sqlSession = sqlSessionFactory.openSession();
        // 3.根据 mapper id=getByUsers 执行该s  ql 语句 通过  sql语句得到我们的对象 orm
        List<UserEntity> userEntitys = sqlSession.selectList("getByUsers", UserEntity.class);
        System.out.println(userEntitys);
        sqlSession.close();
    }
}

```



**mybatis映射文件标签**

select：映射查询语句

insert：映射插入语句

update：映射更新语句

delete：映射删除语句

sql：可以重用的 sql 代码块

resultMap：最复杂，最有力量的元素，用来描述如何从数据库结果集中加载你的对象

cache：配置给定命名空间的缓存

cache-ref：从其他命名空间引用缓存配置



select标签：

```xml
<select
　　<!-- 
　　　　1. id（必须配置）
　　　　id是命名空间中的唯一标识符，可被用来代表这条语句
　　　　一个命名空间（namespace）对应一个dao接口
　　　　这个id也应该对应dao里面的某个方法（sql相当于方法的实现），因此id应该与方法名一致
　　 -->
　　id="selectUser"

　　<!-- 
　　　　2. parapeterType（可选配置，默认由mybatis自动选择处理）
　　　　将要传入语句的参数的完全限定名或别名，如果不配置，mybatis会通过ParamterHandler根据参数类型默认选择合适的typeHandler进行处理
　　　　paramterType 主要指定参数类型，可以是int, short, long, string等类型，也可以是复杂类型（如对象）
　　 -->
　　parapeterType="int"

　　<!-- 
　　　　3. resultType（resultType 与 resultMap 二选一配置）
　　　　用来指定返回类型，指定的类型可以是基本类型，也可以是java容器，也可以是javabean
　　 -->
　　resultType="hashmap"
　　
　　<!-- 
　　　　4. resultMap（resultType 与 resultMap 二选一配置）
　　　　用于引用我们通过 resultMap 标签定义的映射类型，这也是mybatis组件高级复杂映射的关键
　　 -->
　　resultMap="USER_RESULT_MAP"
　　
　　<!-- 
　　　　5. flushCache（可选配置）
　　　　将其设置为true，任何时候语句被调用，都会导致本地缓存和二级缓存被清空，默认值：false
　　 -->
　　flushCache="false"

　　<!-- 
　　　　6. useCache（可选配置）
　　　　将其设置为true，会导致本条语句的结果被二级缓存，默认值：对select元素为true
　　 -->
　　useCache="true"

　　<!-- 
　　　　7. timeout（可选配置）
　　　　这个设置是在抛出异常之前，驱动程序等待数据库返回请求结果的秒数，默认值为：unset（依赖驱动）
　　 -->
　　timeout="10000"

　　<!-- 
　　　　8. fetchSize（可选配置）
　　　　这是尝试影响驱动程序每次批量返回的结果行数和这个设置值相等。默认值为：unset（依赖驱动）
　　 -->
　　fetchSize="256"

　　<!-- 
　　　　9. statementType（可选配置）
　　　　STATEMENT, PREPARED或CALLABLE的一种，这会让MyBatis使用选择Statement, PrearedStatement或CallableStatement，默认值：PREPARED
　　 -->
　　statementType="PREPARED"

　　<!-- 
　　　　10. resultSetType（可选配置）
　　　　FORWARD_ONLY，SCROLL_SENSITIVE 或 SCROLL_INSENSITIVE 中的一个，默认值为：unset（依赖驱动）
　　 -->
　　resultSetType="FORWORD_ONLY"
></select>
```

resultMap标签的属性信息

```xml
<!-- 
　　1. type 对应的返回类型，可以是javabean, 也可以是其它
　　2. id 必须唯一， 用于标示这个resultMap的唯一性，在使用resultMap的时候，就是通过id引用
　　3. extends 继承其他resultMap标签
 -->
<resultMap type="" id="" extends="">　　
　　<!-- 
　　　　1. id 唯一性，注意啦，这个id用于标示这个javabean对象的唯一性， 不一定会是数据库的主键（不要把它理解为数据库对应表的主键）
　　　　2. property 属性对应javabean的属性名
　　　　3. column 对应数据库表的列名
       （这样，当javabean的属性与数据库对应表的列名不一致的时候，就能通过指定这个保持正常映射了）
　　 -->
　　<id property="" column=""/>
        
　　<!-- 
　　　　result 与id相比，对应普通属性
　　 -->    
　　<result property="" column=""/>
        
　　<!-- 
　　　　constructor 对应javabean中的构造方法
　　 -->
　　<constructor>
　　　　<!-- idArg 对应构造方法中的id参数 -->
       <idArg column=""/>
       <!-- arg 对应构造方法中的普通参数 -->
       <arg column=""/>
   </constructor>
   
   <!-- 
　　　　collection 为关联关系，是实现一对多的关键 
　　　　1. property 为javabean中容器对应字段名
　　　　2. ofType 指定集合中元素的对象类型
　　　　3. select 使用另一个查询封装的结果
　　　　4. column 为数据库中的列名，与select配合使用
    -->
　　<collection property="" column="" ofType="" select="">
　　　　<!-- 
　　　　　　当使用select属性时，无需下面的配置
　　　　 -->
　　　　<id property="" column=""/>
　　　　<result property="" column=""/>
　　</collection>
        
　　<!-- 
　　　　association 为关联关系，是实现一对一的关键
　　　　1. property 为javabean中容器对应字段名
　　　　2. javaType 指定关联的类型，当使用select属性时，无需指定关联的类型
　　　　3. select 使用另一个select查询封装的结果
　　　　4. column 为数据库中的列名，与select配合使用
　　 -->
　　<association property="" column="" javaType="" select="">
　　　　<!-- 
　　　　　　使用select属性时，无需下面的配置
　　　　 -->
　　　　<id property="" column=""/>
　　　　<result property="" column=""/>
　　</association>
</resultMap>
```



insert标签的属性信息

```xml
<insert
　　<!--
　　　　同 select 标签
　　 -->
　　id="insertProject"

　　<!-- 
　　　　同 select 标签
　　 -->
　　paramterType="projectInfo"
　　
　　<!-- 
　　　　1. useGeneratedKeys（可选配置，与 keyProperty 相配合）
　　　　设置为true，并将 keyProperty 属性设为数据库主键对应的实体对象的属性名称
　　 --> 
　　useGeneratedKeys="true"

　　<!-- 
　　　　2. keyProperty（可选配置，与 useGeneratedKeys 相配合）
　　　　用于获取数据库自动生成的主键
　　 -->
　　keyProperty="projectId"
>
```



重用sql标签

```xml
<sql id="userColumns">id,username,password</sql>
```

**完全限定名使用别名替代**

每个 sql 映射文件的要元素中，都需要指定一个名称空间，用以确保每个映射语句的 id 属性不会重复。如<mapper namespace="com.mayikt.mapper.UserMapper">

在 Java 代码中引用某个 sql 映射时，使用的亦是含有名称空间的全路径。如

session.update("com.mayikt.mapper.UserMapper.udpateUser", user);  



mapper代理接口

```java
package com.feiyu.mapper;

import com.feiyu.entity.FlightEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author author
 * @create 2023 - 04 - 10 15:44
 */
public interface FlightMapper {
    List<FlightEntity> getByFlightAll();//查询所有数据
    FlightEntity getByFlightId(Integer id);//根据id查询数据

    int insertFlight(FlightEntity flightEntity);//插入数据，返回int

    int deleteFlight(Integer id);//删除数据

    int updateFlight(FlightEntity flightEntity);//修改数据

    List<FlightEntity> getByFlightParamMap(Map<String,String> paramMap);//多条件查询使用Map

    List<FlightEntity> getByFlightParam(@Param("company") String company, @Param("departureAirport") String departureAirport, @Param("model") String model);//多条件查询使用@param()

    List<FlightEntity> getByFlightParamPojo(FlightEntity flightEntity);//多条件查询使用pojo
}

```

xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- namespace=-->
<mapper namespace="com.feiyu.mapper.FlightMapper">
    <resultMap id="flightEntityMap" type="com.feiyu.entity.FlightEntity">
        <!-- 数据库中字段名称 column="" property="id"  类中成员属性名称-->
        <id column="id" property="id"></id>
        <result column="flight_id" property="flightId"></result>
        <result column="company" property="company"></result>
        <result column="departure_airport" property="departureAirport"></result>
        <result column="arrive_airport" property="arriveAirport"></result>
        <result column="departure_time" property="departureTime"></result>
        <result column="arrive_time" property="arriveTime"></result>
        <result column="model" property="model"></result>
        <result column="is_delete" property="isDelete"></result>
    </resultMap>
    <!--  定义数据库中字段名称与我们 类中成员属性值 关联映射-->
    <select id="getByFlightAll" resultMap="flightEntityMap">
        select * from feiyu_flight;
    </select>

    <select id="getByFlightId" parameterType="int" resultMap="flightEntityMap">
        select * from feiyu_flight where id = #{id};
    </select>

    <insert id="insertFlight" parameterType="com.feiyu.entity.FlightEntity" >
        INSERT INTO `feiyu`.`feiyu_flight` (`id`, `flight_id`, `company`, `departure_airport`, `arrive_airport`, `departure_time`, `arrive_time`, `model`, `is_delete`)
        VALUES (null, #{flightId}, #{company},#{departureAirport}, #{arriveAirport}, #{departureTime}, #{arriveTime}, #{model}, #{isDelete});

    </insert>

    <delete id="deleteFlight" parameterType="int">
        delete  from feiyu_flight where id="2";
    </delete>

    <update id="updateFlight" parameterType="com.feiyu.entity.FlightEntity">
        UPDATE `feiyu`.`feiyu_flight`
        SET `flight_id` = #{flightId}, `company` = #{company}, `departure_airport` = #{departureAirport},
        `arrive_airport` = #{arriveAirport}, `departure_time` = #{departureTime}, `arrive_time` = #{arriveTime}, `model` = #{model}, `is_delete` = #{isDelete} WHERE `id` = #{id};

    </update>

<!--    多条件查询-->
    <select id="getByFlightParamMap"  resultMap="flightEntityMap">
        SELECT * FROM feiyu_flight WHERE company=#{company} AND departure_airport=#{departureAirport} AND
            model=#{model};
    </select>

    <select id="getByFlightParam"  resultMap="flightEntityMap">
        SELECT * FROM feiyu_flight WHERE company=#{company} AND departure_airport=#{departureAirport} AND
            model=#{model};
    </select>

<!--    pojo对象查询使用的最多-->
    <select id="getByFlightParamPojo"  parameterType="com.feiyu.entity.FlightEntity" resultMap="flightEntityMap">
        SELECT * FROM feiyu_flight
#         动态条件查询，当没有传参的时候，就默认忽略此规则，不会影响后面的语句
        <where>
            <if test="company!=null and  company!=''">
                and company=#{company}
            </if>
            <if test="departureAirport!=null and  departureAirport!=''">
                and departure_airport=#{departureAirport}
            </if>
            <if test="model!=null and  model!=''">
                and model=#{model};
            </if>
        </where>
    </select>
</mapper>
```



### Spring

spring是一个JavaEE开源的轻量级别的框架，能够让编码更简单，核心组件IOC容器和Aop面向切面编程。

1.IOC控制反转：把整个对象创建的过程，统一交给SpringIOC容器来实现，底层使用反射+工厂模式实现

2.Aop面向切面编程：对我们功能（方法）前后实现增强，比如打印日志、事物原理、权限管理，底层是基于动态代理实现的。

减少到我们的代码的冗余性问题。

Spring优势：

1. 方法的解耦，简化开发
2. Aop技术的支持
3. 提供声明事务支持
4. Junit单元测试
5. 方便整合其他框(Mybatis、SpringMVC、SpringBoot、SpringCloud、Redis等)
6. 降低我们的JavaEEapi开发使用的难度(Spring对很多复杂的api接口实现了封装)



**Spring与SpringBoot的关系**

SpringBoot直接采用注解化的方式启动，底层会依赖于Spring/SpringMVC注解方式启动。

总结：SpringBoot底层基于Spring/SpringMVC注解化实现封装。

例如：

​	1.@RestController

   2.@ComponentScan("com.mayikt.aop")](mailto:2.@ComponentScan(\)

3. @Configuration

4. @Component

5. @Scheduled

6. @Value

7. @Bean



**spring的七大核心模块**

**spring Core**

核心容器提供Spring框架的基本功能。Spring以bean的方式组织和管理Java应用中的各个组件及其关系。Spring使用BeanFactory来产生和管理Bean，它是工厂模式的实现。BeanFactory使用控制反转(IoC)模式将应用的配置和依赖性规范与实际的应用程序代码分开。

**spring context**

Spring上下文是一个配置文件，向Spring框架提供上下文信息。Spring上下文包括企业服务，如JNDI、EJB、电子邮件、国际化、校验和调度功能。

**spring DAO**

JDBC、DAO的抽象层提供了有意义的异常层次结构，可用该结构来管理异常处理，和不同数据库供应商所抛出的错误信息。异常层次结构简化了错误处理，并且极大的降低了需要编写的代码数量，比如打开和关闭链接。

**spring AOP**

通过配置管理特性，Spring AOP 模块直接将面向方面的编程功能集成到了 Spring框架中。所以，可以很容易地使 Spring框架管理的任何对象支持 AOP。Spring AOP 模块为基于 Spring 的应用程序中的对象提供了事务管理服务。通过使用 Spring AOP，不用依赖 EJB 组件，就可以将声明性事务管理集成到应用程序中。

**spring ORM**

Spring框架插入了若干个ORM框架，从而提供了ORM对象的关系工具，其中包括了Hibernate、JDO和 IBatis SQL Map等，所有这些都遵从Spring的通用事物和DAO异常层次结构。

**spring Web**

1. 此模块建立在SpringContext基础之上，提供了Servlet监听器的Context和Web应用的上下文；
2. 对现有的Web框架，如JSF、Tapestry、Structs等提供了集成；
3. SpringWeb模块还简化了处理多部分请求以及将请求参数绑定到域对象的工作。

**spring Web MVC**

MVC框架是一个全功能的构建Web应用程序的MVC实现。通过策略接口，MVC框架变成为高度可配置的。MVC容纳了大量视图技术，其中包括JSP、POI等，模型来有JavaBean来构成，存放于m当中，而视图是一个街口，负责实现模型，控制器表示逻辑代码，由c的事情。Spring框架的功能可以用在任何J2EE服务器当中，大多数功能也适用于不受管理的环境。Spring的核心要点就是支持不绑定到特定J2EE服务的可重用业务和数据的访问的对象，毫无疑问这样的对象可以在不同的J2EE环境，独立应用程序和测试环境之间重用。

spring项目构建

1. 配置maven依赖
2. 创建spring.xml文件
3. 获取bean对象



**springIOC**

IOC容器的底层实现原理：

1. IOC容器中心非常核心的接口BeanFactory；
2. IOC容器对基本的概念：控制反转，把对象的创建过程与使用统一交给spring来管理，不需要开发者自己去new对象
3. IOC容器底层实现技术：反射技术、解析xml、工厂模式
4. IOC作用 降低我们代码的耦合度。

反射创建对象：

SpringIOC容器底层实现原理：

反射+工厂模式+解析xml技术实现

1.使用解析xml技术 解析spring.xml配置文件；

2.获取<bean id=”” class=””/> 类的完整路径地址

3.使用到反射技术初始化对象

4.需要使用工厂模式封装初始化对象



**IOC的核心接口**

1. IOC的核心思想底层基于反射+工厂模式实现

2. Spring提供IOC容器实现两种方式：

​		2.1 BeanFactory IOC容器基本的实现，是spring内部自己使用的接口，不提供给开发者使用。

加载配置文件过程的时候，不会创建对象，当我们在获取对象的时候才会获取创建对象。

​		2.2 ApplicationContext  BeanFactory 接口的子接口，提供更多的强大功能，适合于开发者使用。

当我们在加载配置文件的过程中，就会将配置文件中的对象创建。

```java
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
<!--    xml配置注入spring bean对象-->
<!--    id不能重复 id命名为类名首字母小写-->
    <bean id="userEntity" class="com.feiyu.entity.UserEntity" scope="prototype"></bean>
</beans>

package com.feiyu.dom4j;

import com.feiyu.entity.UserEntity;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.io.InputStream;

/**
 * @author ：yhf
 * @date ：2023/4/11 12:16
 * @description：
 */
public class Dmo4j {
    public String getUserClass() throws DocumentException{
        File file = new File(this.getClass().getResource("/").getPath() + "spring.xml");
        System.out.println(this.getClass().getResource("/"));
        SAXReader saxReader = new SAXReader();
        Document document = saxReader.read(file);
        Element rootElement = document.getRootElement();
        Element bean = rootElement.element("bean");
        String aClass = bean.attributeValue("class");
        return aClass;
    }


}
package com.feiyu.factory;

import com.feiyu.dao.UserDao;
import com.feiyu.dom4j.Dmo4j;
import com.feiyu.entity.UserEntity;

/**
 * @author ：yhf
 * @date ：2023/4/11 11:44
 * @description：工厂模式创建对象
 */
public class UserFactory {
    public static UserDao getUserDao(){
        return new UserDao();
    }

    public static UserEntity getUserEntity() throws Exception {
        /*SpringIOC容器底层实现原理：
    反射+工厂模式+解析xml技术实现
    1.使用解析xml技术 解析spring.xml配置文件；
    2.获取<bean id=”” class=””/> 类的完整路径地址
    3.使用到反射技术初始化对象
    4.需要使用工厂模式封装初始化对象*/
        String aClass1 = new Dmo4j().getUserClass();
        Class<?> aClass = Class.forName(aClass1);
        return (UserEntity)aClass.newInstance();

    }

}

```

在做服务器端开发的时候，使用ApplicationContext  比较多，因为所有bean初始化操作在项目启动完成之前都已经初始化了。

**ApplicationContext主要实现类**

ClassPathXmlApplicationContext：对应类路径下的XML格式的配置文件

FileSystemXmlApplicationContext：对应文件系统中的XML格式的配置文件

ConfigurableApplicationContext   是ApplicationContext的子接口，包含一些扩展方法

refresh()和close()让ApplicationContext具有启动、关闭和刷新上下文的能力。所以要关闭ApplicationContext需要new此接口的对象调用close()方法

WebApplicationContext   专门为WEB应用而准备的，它允许从相对于WEB根目录的路径中完成初始化工作



**SpringBean的注入方式**

**创建对象和set方法注入属性**

1. 什么是Bean管理

使用spring创建对象

使用spring注入属性

2. Bean的管理有两种方式
   1. 基于XML方式配置
   2. 通过注解方式配置

**基于XML方式创建对象**

<**bean** **id****="userEntity"** **class****="com.mayikt.entity.UserEntity"**></**bean**>

在spring的配置文件中，会配置一个bean标签，注入bean的信息 创建bean对象

Id：获取bean对象 唯一bean对象的名称； bean的名称不允许重复

Class属性： 类的完整路径地址（类名称+包名称） 

默认底层使用反射技术执行无参数构造函数		

​		2.基于xml方式注入属性

DI 依赖注入： 对象的属性注入值； （spring实现）

```
spring基于xml注入bean属性，底层是基于java反射机制，调用set方法给bean属性赋值
```

​		3.有参构造函数注入属性

```
反射机制，执行有参构造函数初始化对象，并注入对象
```



**注入空值和特殊符号**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
    <bean id="bookEntity" class="com.feiyu.entity.BookEntity">
        <property name="bookName" value="万古神帝"></property>
        <property name="bookPrice" value="23.2"></property>
    </bean>
    <bean id="bookEntity2" class="com.feiyu.entity.BookEntity">
        <!--不能直接使用null,需要使用null标签-->
        <property name="bookName">
            <null></null>
        </property>
        <property name="bookPrice" value="23.2"></property>
    </bean>

    <bean id="bookEntity3" class="com.feiyu.entity.BookEntity">
        <!--不能直接使用特殊符号，需要转义-->
<!--        <property name="bookName" value="<<飞鱼>>"></property>-->
        <property name="bookName" value="&lt;&lt;飞鱼&gt;&gt;"></property>
        <property name="bookPrice" value="23.2"></property>
    </bean>

    <bean id="bookEntity4" class="com.feiyu.entity.BookEntity">
        <property name="bookName" >
            <value><![CDATA[#fe%]]></value>
        </property>
        <property name="bookPrice" value="23.2"></property>
    </bean>

</beans>
```

**注入属性外部bean**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
        <bean id="dogService" class="com.feiyu.services.DogService">
            <property name="dogDao" ref="dogDao"></property>
        </bean>
        <bean id="dogDao" class="com.feiyu.dao.DaoImplDao"></bean>
</beans>
```

**注入内部bean**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
<!--    xml配置注入spring bean对象-->
<!--    id不能重复 id命名为类名首字母小写-->
    <!--注入内部bean对象-->
    <bean id="empEntity" class="com.feiyu.entity.EmpEntity">
        <property name="name" value="飞鱼"></property>
        <property name="address" value="上海"></property>
        <property name="deptEntity" >
            <bean id="deptEntity" class="com.feiyu.entity.DeptEntity">
                <property name="name" value="教育部门"></property>
            </bean>
        </property>
    </bean>

</beans>
```

**注入级联赋值**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
<!--    xml配置注入spring bean对象-->
<!--    id不能重复 id命名为类名首字母小写-->
    <!--级联注入bean对象-->
    <bean id="empEntity" class="com.feiyu.entity.EmpEntity">
        <property name="name" value="飞鱼"></property>
        <property name="address" value="上海"></property>
        <property name="deptEntity" ref="deptEntity"></property>
        <property name="deptEntity.name" value="IT部门"></property>
    </bean>
    <bean id="deptEntity" class="com.feiyu.entity.DeptEntity">
    </bean>
</beans>
```

**注入集合类型属性**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
        <bean id="stuEntity" class="com.feiyu.entity.StuEntity">
            <!--为list集合赋值-->
            <property name="list">
                <list>
                    <value>01</value>
                    <value>02</value>
                    <value>03</value>
                </list>
            </property>
            <!--为数组赋值-->
            <property name="arrays">
                <array>
                    <value>fy01</value>
                    <value>fy02</value>
                    <value>fy03</value>
                </array>
            </property>
            <!--为map赋值-->
            <property name="map">
                <map>
                    <entry key="飞鱼" value="微风耦合"></entry>
                    <entry key="鱼" value="耦合"></entry>
                </map>
            </property>
            <!--为set集合赋值-->
            <property name="set">
                <set>
                    <value>fwef</value>
                    <value>fwfeef</value>
                    <value>fsfwef</value>
                </set>
            </property>

            <!--集合对象类型赋值-->
            <property name="courses">
                <list>
                    <!--通过ref引入对象-->
                    <ref bean="courseEntity_java"></ref>
                    <ref bean="courseEntity_dsj"></ref>
                </list>
            </property>
        </bean>
    
    <bean id="courseEntity_java" class="com.feiyu.entity.CourseEntity">
        <property name="name" value="java"></property>
    </bean>
    <bean id="courseEntity_dsj" class="com.feiyu.entity.CourseEntity">
        <property name="name" value="dsj"></property>
    </bean>
   
</beans>
```

**抽取公共样式**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:util="http://www.springframework.org/schema/util"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/util
        http://www.springframework.org/schema/util/spring-util.xsd">
    <!--抽取公共样式 在上面添加util-->
    <util:list id="list">
        <value>01</value>
        <value>02</value>
        <value>03</value>
    </util:list>
    <bean id="stuEntity" class="com.feiyu.entity.StuEntity">
        <property name="list" ref="list"></property>
    </bean>

    

   
</beans>
```



**IOC操作Bean的管理**

1. Spring中两种类型bean，一种是为普通的bean，另外一种是工厂bean

FactoryBean

2. 普通Bean：在配置文件中定义什么类型与返回的类型需一致；

3. 工厂Bean：在配置文件中定义Bean类型与返回类型可以不一致；

创建一个类，这个类是为工厂Bean，实现FactoryBean接口

如果类实现了factoryBean,则返回类型可以和配置文件中定义的该类型不一致，使用重写getObject()方法。

```java
package com.feiyu.entity;

import org.springframework.beans.factory.FactoryBean;

/**
 * @author ：yhf
 * @date ：2023/4/11 16:58
 * @description：
 */
public class FeiyuBean implements FactoryBean {
    @Override
    public Object getObject() throws Exception {
        return new UserEntity();
    }

    @Override
    public Class<?> getObjectType() {
        return null;
    }
}


<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
        <bean id="feiyuBean" class="com.feiyu.entity.FeiyuBean"></bean>
</beans>

  @Test
    public void test09(){
        //ClassPathXmlApplicationContext classPathXmlApplicationContext = new ClassPathXmlApplicationContext("spring04.xml");
        /*普通的bean对象，返回类型必须和配置文件中定义的一样*/
        //        UserEntity stuEntity1 = (UserEntity) classPathXmlApplicationContext.getBean("stuEntity");
        /*factoryBean工厂的bean，返回类型可以和配置文件中定义的不一样*/
        ClassPathXmlApplicationContext classPathXmlApplicationContext1 = new ClassPathXmlApplicationContext("spring05.xml");
        UserEntity feiyuBean = (UserEntity) classPathXmlApplicationContext1.getBean("feiyuBean");
        System.out.println(feiyuBean);
    }
```

**SpringBean的作用域**

什么是作用域？

设定bean作用域是为单例还是多例

作用域单例与多例有什么区别呢？

\1. 单例的作用域：每次在调用getbean方法获取对象都是为同一个对象；

\2. 多例的作用域：每次在调用getbean方法获取对象都是一个新的对象。

注意：在spring默认的情况下，bean的作用域就是为单例 节约服务器内存。

单例：

在同一个jvm中，该bean对象只会创建一次。

多例：

在同一个jvm中，该bean对象可以被创建多次。

**设定对象单例还是多例**

在spring的默认的情况下，springbean的作用域为单例。

1.单例就是每次获取bean都是同一个对象；

2.多例就是每次获取bean都是新的一个对象；

单例：在同一个jvm中该bean只能存在一个实例；

多例子：在同一个jvm中该bean存在多个实例；

证明：如果是为单例，则两个对象地址都是一样的，

多例子对象则两个对象地址不一样。

**单例配置**

```xml
<bean id="userEntity" class="com.mayikt.entity.UserEntity" scope="singleton"></bean>
```

**多例配置**

```xml
<bean id="userEntity" class="com.mayikt.entity.UserEntity" scope="prototype"></bean>
```

**SpringBean的生命周期**

简单分为：实例化→属性赋值→初始化→销毁

生命周期概念：

1. 对象的创建与销毁的过程，类似之前学习servlet生命的周期过程。

生命周期的原理：

1. 通过构造函数创建bean对象（默认执行无参构造函数 底层基于反射实现）

2. 为bean的属性设置 （使用反射调用set方法）

3. 调用bean的初始化的方法（需要单独在类中配置初始化的方法）

4. 正常使用bean对象

5. Spring容器关闭，调用该类的销毁回调的方法（需要单独在类中配置销毁的方法）

**具体**

1.通过构造函数创建bean对象（默认执行无参构造函数 底层基于反射实现）
2.为bean的属性设置 （使用反射调用set方法）
3.将bean传递给后置处理器(beanPostProcessor) 调用初始化方法之前执行
4.调用bean的初始化的方法（需要单独在类中配置初始化的方法）
5.将bean传递给后置处理器(beanPostProcessor)  调用初始化方法之后执行
6.正常使用bean对象
7.Spring容器关闭，调用该类的销毁回调的方法（需要单独在类中配置销毁的方法）

**代码**

```java
package com.feiyu.entity;

/**
 * @author ：yhf
 * @date ：2023/4/11 17:47
 * @description：
 */
public class MemberEntity {
    private String name;
    public MemberEntity() {
        System.out.println("bean生命周期 第一步 默认调用无参构造方法 实例化 ---反射机制调用");
    }

    public void setName(String name) {
        System.out.println("[第二步]-set方法初始化属性---反射机制调用");
        this.name = name;

    }

    public void init(){
        System.out.println("[第三步]-回调调用init初始化方法");
    }

    public void destroy(){
        System.out.println("[第五步]-回调调用destroyMethod方法");
    }
}


<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
        <bean id="memberEntity" class="com.feiyu.entity.MemberEntity" init-method="init" destroy-method="destroy"></bean>
</beans>

/*spring bean的生命周期*/
    @Test
    public void test11(){
        ClassPathXmlApplicationContext app = new ClassPathXmlApplicationContext("spring06.xml");
        Object memberEntity = app.getBean("memberEntity");
        System.out.println("第四步获取到使用的对象"+memberEntity);
        app.close();//第5步 手动销毁bean对象
    }
```

**spring bean的后置处理器**(beanPostProcessor) 

配置多个BeanPostProcessor

实现Ordered接口 getOrder  值越小越优先加载

```
package com.feiyu.bean;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

/**
 * @author ：yhf
 * @date ：2023/4/11 19:35
 * @description：
 */
public class FeiyuBeanPostProcessor2 implements BeanPostProcessor, Ordered {
    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("[FeiyuBeanPostProcessor2]:后置处理器在调用该bean的init方法之前执行");
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("[FeiyuBeanPostProcessor2]:后置处理器在调用该bean的init方法之后执行");
        return bean;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}

package com.feiyu.bean;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.core.Ordered;

/**
 * @author ：yhf
 * @date ：2023/4/11 19:15
 * @description：
 */
public class FeiyuBeanPostProcessor implements BeanPostProcessor, Ordered {

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("后置处理器调用该bean的init方法之前调用");
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        System.out.println("后置处理器调用该bean的init方法之后调用");
        return bean;
    }

    @Override
    public int getOrder() {
        return 1;
    }
}

<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
        <bean id="memberEntity" class="com.feiyu.entity.MemberEntity" init-method="init" destroy-method="destroy">
                <property name="name">
                        <value>飞鱼</value>
                </property>
        </bean>
        <!--只要在配置文件中注册了后置处理器，所有的bean都会经过后置处理器 后置处理器可以配置多个 通过实现Ordered接口 重写getOrder来配置优先级-->
        <bean id="feiyuPostProcessor" class="com.feiyu.bean.FeiyuBeanPostProcessor"></bean>
        <bean id="feiyuPostProcessor2" class="com.feiyu.bean.FeiyuBeanPostProcessor2"></bean>
</beans>
```

**SpringBean的自动装配**

什么是自动装配呢

AutoWired

根据装配的规则（属性的名称或者属性的类型）

Spring根据装配的规则自动为属性注入值。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
    <!-- bean 标签中有一个属性autowire
     1.根据属性的名称注入 bean的id名称与属性的名称一致
     2.根据属性的类型注入 bean的类型与属性类型一致 但是不能配置多个同一类型的bean
  -->
    <!--根据属性名自动装配-->
    <!--<bean id="empEntity" class="com.feiyu.entity.EmpEntity" autowire="byName">

    </bean>
    <bean id="deptEntity" class="com.feiyu.entity.DeptEntity">
        <property name="name" value="教育部门"></property>
    </bean>-->
    <bean id="empEntity" class="com.feiyu.entity.EmpEntity" autowire="byType"></bean>
    <bean id="deptEntity" class="com.feiyu.entity.DeptEntity">
        <property name="name" value="教育部门"></property>
    </bean>
</beans>
```

**SpringBean的注解形式**

spring的注解启动方式

Bean的管理操作方式

1. 基于XML方式实现
2. 基于注解方式实现

什么是注解：注解是JDK5中推出的新特性，代码的特殊标记，

格式注解名称“属性名称=属性值，属性名称=属性值”。

我们在后期学习springboot开发基本上都是使用注解，很少在使用

Xml配置的方式。

注解可以使用在类、方法、属性、上面。

使用注解的目的，简化xml的配置方式。

Spring提供的常用注解

1. @Component  将对象注入Spring容器中

2. @Service     注入业务逻辑对象
3. @Controller   控制器类

4. @Repository  注入dao对象

5. 以上该四个注解底层都是基于@Component注解封装的，只是区分用于

在不同的场景下。

**注解的使用方式**

```java
AnnotationConfigApplicationContext app = new AnnotationConfigApplicationContext();
app.register(BeanConfig.class);
app.refresh();
MemberEntity  memberEntity = (MemberEntity) app.getBean("memberEntity");
System.out.println(memberEntity);
```

### AOP

AOP(Aspect Oriented Programming)是一种面向切面的编程思想。面向切面编程是将程序抽象成各个切面，即解剖对象的内部，将那些影响了多个类的公共行为抽取到一个可重用模块里，减少系统的重复代码，降低模块间的耦合度，增强代码的可操作性和可维护性。

AOP把软件系统分为两个部分：核心关注点和横切关注点。业务处理的主要流程是核心关注点，与之关系不大的部分是横切关注点。横切关注点的一个特点是，他们经常发生在核心关注点的多处，而各处都基本相似。比如权限认证、日志、事务处理、增强处理。

简单理解：
Aop面向切面编程，在方法之前和之后实现处理 应用场景在于：日志打印、事务实现、安全、权限控制、自定义注解等。
因为AOP可以解决我们程序上的代码冗余问题

AOP 底层基于 代理设计模式封装
代理设计模式  静态代理与动态代理
动态代理  jdk动态代理与 cglib动态代理

通俗易懂 aop 在我们的目标方法之前和之后 处理的操作
开启事务
目标方法
提交或者回滚事务

**代理模式实现的原理**

代理模式主要包含三个角色，即抽象主题角色(Subject)、委托类角色(被代理角色，Proxied)以及代理类角色(Proxy)，如上图所示：

抽象主题角色:可以是接口，也可以是抽象类；

委托类角色：真实主题角色，业务逻辑的具体执行者；

代理类角色：内部含有对真实对象RealSubject的引用，负责对真实主题角色的调用，并在真实主题角色处理前后做预处理和后处理。

**代理模式的应用场景**

1. 日志的采集
2. 权限控制
3. 实现app
4. Mybatis mapper
5. Spring的事务
6. 全局捕获异常
7. RPC远程调用接口（传递的就是接口）
8. 代理数据源
9. 自定义注解



**静态代理**

静态代理：有多少被代理目标，就有多少代理。

```java
package com.feiyu.proxy;

import lombok.extern.slf4j.Slf4j;

/**
 * @author ：yhf
 * @date ：2023/4/11 22:49
 * @description：静态代理、通过实现接口方式、使用场景较多、可以多实现
 */
@Slf4j
public class OrderServiceProxy implements OrderService{
    private OrderService orderService;

    public OrderServiceProxy(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public String addOrder(String orderName) {
        log.info("<目标方法之前执行...>");
        String result = orderService.addOrder(orderName);
        log.info("<目标方法之后执行...>");
        return result;
    }
}

package com.feiyu.proxy;

import lombok.extern.slf4j.Slf4j;

/**
 * @author ：yhf
 * @date ：2023/4/11 23:34
 * @description：静态代理、通过继承方式实现、使用场景不多、因为继承是单继承
 */
@Slf4j
public class OrderServiceProxy2 extends OrderServiceImpl{
    @Override
    public String addOrder(String orderName) {
        log.info("<目标方法之前执行...>");
        String result = super.addOrder(orderName);
        log.info("<目标方法之后执行...>");
        return result;
    }
}

```

**动态代理**

动态代理有

1. jdk代理
2. cglib代理

动态代理不需要写代理类对象，通过程序自动生成，而静态代理需要我们自己写代理类对象。

动态代理是在实现阶段不用关心代理类，而在运行阶段才指定哪一个对象。

动态代理类的源码是在程序运行期间由JVM根据反射等机制动态的生成 。

JDK动态代理的一般步骤如下：

1.创建被代理的接口和类；

2.实现InvocationHandler接口，对目标接口中声明的所有方法进行统一处理；

3.调用Proxy的静态方法，创建代理类并生成相应的代理对象；

实现原理：利用拦截器机制必须实现InvocationHandler接口中的invoke方法实现对

我们的目标方法增强。

**JDK动态代理**

```java
package com.feiyu.proxy;

import lombok.extern.slf4j.Slf4j;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * @author ：yhf
 * @date ：2023/4/12 13:28
 * @description：
 */
@Slf4j
public class FeiyuInvocationHandle implements InvocationHandler {
    private Object target;

    public FeiyuInvocationHandle(Object target) {
        this.target = target;
    }

    /**
     *
     * @param proxy the proxy instance that the method was invoked on
     *
     * @param method the {@code Method} instance corresponding to
     * the interface method invoked on the proxy instance.  The declaring
     * class of the {@code Method} object will be the interface that
     * the method was declared in, which may be a superinterface of the
     * proxy interface that the proxy class inherits the method through.
     *
     * @param args an array of objects containing the values of the
     * arguments passed in the method invocation on the proxy instance,
     * or {@code null} if interface method takes no arguments.
     * Arguments of primitive types are wrapped in instances of the
     * appropriate primitive wrapper class, such as
     * {@code java.lang.Integer} or {@code java.lang.Boolean}.
     *
     * @return
     * @throws Throwable
     */
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        log.info("<JDK动态代理目标方法之前，args:{}>",args);
        Object invoke = method.invoke(target, args);
        log.info("<JDK动态代理目标方法之后，args:{}>",args);
        return invoke;
    }

    public <T> T getProxy(){
        return (T) Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(), this);
    }


}

```

JDK自动生成的代理类

```java


public final class $Proxy0 extends Proxy implements OrderService {
    private static Method m1;
    private static Method m3;
    private static Method m2;
    private static Method m0;

    public $Proxy0(InvocationHandler var1) throws  {
        super(var1);
    }

    public final boolean equals(Object var1) throws  {
        try {
            return (Boolean)super.h.invoke(this, m1, new Object[]{var1});
        } catch (RuntimeException | Error var3) {
            throw var3;
        } catch (Throwable var4) {
            throw new UndeclaredThrowableException(var4);
        }
    }

    public final String addOrder(String var1) throws  {
        try {
            return (String)super.h.invoke(this, m3, new Object[]{var1});
        } catch (RuntimeException | Error var3) {
            throw var3;
        } catch (Throwable var4) {
            throw new UndeclaredThrowableException(var4);
        }
    }

    public final String toString() throws  {
        try {
            return (String)super.h.invoke(this, m2, (Object[])null);
        } catch (RuntimeException | Error var2) {
            throw var2;
        } catch (Throwable var3) {
            throw new UndeclaredThrowableException(var3);
        }
    }

    public final int hashCode() throws  {
        try {
            return (Integer)super.h.invoke(this, m0, (Object[])null);
        } catch (RuntimeException | Error var2) {
            throw var2;
        } catch (Throwable var3) {
            throw new UndeclaredThrowableException(var3);
        }
    }

    static {
        try {
            m1 = Class.forName("java.lang.Object").getMethod("equals", Class.forName("java.lang.Object"));
            m3 = Class.forName("com.mayikt.service.OrderService").getMethod("addOrder", Class.forName("java.lang.String"));
            m2 = Class.forName("java.lang.Object").getMethod("toString");
            m0 = Class.forName("java.lang.Object").getMethod("hashCode");
        } catch (NoSuchMethodException var2) {
            throw new NoSuchMethodError(var2.getMessage());
        } catch (ClassNotFoundException var3) {
            throw new NoClassDefFoundError(var3.getMessage());
        }
    }
}

注意：继承了Proxy类，实现了代理的接口，由于java不能多继承，这里已经继承了Proxy类了，不能再继承其他的类，所以JDK的动态代理不支持对实现类的代理，只支持接口的代理。

```

1.执行到我们 代理类中$Proxy0.addOrder（）

2.执行到FeiyuInvocationHandler.invoke

```java
  public <T> T getProxy() {
        return (T) Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(),
                this);
      
      
 生成代理类时 会传递我们目标对象实现哪些接口
target.getClass().getInterfaces()
 如果我们目标对象没有实现接口 jdk动态代理生成代理类 也没有实现接口

     
 使用jdk动态代理时 注意 让目标对象实现接口， 生成代理类时 实现目标对象的接口
 方便可以使用接口调用目标对象的方法
```

3.执行到FeiyuInvocationHandler.invoke 在根据java反射机制  传递目标对象 调用目标方法



```
/*JDK动态代理 底层是：实现了InvocationHandle接口，然后传递我们的被代理类，和被代理类实现的接口，生成代理类，在static块内，通过反射机制，
获取到我们的代理类和代理类方法，在代理类中调用实现InvocationHHandle接口中的invoke方法，然后在invoke方法中通过反射机制的方法调用调用到我们对的
被代理类的实现方法*/
```



**mybatis mapper接口分析**

在mybatis中，mapper是一个接口，为何可以调用的？底层其实就是基于JDK动态代理实现的。



**Mapper代理底层实现**

```java
package com.feiyu.zj;

import org.springframework.stereotype.Indexed;

import java.lang.annotation.*;

/**
 * @author author
 * @create 2023 - 04 - 12 14:58
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Indexed
public @interface Feiyu {
   String value();
}

package com.feiyu.mapper;

import com.feiyu.zj.Feiyu;

/**
 * @author author
 * @create 2023 - 04 - 12 15:45
 */
public interface UserMapper {
    @Feiyu("INSERT INTO `feiyu`.`feiyu_users` (`id`, `phone`, `pwd`) VALUES (null, '1231', NULL);")
    int addUser();
}

package com.feiyu.mapper;

/**
 * @author ：yhf
 * @date ：2023/4/12 15:59
 * @description：
 */
public class MapperProxy {
    public static UserMapper getUserMapper(Class mapperClass){
        return new FeiyuMapperHandle(mapperClass).getProxy();
    }

}


package com.feiyu.mapper;

import com.feiyu.utils.FeiyuJdbcUtils;
import com.feiyu.zj.Feiyu;
import org.springframework.util.StringUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @author ：yhf
 * @date ：2023/4/12 15:42
 * @description：
 */
public class FeiyuMapperHandle implements InvocationHandler {
    private Class mapperClass;

    public FeiyuMapperHandle(Class mapperClass) {
        this.mapperClass = mapperClass;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        Feiyu declaredAnnotation = method.getDeclaredAnnotation(Feiyu.class);
        String sql = declaredAnnotation.value();
        if (StringUtils.isEmpty(sql)) {
            return null;
        }
        // 执行该sql语句
        Connection connection = FeiyuJdbcUtils.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public <T> T getProxy(){
        return (T) Proxy.newProxyInstance(mapperClass.getClassLoader(),new Class[]{mapperClass},this);
    }
}

import com.feiyu.mapper.MapperProxy;
import com.feiyu.mapper.UserMapper;
import com.feiyu.proxy.FeiyuInvocationHandle;
import com.feiyu.proxy.OrderService;
import com.feiyu.proxy.OrderServiceImpl;
import com.feiyu.proxy.OrderServiceProxy;
import org.junit.Test;

/**
 * @author ：yhf
 * @date ：2023/4/11 22:55
 * @description：
 */
public class ProxyTest {
    @Test
    public void test1(){
        OrderServiceProxy orderServiceProxy = new OrderServiceProxy(new OrderServiceImpl());
        String res = orderServiceProxy.addOrder("辣椒");
        System.out.println(res);
    }

    @Test
    public void test2(){
        OrderServiceProxy orderServiceProxy = new OrderServiceProxy(new OrderServiceImpl());
        String res = orderServiceProxy.addOrder("苹果");
        System.out.println(res);
    }

    /*JDK动态代理 底层是：实现了InvocationHandle接口，然后传递我们的被代理类，和被代理类实现的接口，生成代理类，在static块内，通过反射机制，
    获取到我们的代理类和代理类方法，在代理类中调用实现InvocationHHandle接口中的invoke方法，然后在invoke方法中通过反射机制的方法调用调用到我们对的
    被代理类的实现方法*/
    @Test
    public void test3(){
        System.getProperties().put("sun.misc.ProxyGenerator.saveGeneratedFiles", "true");
        FeiyuInvocationHandle feiyuInvocationHandle = new FeiyuInvocationHandle(new OrderServiceImpl());
        OrderService proxy = feiyuInvocationHandle.getProxy();//jdk代理类帮我们实现代理接口方法，根据多态，就可以调用实现类的方法
        proxy.addOrder("飞鱼");
    }
//jdk动态代理实现mapper代理
    @Test
    public void test4(){
        System.getProperties().put("sun.misc.ProxyGenerator.saveGeneratedFiles", "true");
        UserMapper userMapper = MapperProxy.getUserMapper(UserMapper.class);
        int result = userMapper.addUser();
        System.out.println(result);
    }
}

```



**cglib代理**

cglib使用

```java
package com.feiyu.cglib;

/**
 * @author author
 * @create 2023 - 04 - 12 16:27
 */
public interface OrderService {
    String addOrder(String orderName,String orderId);
}

package com.feiyu.cglib.impl;

import com.feiyu.cglib.OrderService;
import lombok.extern.slf4j.Slf4j;

/**
 * @author ：yhf
 * @date ：2023/4/12 16:28
 * @description：
 */
@Slf4j
public class OrderServiceImpl implements OrderService {
    @Override
    public String addOrder(String orderName, String orderId) {
        log.info("<orderName:{},orderId:{}>", orderName,orderId);
        // add order相关的事情
        return "ok";
    }
}

package com.feiyu.cglib;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Method;

/**
 * @author ：yhf
 * @date ：2023/4/12 16:33
 * @description：
 */
@Slf4j
public class FeiyuCglibMethodInterceptor implements MethodInterceptor {
    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        log.info("<目标方法开始之前执行...>");
        Object result = methodProxy.invokeSuper(o, objects);
        log.info("<目标方法开始之后执行...>");
        return result;
    }
}

public class Test {
    public static void main(String[] args) {
        FeiyuCglibMethodInterceptor feiyuCglibMethodInterceptor = new FeiyuCglibMethodInterceptor();
        Enhancer enhancer = new Enhancer();
        //设置代理
        enhancer.setSuperclass(OrderServiceImpl.class);
        //设置回调类
        enhancer.setCallback(feiyuCglibMethodInterceptor);
        //创建cglib代理 继承的方式代理
        OrderServiceImpl orderService = (OrderServiceImpl)enhancer.create();
        String result = orderService.addOrder("牙膏", "13234");
        System.out.println(result);
    }
```



**cglib底层实现**

Cglib 底层基于asm实现

Cglib 与jdk动态代理到底有哪些区别呢？

jdk动态代理底层基于反射方式调用目标方法 jdk7之前效率是非常低后期优化。

Cglib 底层是反射调用目标方法效率非常低 ，直接采用建立fastclass 索引的方式

调用目标方法。



jdk7之前Cglib动态代理效率是比我们jdk动态代理效率高非常多

jdk7开始jdk动态代理是我们Cglib动态代理效率高。

Cglib动态代理生成的代理类 直接  继承 被代理类（实现继承方式代理）

public class OrderServiceImpl$$EnhancerByCGLIB$$1dd3a71c extends OrderServiceImpl implements Factory {



jdk动态代理生成代理类 实现 被代理实现的接口 （实现接口方式代理）



Cglib底层生成代理类是通过 asm 生成字节码 class



1.Cglib是一个强大的，高性能，高质量的代码生成类库。它可以在运行期扩展JAVA类与实现JAVA接口。其底层实现是通过ASM字节码处理框架来转换字节码并生成新的类。大部分功能实际上是ASM所提供的，Cglib只是封装了ASM，简化了ASM操作，实现了运行期生成新的class。

2.运行时动态的生成一个被代理类的子类（通过ASM字节码处理框架实现），子类重写了被代理类中所有非final的方法。在子类中采用方法拦截的技术拦截所有父类方法的调用，顺势植入横切逻辑。

3.jdk7开始 jdk动态代理效率比cglib要高



spring底层采用  cglib代理类？还是jdk动态代理

判断  被代理类 实现接口 使用jdk动态代理

如果被代理类 没有实现接口则使用cglib代理类



实现MethodInterceptor接口的intercept方法后，所有生成的代理方法都调用这个方法。

intercept方法的具体参数有

obj 目标类的实例

1.	method 目标方法实例（通过反射获取的目标方法实例）

2.	args 目标方法的参数

3.	proxy 代理类的实例

该方法的返回值就是目标方法的返回值。



**AOP**

1.连接点（Join point）: 连接点表示应用执行过程中能够插入切面的一个点，这个点可以是方法的调用、异常的抛出。在 Spring AOP 中，连接点总是方法的调用。类中的哪些方法可以被增强，这些方法就被称作为连接点。

2.切点（PointCut）: 可以插入增强处理的连接点，实际被增强的方法就称作为切入点

3.通知（Advice）: AOP 框架中的增强处理，通知描述了切面何时执行以及如何执行增强处理， 实际增强的业务逻辑，该过程就可以称作为通知 前置、后置、环绕通知

4.切面（Aspect）: 切面是通知和切点的结合。 把通知应用到的过程 就是为切面

5.引入（Introduction）：允许我们向现有的类添加新的方法或者属性。

6.织入（Weaving）: 将增强处理添加到目标对象中，并创建一个被增强的代理对象



1.连接点 该类中哪些方法需要被增强，这些方法就可以称作连接点

3.切点 实际被增强的方法

2.通知  在方法前后执行代码

前置通知 调用方法之前处理...

后置通知   调用完该方法之后处理

环绕通知 在我们被代理方法前后执行

异常通知

最终通知

4.切面 把通知应用到的过程 就是为切面



**Aop环境准备**

1.Spring框架一般都是基于AspectJ实现AOP操作

(1)什么是AspectJ

AspectJ是一个面向切面的框架，它扩展了Java语言。AspectJ定义了AOP语法，它有一个专门的编译器用来生成遵守Java字节编码规范的Class文件,AspectJ不是Spring组成部分,独立AOP框架,一般把AspectJ和Spring框架一起使用,进行AOP操作.

2.基于AspectJ实现AOP

(1)基于xml配置文件实现 

(2)基于注解方式（偏多的）

3.在项目工程目录引入AOP依赖

**maven依赖**

```
        <!-- aspectj支持 -->
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjrt</artifactId>
            <version>1.8.9</version>
        </dependency>
        <dependency>
            <groupId>org.apache.geronimo.bundles</groupId>
            <artifactId>aspectjweaver</artifactId>
            <version>1.6.8_2</version>
        </dependency>
         <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-aop</artifactId>
            <version>5.2.1.RELEASE</version>
        </dependency>

```

**切入点表达式**

具体那个类中的那个方法来实现增强

需要描述 该类中哪些方法是需要被增强-----切入点规则

![img](https://cdn.nlark.com/yuque/0/2022/png/25438525/1658138465383-4bfedc10-eaba-4d57-8a08-43eb57192e6c.png)

execution( [权限修饰符] [返回类型] [类全路径] [方法名称] ([参数列表]));

[权限修饰符

1.public.String.com.mayikt.service.MayiktService.addUser(..)  --拦截的是

MayiktService类中addUser方法名称 所有参数  返回值String

2.* com.mayikt.service.MayiktService.*（..）拦截我们的

MayiktService类中的所有方法

3.* com.mayikt.service.*.*（..）拦截就是我们 com.mayikt.service.包下

的所有的类所有的方法。

(1)语法接口:
execution( [权限修饰符] [返回类型] [类全路径] [方法名称] ([参数列表]));

//举例1:对com.mayikt.service.MayiktService类里面的 add() 进行增强  execution(*com.mayikt.service.MayiktService.add(..));  // * 表示所有,  .. 表示参数列表   

//举例2:对com.mayikt.service.MayiktService类里面的 所有方法 进行增强  execution(*com.mayikt.service.MayiktService.*(..));   

//举例3:对com.mayikt.service.MayiktService所有类里面的 所有方法 进行增强  execution(*com.mayikt.service.MayiktService.*.*(..));





开启springaop

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context  http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/aop
        http://www.springframework.org/schema/aop/spring-aop.xsd
      ">
    <!--开启注解方式 -->
    <context:component-scan base-package="com.mayikt"></context:component-scan>
    <!--开启 aspectj 生成代理-->
    <aop:aspectj-autoproxy></aop:aspectj-autoproxy>
</beans>
```

spring aop 底层基于 代理封装？

如果我们 被代理类 没有实现接口的情况下 则使用 cglib动态代理

如果我们被代理类 有实现接口的情况下 则使用 jdk动态代理



aop的版本5.1对应jdk15以下，版本太高会不兼容。

**aop使用**

```java
依赖
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.feiyu</groupId>
    <artifactId>spring-aop</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
    <dependencies>
        <!--
         这个jar 文件包含Spring 框架基本的核心工具类。Spring 其它组件要都要使用到这个包里的类，是其它组件的基本核心，当然你也可以在自己的应用系统中使用这些工具类。
外部依赖Commons Logging， (Log4J)。
         -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
            <version>5.2.1.RELEASE</version>
        </dependency>
        <!--
        这个jar 文件是所有应用都要用到的，它包含访问配置文件、创建和管理bean 以及进行Inversion ofControl / Dependency Injection（IoC/DI）操作相关的所有类。如果应用只需基本的IoC/DI 支持，引入spring-core.jar 及spring-beans.jar 文件就可以了。
外部依赖spring-core，(CGLIB)。
        -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-beans</artifactId>
            <version>5.2.1.RELEASE</version>
        </dependency>
        <!--
这个jar 文件为Spring 核心提供了大量扩展。可以找到使用Spring ApplicationContext特性时所需的全部类，JDNI 所需的全部类，instrumentation组件以及校验Validation 方面的相关类。
外部依赖spring-beans, (spring-aop)。
        -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>5.2.1.RELEASE</version>
        </dependency>

        <!-- aspectj支持 -->
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjrt</artifactId>
            <version>1.8.9</version>
        </dependency>
        <dependency>
            <groupId>org.apache.geronimo.bundles</groupId>
            <artifactId>aspectjweaver</artifactId>
            <version>1.6.8_2</version>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-aop</artifactId>
            <version>5.2.1.RELEASE</version>
        </dependency>



    </dependencies>

</project>

package com.feiyu.services;

import org.springframework.stereotype.Component;

/**
 * @author ：yhf
 * @date ：2023/4/12 20:14
 * @description：
 */
@Component
public class FeiyuService {
    public String addFeiyu(String name) {
        System.out.println("addFeiyu...");
//        int i = 2/0;
        return "ok";
    }
}


package com.feiyu.proxy;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * @author ：yhf
 * @date ：2023/4/12 20:15
 * @description：
 */
@Component
@Aspect
public class FeiyuProxy {
    @Pointcut("execution(* com.feiyu.services.FeiyuService.addFeiyu(..));")
    private void pointCut(){

    }
    /**
     * 前置通知
     */
    @Before(value = "pointCut()")
    public void before(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        for (int i = 0; i <args.length ; i++) {
            System.out.println("args["+i+"]:"+args[i]);
        }
        System.out.println("前置通知...");
    }

    /**
     * 后置通知
     */
    @After(value = "pointCut()")
    public void after() {
        System.out.println("后置通知...");
    }

    /*环绕通知*/
    @Around(value = "pointCut()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        System.out.println("环绕通知调用方法之前...");
        Object proceed = proceedingJoinPoint.proceed();
        System.out.println("环绕通知调用方法之后...");
        return proceed;
    }

    //@AfterReturning表达后置通知/返回通知,表达方法返回结果之后执行
    @AfterReturning(value = "pointCut()")
    public void afterReturning() {
        System.out.println("afterReturning");
    }

    //@AfterThrowing表达异常通知
    @AfterThrowing(value = "pointCut()")
    public void afterThrowing() {
        System.out.println("afterThrowing");
    }

}

spring aop启动
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context  http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/aop
        http://www.springframework.org/schema/aop/spring-aop.xsd
      ">
    <!--开启注解方式 -->
    <context:component-scan base-package="com.feiyu"></context:component-scan>
    <!--开启 aspectj 生成代理-->
    <aop:aspectj-autoproxy></aop:aspectj-autoproxy>
</beans>
import com.feiyu.services.FeiyuService;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author ：yhf
 * @date ：2023/4/12 20:17
 * @description：
 */
public class Test1 {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext app =
                new ClassPathXmlApplicationContext("spring.xml");
        FeiyuService feiyuService = app.getBean("feiyuService", FeiyuService.class);
        String s = feiyuService.addFeiyu("飞鱼");
        System.out.println(s);
    }
}

```

### SpringMVC

表示层：主要对用户的请求接受，以及数据的返回，为客户端提供应用程序的访问。 servlet层

业务逻辑层：对我们数据实现业务逻辑的封装  service层

数据访问层：对数据库访问操作  dao层

![img](https://cdn.nlark.com/yuque/0/2022/png/25438525/1658306329447-60caaeec-6042-42b4-a152-2ddad5e3e228.png)

**MVC架构**

M 代表 模型（Model）

  1.MVC全名是Model View Controller，是模型(model)－视图(view)－控制器(controller)的缩写，一种软件设计典范，用一种业务逻辑、数据、界面显示分离的方法组织代码，将业务逻辑聚集到一个部件里面，在改进和个性化定制界面及用户交互的同时，不需要重新编写业务逻辑。MVC被独特的发展起来用于映射传统的输入、处理和输出功能在一个逻辑的图形化用户界面的结构中。

M 代表 模型（Model）（业务逻辑层+数据库访问组合）

​       模型就是数据，就是 dao,bean

​       模型是应用程序中用于处理应用程序数据逻辑的部分。

通常模型对象负责在数据库中存取数据。

V 代表 视图（View）（前端）

​       视图就是网页, JSP，用来展示模型中的数据

​       视图是应用程序中处理数据显示的部分。通常视图是依据模型数据创建的。

C 代表 控制器（controller)

​       控制器的作用就是把不同的数据(Model)，显示在不同的视图(View)上，Servlet 扮演的就是这样的角色。

​       控制器是应用程序中处理用户交互的部分。通常控制器负责从视图读取数据，控制用户输入，并向模型发送数据。



1、三层是基于业务逻辑来分的，而MVC是基于页面来分的

2、三层是软件架构，通过接口实现编程；MVC模式是一种复合设计模式，一种解决方案

3、三层模式是体系结构模式，MVC是设计模式

4、三层模式又可归于部署模式，MVC可归于表示模式



**前后端分离开发模式**

体现 让专业的人做专业的事情,前端代码由前端来完成，后端代码由我们后端来完成

后端程序只需要将接口数据提供给前端调用即可。

前端：vue、饿了么UI、网页数据 例如 html、js、css

后端：接口中数据 springmvc+mybatis

将前端和后端代码分开的

View视图层---jsp、ftl、js、css

Contorller控制层springmvc 底层基于servlet  控制页面跳转、控制页面展示数据 返回json 给前端

Model模型层 业务逻辑层和数据库访问层 dao和service

![img](https://cdn.nlark.com/yuque/0/2022/png/25438525/1658306991887-07eb3c52-e3d9-41e6-a8ab-cdc8a3da4bbc.png)





1.SpringMVC 是一种基于 Java 实现 MVC 设计模型的请求驱动类型的轻量级 Web 框架,它和 Struts2 都属于表现层的框架，属于 Spring FrameWork 的后续产品，Spring MVC 分离了控制器、模型对象、过滤器以及处理程序对象的角色，这种分离让它们更容易进行定制。

2.SpringMVC 已经成为目前最主流的 MVC 框架之一，并且随着 Spring3.0 的发布，全面超越 Struts2，成 为最优秀的 MVC 框架，它通过一套注解，让一个简单的 Java 类成为处理请求的控制器，而无须实现任何接口。同时它还支持 RESTful 编程风格的请求。

简单总结：SpringMVC是一种基于Java实现MVC模型轻量级框架， 底层基于Servlet封装。

**springMVC环境搭建（注解方式启动）**

Maven依赖

```
     <!-- 整合springmvc框架依赖  -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>5.2.10.RELEASE</version>
        </dependency>

        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>3.1.0</version>
            <scope>provided</scope>
        </dependency>
```

**springMVC环境搭建注意**

1. jdk版本和spring版本适配。

2. 注解方式和xml方式配置不能重复，如果前面搭建错误，需要clean再编译。

3. 导入spring的相关包，并且javax.servlet-api指定scope为provide。

   maven依赖即tomcat插件启动webapp。

```java
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.feiyu</groupId>
    <artifactId>SpringMVC1</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <!-- 整合springmvc框架依赖  -->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>5.2.10.RELEASE</version>
        </dependency>

        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.0</version>
            <scope>provided</scope><!--必须加上scope,否则只在默认编译时作用域-->
        </dependency>

    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <configuration>
                    <port>85</port>
                    <path>/</path>
                    <ignorePackaging>true</ignorePackaging>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```

**RequestMap注解**

@RequestMapping注解是一个用来处理请求地址映射的注解，可用于映射一个请求或一个方法，可以用在类或方法上。

如果加载方法上就是具体访问路径 如果加载类上就是我们访问的前缀

springmvc 定义url路径是不允许重复

```java
package com.feiyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author ：yhf
 * @date ：2023/4/13 12:02
 * @description：
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @RequestMapping("/add")
    @ResponseBody
    public String add(){
        System.out.println("add...");
        return "add ok";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(){
        System.out.println("delete...");
        return "delete ok";
    }
}

```

**接受Get/Post请求参数**

和Controller层方法的形参同名，那么可以直接通过参数名接收值 即可

RequestMapping 默认的情况下 RequestMapping支持所有请求方式 例如 get、post 、delete

method = RequestMethod.POST 设定该接口支持的类型 post

```java
package com.feiyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author ：yhf
 * @date ：2023/4/13 12:19
 * @description：
 */
@Controller
public class MemberController {

    @RequestMapping(value = "/get",method = RequestMethod.GET)
    @ResponseBody
    public String get(Integer id,String name){
        System.out.println("id:"+id+","+"name:"+name);
        return id + name;
    }

    @RequestMapping(value = "/post",method = RequestMethod.POST)
    @ResponseBody
    public String post(Integer id,String name){
        System.out.println("id:"+id+","+"name:"+name);
        return id + name;
    }
}

```

SpringMVC5接受参数类型

1. 普通参数
2. 对象参数
3. 嵌套对象参数
4. 数组参数
5. 集合普通参数



**普通参数**

1.url地址传参，地址参数名与形参变量名相同，定义形参即可接收参数;

2.如果发生url地址传参，地址参数名与形参变量名不同，使用@RequestParam绑定参数关系;

参数：

required：是否为必传参数

defaultValue：参数默认值



**对象参数**

请求参数名与形参对象属性名相同，定义对象类型形参即可接收参数

**嵌套对象参数**

嵌套对象参数：请求参数名与形参对象属性名相同，按照对象层次结构关系即可接收嵌套对象属性参数

**数组参数**

请求参数名与形参属性名相同且请求参数为多个，定义数组类型形参即可接收参数

**集合保存普通参数**

请求参数名与形参集合对象名相同且请求参数为多个，@RequestParam绑定参数关系

http://localhost:85/demo05?arrays=1&arrays=2

@RequestParam ：同名请求参数可以使用@RequestParam注解映射到对应名称的集合对象中作为数据

```java
package com.feiyu.controller;

import com.feiyu.entity.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;

/**
 * @author ：yhf
 * @date ：2023/4/13 12:41
 * @description：
 */
@Controller
public class FeiyuDemoController {

    /*普通参数*/
    @RequestMapping(value = ("/demo2"),method = RequestMethod.POST)
    @ResponseBody
    public String demo02(@RequestParam(name = "name",required = true) String feiYuName,
                         @RequestParam(name = "age",required = false) Integer feiYuAge){
        return "name:"+feiYuName+","+"age:"+feiYuAge;
    }

    /*对象参数 嵌套对象参数*/
    @RequestMapping(value = "/demo3",method = RequestMethod.GET)
    @ResponseBody
    public String demo3(UserEntity userEntity){
        return "userName:"+userEntity.getUserName()+",\n"+"UserAge:"+userEntity.getUserAge()+"\n"+
                "userInfo:"+userEntity.getUserInfoEntity().getAddress();
    }

    /*SpringMVC接收 数组参数*/
    @RequestMapping("/demo4")
    @ResponseBody
    public String demo44(String[] arrays){
        return Arrays.toString(arrays);
    }

    /*SpringMVC 接收集合参数*/
    @RequestMapping("/demo5")
    @ResponseBody
    public String demo5(@RequestParam List<String> arrays){
        return Arrays.toString(arrays.toArray());
    }
}

```

在实际项目中更多是使用json接收数据

**SpringMVC接收json数据**

接受参数加上@RequestBody MayiktUserEntity mayiktUserEntity 标记 接受json数据

自动根据json数据反序列化成对象mayiktUserEntity 

1. 以实体类方式接收
2. 以Map接收
3. 以List接收

```java
package com.feiyu.controller;

import com.feiyu.entity.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author ：yhf
 * @date ：2023/4/13 12:41
 * @description：
 */
@Controller
public class FeiyuDemoController {

    /*普通参数*/
    @RequestMapping(value = ("/demo2"),method = RequestMethod.POST)
    @ResponseBody
    public String demo02(@RequestParam(name = "name",required = true) String feiYuName,
                         @RequestParam(name = "age",required = false) Integer feiYuAge){
        return "name:"+feiYuName+","+"age:"+feiYuAge;
    }

    /*对象参数 嵌套对象参数*/
    @RequestMapping(value = "/demo3",method = RequestMethod.GET)
    @ResponseBody
    public String demo3(UserEntity userEntity){
        return "userName:"+userEntity.getUserName()+",\n"+"UserAge:"+userEntity.getUserAge()+"\n"+
                "userInfo:"+userEntity.getUserInfoEntity().getAddress();
    }

    /*SpringMVC接收 数组参数*/
    @RequestMapping("/demo4")
    @ResponseBody
    public String demo44(String[] arrays){
        return Arrays.toString(arrays);
    }

    /*SpringMVC 接收集合参数
    * @requestParam 支持集合参数*/
    @RequestMapping("/demo5")
    @ResponseBody
    public String demo5(@RequestParam List<String> arrays){
        return Arrays.toString(arrays.toArray());
    }

    /*SpringMVC接收json数据*/
    /*1.实体类方式接收json数据
    * RequestBody支持json数据，自动将接收的json数据序列化为对象*/
    @RequestMapping("/demo6")
    @ResponseBody
    public String demo6(@RequestBody UserEntity userEntity){
        return userEntity.toString();
    }
    /* 2.以Map方式接收 json数据  key是为 Map的key  value Map的value*/
    @RequestMapping("/demo7")
    @ResponseBody
    public String demo7(@RequestBody Map<String, Object> map){
        return map.toString();
    }

    /*3.以List集合方式接收json数据 数组形式的json*/
    @RequestMapping("demo8")
    @ResponseBody
    public String demo8(@RequestBody List<UserEntity> list){
        return Arrays.toString(list.toArray());
    }
}


  <!--引入json依赖-->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>2.10.4</version>
        </dependency>
        
@Configuration
@ComponentScan("com.feiyu.controller")
@EnableWebMvc     
public class SpringMVCConfig {

}
```

SpringMVC响应json数据

1. 在接口上加上@ResponseBody 根据该方法返回值 返回对应json数据 底层 根据返回值 序列化成json数据。

2. @RestController 标记该控制类所有接口都是返回json数据

   @Controller
   @ResponseBody

```java
package com.feiyu.controller;

import com.feiyu.entity.UserEntity;
import com.feiyu.entity.UserInfoEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author ：yhf
 * @date ：2023/4/13 15:20
 * @description：
 */

/*SpringMVC响应json数据*/
@RestController
public class FeiyuRestController {
    @RequestMapping("/getFeiyu1")
    public Map<String, Object> getFeiyu(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("code","200");
        map.put("msg","ok");
        return map;
    }

    @RequestMapping("/getFeiyu2")
    public UserEntity getFeiyu1(){
        UserEntity userEntity = new UserEntity("飞鱼",23,new UserInfoEntity("shanghaishi"));
        return userEntity;
    }

}

```



使用HttpServletRequest获取参数

springmvc底层基于Servlet

Servlet HttpServletRequest  HttpServletResponse 



获取httprequest/response三种方式

1.public String mayikt(HttpServletRequest request,HttpServletResponse response)  

2.HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 

\3.    @Autowired

   private HttpServletRequest request; 

```java
package com.feiyu.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author ：yhf
 * @date ：2023/4/13 15:44
 * @description：
 */
@RestController
/*第一种 HttpServletRequest,spring底层基于Servlet实现，帮我们把参数传给HttpservletRequest.*/
public class FeiyuController1 {
    @RequestMapping("/getFY")
    public String getFY(Integer id, String name,HttpServletRequest httpServletRequest){
        System.out.println("id:"+id);
        System.out.println("name:"+name);
        String reqId = httpServletRequest.getParameter("id");
        String reqName = httpServletRequest.getParameter("name");
        System.out.println("reqId:"+reqId);
        System.out.println("reqName:"+reqName);
        return "reqID:"+reqId+","+"reqName:"+reqName;
    }

    /*第二种，*/
    @RequestMapping("/getFY1")
    public String getFY1(Integer id, String name){
        System.out.println("id:"+id);
        System.out.println("name:"+name);
        /*从ThreadLocal获取HttpServletRequest  springmvc 底层基于Servlet 提前缓存好了ttpServletRequest*/
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String reqId = request.getParameter("id");
        String reqName = request.getParameter("name");
        System.out.println("reqId:"+reqId);
        System.out.println("reqName:"+reqName);
        return "reqID:"+reqId+","+"reqName:"+reqName;
    }


}

```

**什么是restful**

Restful就是一个资源定位及资源操作的风格。不是标准也不是协议，只是一种风格规范。基于这个规格设计的软件可以更简洁、更有层次感。

资源操作：使用POST、DELETE、PUT、GET，使用不同方法对资源进行操作。

传统方式操作资源，通过不同的参数来实现不同的效果，post和get

传统方式操作资源：通过不同的参数来实现不同的效果，post 和 get。

http://127.0.0.1/feiyu/getUser?id=1 查询,GET 用户id是为1信息

http://127.0.0.1/feiyu/saveUser 新增,POST 

http://127.0.0.1/feiyu/updateUser 更新,POST

http://127.0.0.1/feiyu/deleteUser?id=1 删除,GET

(查询、删除)get   写操作（新增、修改）Post

使用RESTful操作资源 :可以通过不同的请求方式来实现不同的效果

例如：请求地址一样，但是实现的效果不一样 例如  

发送请求get 执行查询、 发送POST 执行新增、发送PUT执行更新、发送DELETE

 执行删除

http://127.0.0.1/user/1 查询,GET

http://127.0.0.1/user 新增数据,POST

http://127.0.0.1/user 更新,PUT

http://127.0.0.1/user/1 删除,DELETE

根据发送不同的类型 判断  访问不同的接口

![image-20230413164426545](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230413164426545.png)

```java
package com.feiyu.controller;

import com.feiyu.entity.FeiyuEntity;
import com.feiyu.entity.UserEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author ：yhf
 * @date ：2023/4/13 16:24
 * @description：
 */
@RestController
public class FeiyuRestfulController {
    /*Restful api请求地址都一样 根据不同请求方法判断
    * user 增加/删除/修改/查询
    * /user/{id} /user/1 指定为get请求类型/
    * /user 修改/增加 post请求类型*/
    /*根据id查询接口数据*/
    //@RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    @GetMapping(value = "/user/{id}")
    public FeiyuEntity getUser(@PathVariable("id") Integer id){
        System.out.println("[getUser] id:" + id);
        return new FeiyuEntity("feiyu"+id,22);
    }

    /*根据id删除数据*/
    @DeleteMapping(value = "/user/{id}")
    public String deleteUser(@PathVariable("id") Integer id){
        System.out.println("[deleteUser] id:" + id);
        return "ok:id" + id;
    }

    /*增加数据*/
    @PostMapping("/user")
    public String addUSer(@RequestBody FeiyuEntity feiyuEntity){
        System.out.println("[addUser] feiyuEntity:" + feiyuEntity);
        return "ok";
    }

    /*修改数据*/
    @PutMapping("/user")
    /*在参数前加@RequestBody 可以将json数据序列化为对象*/
    public String updateUSer(@RequestBody FeiyuEntity feiyuEntity){
        System.out.println("[updateUser] feiyuEntity:" + feiyuEntity);
        return "ok";
    }


}

```

**spring+springmvc+mybatis整合**

**项目技术需求分析**

1. 使用ssm+layui技术开发 对用户表数据实现增删改查

   采用前后端分离架构模式 

注意使用javax.servlet-api要指定scope范围。

![image-20230414013217521](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230414013217521.png)



**前后端分离解决跨域问题**

CORS全称Cross-Origin Resource Sharing，意为跨域资源共享。当一个资源去访问另一个不同域名或者同域名不同端口的资源时，就会发出跨域请求。如果此时另一个资源不允许其进行跨域资源访问，那么访问的那个资源就会遇到跨域问题

跨域问题是浏览器的一种安全策略,访问需要遵循同源策略：



1.使用 jsonp 但是不支持post请求 （ 不推荐使用）

2.使用SpringMVC @CrossOrigin 注解（推荐）

3.基于网关解决跨域的问题 （推荐）

4.基于Nginx 根据不同项目访问（推荐）

5.使用SpringMVC @CrossOrigin 注解 解决跨域问题  

 response.getHeaders().set("Access-Control-Allow-Origin","*");  

![image-20230414013350377](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230414013350377.png)

![image-20230414013412445](C:\Users\仗剑天涯\AppData\Roaming\Typora\typora-user-images\image-20230414013412445.png)



SSM整合项目

```java
实体类
package com.feiyu.entity;

import lombok.Data;

/**
 * @author ：yhf
 * @date ：2023/4/13 19:04
 * @description：用户实体类
 */
@Data
public class UserEntity {
    private Integer id;//id
    private String name;//姓名
    private Integer age;//年龄
    private String address;//地址
}


数据库访问层
package com.feiyu.mapper;

import com.feiyu.entity.UserEntity;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author author
 * @create 2023 - 04 - 13 20:14
 */
@Mapper
public interface UserMapper {
    @Insert("INSERT INTO `feiyu`.`feiyu_user` (`id`, `name`, `age`, `address`) VALUES (null, #{name}, #{age}, #{address});")
    int insertUser(UserEntity userEntity);

    @Delete("delete from feiyu_user where id=#{id}")
    int deleteById(Integer id);

    @Update("UPDATE `feiyu`.`feiyu_user` SET `name` = #{name}, `age` = #{age}, `address` = #{address} WHERE `id` = #{id};")
    int updateUser(UserEntity userEntity);

    @Select("select *from feiyu_user where id=#{id}")
    UserEntity getById(Integer id);

    @Select("select *from feiyu_user")
    List<UserEntity> getUserAll();
}

package com.feiyu.service;

import com.feiyu.entity.UserEntity;
import com.feiyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：yhf
 * @date ：2023/4/13 20:29
 * @description：
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public List<UserEntity> getUserAll(){
        return userMapper.getUserAll();
    }

    public int insertUser(UserEntity userEntity){
        return userMapper.insertUser(userEntity);
    }

    public int deleteUser(Integer id){
        return userMapper.deleteById(id);
    }

    public int updateUser(UserEntity userEntity){
        return userMapper.updateUser(userEntity);
    }

    public UserEntity getById(Integer id){
        return userMapper.getById(id);
    }

}


业务逻辑层（和数据库访问层构成数据模型）
   package com.feiyu.config.service;

import com.feiyu.entity.UserEntity;
import com.feiyu.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ：yhf
 * @date ：2023/4/13 20:29
 * @description：
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public List<UserEntity> getUserAll(){
        return userMapper.getUserAll();
    }

    public int insertUser(UserEntity userEntity){
        return userMapper.insertUser(userEntity);
    }

    public int deleteUser(Integer id){
        return userMapper.deleteById(id);
    }

    public int updateUser(UserEntity userEntity){
        return userMapper.updateUser(userEntity);
    }

    public UserEntity getById(Integer id){
        return userMapper.getById(id);
    }

}


控制层
    //
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.controller;

import java.util.HashMap;

public class BaseController {
    public BaseController() {
    }

    public HashMap<String, Object> setResultOk(Object data) {
        return this.setResult(200, "ok", data);
    }

    public HashMap<String, Object> setResultSuccess(String msg) {
        return this.setResult(200, msg, (Object)null);
    }

    public HashMap<String, Object> setResultError(String msg) {
        return this.setResult(500, msg, (Object)null);
    }

    public HashMap<String, Object> setResult(Integer code, String msg, Object data) {
        HashMap<String, Object> result = new HashMap();
        result.put("code", code);
        result.put("msg", msg);
        result.put("data", data);
        return result;
    }
}

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.controller;

import java.util.HashMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler extends BaseController {
    public GlobalExceptionHandler() {
    }

    @ResponseBody
    @ExceptionHandler({Exception.class})
    public HashMap<String, Object> handleException(Exception e) {
        System.out.println("自定义异常：" + e);
        return this.setResultError("系统发生了错误!");
    }
}

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.controller;

import com.feiyu.entity.UserEntity;
import com.feiyu.service.UserService;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping({"/user"})
@CrossOrigin
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    public UserController() {
    }

    @GetMapping({"/getById/{id}"})
    public HashMap<String, Object> getById(@PathVariable("id") Integer id) {
        if (id == null) {
            return this.setResultError("id is null");
        } else {
            UserEntity user = this.userService.getById(id);
            return user == null ? this.setResultError("没有查询到该数据") : this.setResultOk(user);
        }
    }

    @PostMapping({"/insertUser"})
    public HashMap<String, Object> insertUser(@RequestBody UserEntity userEntity) {
        return this.userService.insertUser(userEntity) > 0 ? this.setResultSuccess("插入数据成功！") : this.setResultError("插入数据失败！");
    }

    @DeleteMapping({"/deleteUser/{id}"})
    public HashMap<String, Object> deleteUser(@PathVariable("id") Integer id) {
        if (id == null) {
            return this.setResultError("id is null");
        } else {
            return this.userService.deleteUser(id) > 0 ? this.setResultSuccess("删除数据成功！") : this.setResultError("删除数据失败！");
        }
    }

    @PutMapping({"/updateUser"})
    public HashMap<String, Object> updateUser(@RequestBody UserEntity userEntity) {
        return this.userService.updateUser(userEntity) > 0 ? this.setResultSuccess("更新数据成功！") : this.setResultError("更新数据失败!");
    }

    @GetMapping({"/getUserAll"})
    public HashMap<String, Object> getUserAll() {
        List<UserEntity> userAll = this.userService.getUserAll();
        return this.setResult(200, "ok", userAll);
    }
}

配置整合
 //
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.config;

import com.alibaba.druid.pool.DruidDataSource;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

public class JdbcConfig {
    public JdbcConfig() {
    }

    @Bean
    public DataSource dataSource() {
        DruidDataSource druidDataSource = new DruidDataSource();
        druidDataSource.setUrl("jdbc:mysql://127.0.0.1:3306/feiyu");
        druidDataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        druidDataSource.setUsername("root");
        druidDataSource.setPassword("root");
        return druidDataSource;
    }

    @Bean
    public PlatformTransactionManager platformTransactionManager(@Autowired DataSource dataSource) {
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
        dataSourceTransactionManager.setDataSource(dataSource);
        return dataSourceTransactionManager;
    }
}

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.config;

import javax.sql.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

public class MybatisConfig {
    public MybatisConfig() {
    }

    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(@Autowired DataSource dataSource) {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setTypeAliasesPackage("com.feiyu.entity");
        return sqlSessionFactoryBean;
    }
}

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan({"com.feiyu.service"})
@EnableTransactionManagement
@Import({MybatisConfig.class, JdbcConfig.class})
@MapperScan({"com.feiyu.mapper"})
public class SpringConfig {
    public SpringConfig() {
    }
}

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@Configuration
@ComponentScan({"com.feiyu.controller"})
public class SpringMVCConfig {
    public SpringMVCConfig() {
    }
}

//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.feiyu.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
    public ServletConfig() {
    }

    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{SpringConfig.class};
    }

    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{SpringMVCConfig.class};
    }

    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}

maven依赖    

    <?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.feiyu</groupId>
    <artifactId>SSM</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <!--整合springmvc 默认就会帮我们整合spring的依赖-->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-webmvc</artifactId>
            <version>5.2.10.RELEASE</version>
        </dependency>

        <!--整合mybatis-->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis</artifactId>
            <version>3.5.7</version>
        </dependency>
        <!--spring jdbc工具-->
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-jdbc</artifactId>
            <version>5.2.10.RELEASE</version>
        </dependency>
        <!--mysql数据库连接工具-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.32</version>
        </dependency>
        <!--spring mybatis工具-->
        <dependency>
            <groupId>org.mybatis</groupId>
            <artifactId>mybatis-spring</artifactId>
            <version>2.0.6</version>
        </dependency>
        <!--阿里巴巴数据库连接池工具-->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.2.16</version>
        </dependency>
        <!--servlet请求响应模型工具-->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>javax.servlet-api</artifactId>
            <version>4.0.0</version>
            <scope>provided</scope>
        </dependency>
        <!--json数据格式响应支持工具 @RespondBody-->
        <dependency>
            <groupId>com.fasterxml.jackson.core</groupId>
            <artifactId>jackson-databind</artifactId>
            <version>2.10.4</version>
        </dependency>
        <!--lombok工具，提供getter和setter、toString方法-->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.10</version>
        </dependency>
    </dependencies>

    <!--插件形式的web tomcat服务器-->
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.tomcat.maven</groupId>
                <artifactId>tomcat7-maven-plugin</artifactId>
                <version>2.2</version>
                <configuration>
                    <port>85</port>
                    <path>/</path>
                    <ignorePackaging>true</ignorePackaging>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
    
    
  layui+axio请求  
    
首页
  <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <!-- 你的 HTML 代码 -->
    <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>
    <style>
        .xz{
            text-align: center;
        }
        a{
            color: blue;
        }
    </style>
</head>
<body>
<div class="xz"><a href="addUser.html" class="xz">新增</a></div>
<table class="layui-table" id="userData">

</table>



<script>

    initData();

    function initData() {

        axios({
            // 请求方式
            method: 'GET',
            // 请求的地址
            url: 'http://127.0.0.1:85/user/getUserAll'
        }).then(function (result) {
            // 1. 调用 axios 方法得到的返回值是 Promise 对象
            var userHtml = "    <colgroup>\n" +
                "        <col width=\"150\">\n" +
                "        <col width=\"200\">\n" +
                "        <col>\n" +
                "    </colgroup>\n" +
                "    <thead>\n" +
                "    <tr>\n" +
                "        <th>用户ID</th>\n" +
                "        <th>用户名称</th>\n" +
                "        <th>用户年龄</th>\n" +
                "        <th>用户地址</th>\n" +
                "        <th>操作</th>\n" +
                "    </tr>\n" +
                "    </thead>\n" +
                "    <tbody>\n";
            var code = result.data.code;
            if (code == "200") {
                var data = result.data.data;
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    userHtml += "    <tr id=" + data[i].id + ">\n" +
                        "        <td>" + data[i].id + "</td>\n" +
                        "        <td>" + data[i].name + "</td>\n" +
                        "        <td>"+data[i].age+"</td>\n" +
                        "        <td>"+data[i].address+"</td>\n" +
                        "        <td>" +
                        "<a href='#' onclick='deleteUserInfo(" + data[i].id + ")'>删除</a>&nbsp;&nbsp;" +
                        "<a href='update.html?id="+data[i].id+"'>修改</a>&nbsp;&nbsp;" +
                        "</td>\n" +
                        "    </tr>\n" +
                        "\n";
                }
            }
            userHtml += "    </tbody>";
            $("#userData").html(userHtml);

        })
    }
    function deleteUserInfo(id) {

        axios({
            // 请求方式
            method: 'delete',
            // 请求的地址
            url: 'http://127.0.0.1:85/user/deleteUser/' + id,
        }).then(function (result) {
            var code = result.data.code;
            if (code == "200") {
                alert('删除成功');
                $("#" + id).remove();
            }
        });
    }
</script>
</body>
</html>           
             
             
  新增           
   <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>新增用户数据</title>
  <!-- 引入layui css -->
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css"/>
  <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
  <!-- 引入layui js -->
  <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">用户名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" required lay-verify="required" placeholder="请输入用户名称" autocomplete="off"
             class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">用户年龄</label>
    <div class="layui-input-block">
      <input type="text" name="age" required lay-verify="required" placeholder="请输入用户年龄" autocomplete="off"
             class="layui-input">
    </div>
  </div>


  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">用户地址</label>
    <div class="layui-input-block">
      <textarea name="address" placeholder="请输入地址" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script>
  layui.use('form', function () {
    var form = layui.form;

    //提交
    form.on('submit(formDemo)', function (data) {
      layer.msg(JSON.stringify(data.field));
      axios({
        method: "POST",
        url: "http://127.0.0.1:85/user/insertUser/",
        data: JSON.stringify(data.field),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8'
        }
      }).then(resp => {
        var code = resp.data.code;
        if (code == "200") {
          alert("新增数据成功");
          window.location.href = "index.html";
        } else {
          alert("新增数据失败");
        }

      })

      return false;
    });
  });
</script>
</body>
</html>          
             
   修改
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>修改用户数据</title>
  <!-- 引入layui css -->
  <link rel="stylesheet" type="text/css" href="https://www.layuicdn.com/layui-v2.5.6/css/layui.css"/>
  <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
  <!-- 引入layui js -->
  <script src="https://www.layuicdn.com/layui-v2.5.6/layui.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">用户ID</label>
    <div class="layui-input-block">
      <input type="text" name="id" id="id" required lay-verify="required"
             autocomplete="off"
             class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">用户名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" id="name" required lay-verify="required" placeholder="请输入用户名称"
             autocomplete="off"
             class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">用户年龄</label>
    <div class="layui-input-block">
      <input type="text" name="age" id="age" required lay-verify="required" placeholder="请输入用户年龄"
             autocomplete="off"
             class="layui-input">
    </div>
  </div>


  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">用户地址</label>
    <div class="layui-input-block">
      <textarea name="address" id="address" placeholder="请输入地址" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即修改</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script>
  getIdUserInfo();

  function getIdUserInfo() {
    //1.获取地址栏参数
    var id = getUrlParam("id");
    //2.发送ajax请求
    axios({
      // 请求方式
      method: 'get',
      // 请求的地址
      url: 'http://127.0.0.1:85/user/getById/' + id,
    }).then(function (result) {
      var code = result.data.code;
      if (code == "200") {
        var data = result.data.data;
        // 修改 input标签对应的value值
        $("#name").val(data.name);
        $("#age").val(data.age);
        $("#address").val(data.address);
        $("#id").val(data.id);
      } else {
        alert("查询用户信息数据失败!");
      }

    })
  }

  function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null)
      return unescape(r[2]);
    return null; //返回参数值
  }

  layui.use('form', function () {
    var form = layui.form;
    //提交
    form.on('submit(formDemo)', function (data) {
      layer.msg(JSON.stringify(data.field));
      axios({
        method: "PUT",
        url: "http://127.0.0.1:85/user/updateUser/",
        data: JSON.stringify(data.field),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8'
        }
      }).then(resp => {
        var code = resp.data.code;
        if (code == "200") {
          alert("修改数据成功");
          window.location.href = "index.html";
        } else {
          alert("修改数据失败");
        }

      })

      return false;
    });
  });

</script>

</body>
</html>
             
             
             




```



### SpringBoot

SpringBoot 是一个快速开发的框架, 封装了Maven常用依赖、能够快速的整合第三方框架；简化XML配置，全部采用注解形式，内置Tomcat、Jetty、Undertow，帮助开发者能够实现快速开发，SpringBoot的Web组件 默认集成的是SpringMVC框架。

**SpringBoot原理介绍：**

1. 能够帮助开发者实现快速整合第三方框架 （原理：Maven依赖封装）

2. 去除xml配置 完全采用注解化 （原理：Spring体系中内置注解方式）

3. 无需外部Tomcat、内部实现服务器（原理：Java语言支持内嵌入Tomcat服务器）

**springBoot和springMVC的区别：**

SpringBoot 是一个快速开发的框架,能够快速的整合第三方框架，简化XML配置，全部采用注解形式，内置Tomcat容器,帮助开发者能够实现快速开发，SpringBoot的Web组件 默认集成的是SpringMVC框架。

SpringMVC是控制层。

**SpringBoot和SpringCloud的区别**

SpringBoot 是一个快速开发的框架,能够快速的整合第三方框架，简化XML配置，全部采用注解形式，内置Tomcat容器,帮助开发者能够实现快速开发，SpringBoot的Web组件 默认集成的是SpringMVC框架。

SpringMVC是控制层。

SpringCloud依赖与SpringBoot组件，使用SpringMVC编写Http协议接口，同时SpringCloud是一套完整的微服务解决框架。

**maven依赖**

```xml
<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.1.8.RELEASE </version>
	</parent>
	<dependencies>
		<dependency>
		<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
	</dependencies> 


```

pring-boot-starter-parent作用
在pom.xml中引入spring-boot-start-parent,spring官方的解释叫什么stater poms,它可以提供dependency management,也就是说依赖管理，引入以后在申明其它dependency的时候就不需要version了，后面可以看到。
spring-boot-starter-web作用
springweb 核心组件

com.feiyu.controller或者com.feiyu.service

com.feiyu.controller 视图层（web）和接口（业务逻辑）

com.feiyu.service(接口)





Rest风格表示是json格式的数据，传输协议为http。

在上加上RestController 表示修饰该Controller所有的方法返回JSON格式,直接可以编写
Restful接口该注解是SpringMVC提供的！

@EnableAutoConfiguration:

注解:作用在于让 Spring Boot  根据应用所声明的依赖来对 Spring 框架进行自动配置
 这个注解告诉Spring Boot根据添加的jar依赖猜测你想如何配置Spring。由于spring-boot-starter-web添加了Tomcat和Spring MVC，所以auto-configuration将假定你正在开发一个web应用并相应地对Spring进行设置。

 SpringApplication.run(HelloController.class, args);在main中

标识为启动类



SpringBoot启动方式

1.Springboot默认端口号为8080

```java
@RestController
@EnableAutoConfiguration
public class HelloController {
	@RequestMapping("/hello")
	public String index() {
		return "Hello World";
	}	
public static void main(String[] args) {
		SpringApplication.run(HelloController.class, args);
	}
}

```

2.@ComponentScan(basePackages = "com.mayikt.controller")---控制器扫包范围

```java
@ComponentScan(basePackages = "com.mayikt.controller")
@EnableAutoConfiguration
public class App {
	public static void main(String[] args) {
	SpringApplication.run(App.class, args);
	}
}

```

3.@SpringBootApplication
@SpringBootApplication 被 @Configuration、@EnableAutoConfiguration、@ComponentScan 注解所修饰，换言之 Springboot 提供了统一的注解来替代以上三个注解
扫包范围：在启动类上加上@SpringBootApplication注解,当前包下或者子包下所有的类都可以扫到。

```java
package com.feiyu.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author ：yhf
 * @date ：2023/4/14 14:04
 * @description：
 */
@SpringBootApplication//包含了@Configuration @EnableAutoConfiguration @ComponentScan
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class);
    }
}

```



#### Web开发

**静态资源访问**

微服务项目

前后端分离

前端----vue----前端工程师

后端---springboot--后端工程师

 静态资源，可以在项目文件夹resource文件夹下建一个static,放入静态资源。

动静分离 部署cdn上

Cdn 减少带宽距离传输 减少自己服务器带宽；

cdn整合静态资源。



**配置文件整合**

pringBoot支持两种配置方式,一种是properties文件,一种是yml。

使用yml可以减少配置文件的重复性。

application.properties:

```properties
feiyu.name=飞鱼,
feiyu.age=23
```

application.yml:

```yml
feiyu:
  name: feiyu
  age: 23
```

@Value注解，spring提供的，有两种，1.${properties} 属性2.#{obj.properties}

```java
 /*通过Value注解，可以读取properties中的数据*/
    @Value("${feiyu.name}")
    private String name;
    @Value("${feiyu.age}")
    private Integer age;
```



**渲染Web页面**

Com.feiyu.controller---视图层 渲染我们页面

Com.feiyu.service---业务逻辑层

Com.feiyu.dao---数据库访问层

渲染Web页面

在之前的示例中，都是通过@RestController来处理请求，所以返回的内容为json对象。那么如果需要渲染html页面的时候，要如何实现呢？

模板引擎 能够非常好的帮助seo搜索到该网页

在动态HTML实现上Spring Boot依然可以完美胜任，并且提供了多种模板引擎的默认配置支持，所以在推荐的模板引擎下，我们可以很快的上手开发动态网站。

·     Thymeleaf

·     FreeMarker

·     Velocity

·     Groovy

·     Mustache

Spring Boot建议使用这些模板引擎，避免使用JSP，若一定要使用JSP将无法实现Spring Boot的多种特性，具体可见后文：支持JSP的配置

使用上述模板引擎中的任何一个，它们默认的模板配置路径为：src/main/resources/templates。当然也可以修改这个路径，具体如何修改，可在后续各模板引擎的配置属性中查询并修改。





配置Application文件，视图层的mapping才会生效。

Application

```yml
spring:
  ###ThymeLeaf配置
  thymeleaf:
    #prefix：指定模板所在的目录
    prefix: classpath:/template/
    #check-tempate-location: 检查模板路径是否存在
    check-template-location: true
    #cache: 是否缓存，开发模式下设置为false，避免改了模板还要重启服务器，线上设置为true，可以提高性能。
    cache: true
    suffix: .html
    encoding: UTF-8
    mode: HTML5
  http:
    encoding:
      force: true
      ### 模版引擎编码为UTF-8
      charset: UTF-8
  freemarker:
    allow-request-override: false
    cache: false
    check-template-location: true
    charset: UTF-8
    content-type: text/html; charset=utf-8
    expose-request-attributes: false
    expose-session-attributes: false
    expose-spring-macro-helpers: false
    ## 模版文件结尾.ftl
    suffix: .ftl
    ## 模版文件目录
    template-loader-path: classpath:/template
    
    

      

    
    package com.feiyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * @author ：yhf
 * @date ：2023/4/14 14:58
 * @description：
 */
@Controller
public class Index {
    @RequestMapping("/index")
    public String index(Map<String,Object> result){
        result.put("name","feiyu");
        //req.setAttribute("name","feiyu");

        return "index";
    }
}
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8" />
    <title></title>
</head>
<body>
${name}
</body>
</html>

```

**Thymeleaf模板**

maven依赖

```xml
<!--引入thymeleaf的依赖-->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-thymeleaf</artifactId>
</dependency>

```

application.yml配置文件

```yml
###ThymeLeaf配置
spring:
  thymeleaf:
    #prefix：指定模板所在的目录
    prefix: classpath:/templates/
	check-template-location: true
    #cache: 是否缓存，开发模式下设置为false，避免改了模板还要重启服务器，线上设置为true，可以提高性能。
    cache: true
    suffix:  .html
    encoding: UTF-8
    mode: HTML5

```



使用

```java
@Controller
public class IndexController {
    @RequestMapping("/myThymeleaf")
    public String myThymeleaf(Map<String, Object> result) {
        result.put("user", new UserEntity("mayikt", 22));
        return "myThymeleaf";
    }
}
<!DOCTYPE html>
<!--需要在HTML文件中加入以下语句： -->
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Show User</title>
</head>
<body>
<table>
    姓名:<span th:text="${user.userName}"></span>
    年龄:<span th:text="${user.age}"></span>
</table>
 <ul th:each="user:${userList}">
    <li th:text="${user.userName}"></li>
    <li th:text="${user.age}"></li>
    <br>
</ul>
<span th:if="${user.age>17}">已经成年啦</span>
<span th:if="${user.age<17}">未成年</span>

</body>
</html>

```



### springboot整合多数据源

```yml
配置maven依赖
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-jta-atomikos</artifactId>
</dependency>
@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private OrderMapper orderMapper;

    @Transactional(transactionManager = "memberTransactionManager")
    public int addUser(String userName, Integer age) {
        int result = memberMapper.addUser(userName, age);
        orderMapper.inserOrder(userName);
        int j = 1 / age;
        return result;
    }
}







spring:
  datasource:
    ###会员数据库
    member:
      url: jdbc:mysql://localhost:3306/user
      username: root
      password: root
      borrowConnectionTimeout: 30
      loginTimeout: 30
      maintenanceInterval: 60
      maxIdleTime: 60
      maxLifetime: 20000
      maxPoolSize: 25
      minPoolSize: 3
      uniqueResourceName: orderDatasource
    ###订单数据库
    order:
      url: jdbc:mysql://localhost:3306/order
      username: root
      password: root
      borrowConnectionTimeout: 30
      loginTimeout: 30
      maintenanceInterval: 60
      maxIdleTime: 60
      maxLifetime: 20000
      maxPoolSize: 25
      minPoolSize: 3
      uniqueResourceName: memberDatasource

读取配置文件
@ConfigurationProperties(prefix = "spring.datasource.member")
@Data
public class MemberConfig {
    private String url;
    private String userName;
    private String passWord;
    private int minPoolSize;
    private int maxPoolSize;
    private int maxLifetime;
    private int borrowConnectionTimeout;
    private int loginTimeout;
    private int maintenanceInterval;
    private int maxIdleTime;
    private String testQuery;

    private String uniqueResourceName;
}



@ConfigurationProperties(prefix = "spring.datasource.order")
@Data
public class OrderConfig {
    private String url;
    private String userName;
    private String passWord;
    private int minPoolSize;
    private int maxPoolSize;
    private int maxLifetime;
    private int borrowConnectionTimeout;
    private int loginTimeout;
    private int maintenanceInterval;
    private int maxIdleTime;
    private String testQuery;

    private String uniqueResourceName;

}
创建多数据源
@Configuration
@MapperScan(basePackages = "com.mayikt.member.mapper", sqlSessionTemplateRef = "memberSqlSessionTemplate")
public class MemberDataSourceConfig {
    //@Configuration xml  MemberDataSourceConfig.xml

    /**
     * 创建我们的DataSource
     *
     * @return
     */
    @Bean("memberDataSource")
    public DataSource memberDataSource(MemberConfig memberConfig) throws SQLException {
        // 1.创建MysqlXADataSource
        MysqlXADataSource mysqlXaDataSource = new MysqlXADataSource();
        mysqlXaDataSource.setUrl(memberConfig.getUrl());
        mysqlXaDataSource.setPinGlobalTxToPhysicalConnection(true);
        mysqlXaDataSource.setPassword(memberConfig.getPassWord());
        mysqlXaDataSource.setUser(memberConfig.getUserName());
        mysqlXaDataSource.setPinGlobalTxToPhysicalConnection(true);


        // 2.将本地事务注册到创 Atomikos全局事务
        AtomikosDataSourceBean xaDataSource = new AtomikosDataSourceBean();
        xaDataSource.setXaDataSource(mysqlXaDataSource);
        xaDataSource.setUniqueResourceName(memberConfig.getUniqueResourceName());
        xaDataSource.setMinPoolSize(memberConfig.getMinPoolSize());
        xaDataSource.setMaxPoolSize(memberConfig.getMaxPoolSize());
        xaDataSource.setMaxLifetime(memberConfig.getMaxLifetime());
        xaDataSource.setBorrowConnectionTimeout(memberConfig.getBorrowConnectionTimeout());
        xaDataSource.setLoginTimeout(memberConfig.getLoginTimeout());
        xaDataSource.setMaintenanceInterval(memberConfig.getMaintenanceInterval());
        xaDataSource.setMaxIdleTime(memberConfig.getMaxIdleTime());
        xaDataSource.setTestQuery(memberConfig.getTestQuery());
        return xaDataSource;
    }

    /**
     * 创建我们的SqlSessionFactory
     *
     * @param dataSource
     * @return
     * @throws Exception
     */
    @Bean(name = "memberSqlSessionFactory")
    public SqlSessionFactory memberSqlSessionFactory(@Qualifier("memberDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        return sqlSessionFactoryBean.getObject();
    }



    /**
     * 创建订单sqlSesion模版
     *
     * @param sqlSessionFactory
     * @return
     * @throws Exception
     */
    @Bean(name = "memberSqlSessionTemplate")
    public SqlSessionTemplate memberSqlSessionTemplate(
            @Qualifier("memberSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }


}


@Configuration
@MapperScan(basePackages = "com.mayikt.order.mapper", sqlSessionTemplateRef = "orderSqlSessionTemplate")
public class OrderDataSourceConfig {
    //@Configuration xml  orderDataSourceConfig.xml

    /**
     * 创建我们的DataSource
     *
     * @return
     */
    @Bean("orderDataSource")
    public DataSource orderDataSource(OrderConfig orderConfig) throws SQLException {
        // 1.创建MysqlXADataSource
        MysqlXADataSource mysqlXaDataSource = new MysqlXADataSource();
        mysqlXaDataSource.setUrl(orderConfig.getUrl());
        mysqlXaDataSource.setPinGlobalTxToPhysicalConnection(true);
        mysqlXaDataSource.setPassword(orderConfig.getPassWord());
        mysqlXaDataSource.setUser(orderConfig.getUserName());
        mysqlXaDataSource.setPinGlobalTxToPhysicalConnection(true);


        // 2.将本地事务注册到创 Atomikos全局事务
        AtomikosDataSourceBean xaDataSource = new AtomikosDataSourceBean();
        xaDataSource.setXaDataSource(mysqlXaDataSource);
        xaDataSource.setUniqueResourceName(orderConfig.getUniqueResourceName());
        xaDataSource.setMinPoolSize(orderConfig.getMinPoolSize());
        xaDataSource.setMaxPoolSize(orderConfig.getMaxPoolSize());
        xaDataSource.setMaxLifetime(orderConfig.getMaxLifetime());
        xaDataSource.setBorrowConnectionTimeout(orderConfig.getBorrowConnectionTimeout());
        xaDataSource.setLoginTimeout(orderConfig.getLoginTimeout());
        xaDataSource.setMaintenanceInterval(orderConfig.getMaintenanceInterval());
        xaDataSource.setMaxIdleTime(orderConfig.getMaxIdleTime());
        xaDataSource.setTestQuery(orderConfig.getTestQuery());
        return xaDataSource;
    }

    /**
     * 创建我们的SqlSessionFactory
     *
     * @param dataSource
     * @return
     * @throws Exception
     */
    @Bean(name = "orderSqlSessionFactory")
    public SqlSessionFactory orderSqlSessionFactory(@Qualifier("orderDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        return sqlSessionFactoryBean.getObject();
    }
//
//    /**
//     * 创建会员管理器
//     *
//     * @param dataSource
//     * @return
//     */
//    @Bean(name = "orderTransactionManager")
//    public DataSourceTransactionManager orderTransactionManager(@Qualifier("orderDataSource") DataSource dataSource) {
//        return new DataSourceTransactionManager(dataSource);
//    }

    /**
     * 创建订单sqlSesion模版
     *
     * @param sqlSessionFactory
     * @return
     * @throws Exception
     */
    @Bean(name = "orderSqlSessionTemplate")
    public SqlSessionTemplate orderSqlSessionTemplate(
            @Qualifier("orderSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }


}
启动加载配置
@EnableConfigurationProperties({OrderConfig.class, MemberConfig.class})
```

lombok使用

```java
@Data 标签，生成getter/setter toString()等方法 
@NonNull : 让你不在担忧并且爱上NullPointerException 
@CleanUp : 自动资源管理：不用再在finally中添加资源的close方法 
@Setter/@Getter : 自动生成set和get方法 
@ToString : 自动生成toString方法 
@EqualsAndHashcode : 从对象的字段中生成hashCode和equals的实现 
@NoArgsConstructor/@RequiredArgsConstructor/@AllArgsConstructor 
自动生成构造方法 
@Data : 自动生成set/get方法，toString方法，equals方法，hashCode方法，不带参数的构造方法 
@Value : 用于注解final类 
@Builder : 产生复杂的构建器api类 
@SneakyThrows : 异常处理（谨慎使用） 
@Synchronized : 同步方法安全的转化 
@Getter(lazy=true) : 
@Log : 支持各种logger对象，使用时用对应的注解，如：@Log4

```

日志打印

```java
private static Logger log = Logger.getLogger(App.class);
直接在类上加上@Slf4j 
```



**springboot热部署**

修改java类或页面或者静态文件，不需要手动重启

原理：类加载器 

适合于本地开发环境

maven依赖

```xml
<!--SpringBoot热部署配置 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>

```

### **springboot整合配置文件**

在springboot整合配置文件，分成两大类

application.yml

Bootstrap.yml

区别：bootstrap.yml 和 application.yml 都可以用来配置参数。

bootstrap.yml 用来程序引导时执行，应用于更加早期配置信息读取。可以理解成系统级别的一些参数配置，这些参数一般是不会变动的。一旦bootStrap.yml 被加载，则内容不会被覆盖。

application.yml 可以用来定义应用级别的， 应用程序特有配置信息，可以用来配置后续各个模块中需使用的公共参数等。

Properties在线转换yml格式网址：https://www.toyaml.com/index.html

**配置文件占位符**

在SpringBoot的配置文件中，我们可以使用SpringBoot提供的的一些随机数

```xml
${random.value}、${random.int}、${random.long}
${random.int(10)}、${random.int[1024,65536]}
-${app.name:默认值} 来制定找不到属性时的默认值

```

**多环境配置**

```
spring:
  profiles:
    active: pre
```

application-dev.yml：开发环境

application-test.yml：测试环境

application-prd.yml：生产环境



**核心配置**

```yml
server:
  port: 8081
  servlet:
    context-path: /mayikt
 
Springboot 默认的情况下整合tomcat容器
```

### **使用logback记录日志**

Springboot 已经默认帮你整合好了logback

日志输出文件在当前项目路径log文件夹下

maven依赖

```xml
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
</dependency>
```



logback配置

```xml
<configuration>
    <!--本文主要输出日志为控制台日志，系统日志，sql日志，异常日志-->
    <!-- %m输出的信息,%p日志级别,%t线程名,%d日期,%c类的全名,,,, -->
    <!--控制台-->
    <appender name="console" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d %p (%file:%line\)- %m%n</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>

    <!--系统info级别日志-->
    <!--<File> 日志目录，没有会自动创建-->
    <!--<rollingPolicy>日志策略，每天简历一个日志文件，或者当天日志文件超过64MB时-->
    <!--encoder 日志编码及输出格式-->
    <appender name="fileLog"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <File>log/file/fileLog.log</File>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>log/file/fileLog.log.%d.%i</fileNamePattern>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- or whenever the file size reaches 64 MB -->
                <maxFileSize>64 MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <encoder>
            <pattern>
                %d %p (%file:%line\)- %m%n
            </pattern>
            <charset>UTF-8</charset>
            <!-- 此处设置字符集 -->
        </encoder>
    </appender>

    <!--sql日志-->
    <appender name="sqlFile"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <File>log/sql/sqlFile.log</File>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>log/sql/sqlFile.log.%d.%i</fileNamePattern>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- or whenever the file size reaches 64 MB -->
                <maxFileSize>64 MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <!--对记录事件进行格式化。负责两件事，一是把日志信息转换成字节数组，二是把字节数组写入到输出流。-->
        <encoder>
            <!--用来设置日志的输入格式-->
            <pattern>
                %d %p (%file:%line\)- %m%n
            </pattern>
            <charset>UTF-8</charset>
            <!-- 此处设置字符集 -->
        </encoder>
    </appender>


    <!--异常日志-->
    <appender name="errorFile"
              class="ch.qos.logback.core.rolling.RollingFileAppender">
        <File>log/error/errorFile.log</File>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>log/error/errorFile.%d.log.%i</fileNamePattern>
            <timeBasedFileNamingAndTriggeringPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP">
                <!-- or whenever the file size reaches 64 MB -->
                <maxFileSize>64 MB</maxFileSize>
            </timeBasedFileNamingAndTriggeringPolicy>
        </rollingPolicy>
        <!--对记录事件进行格式化。负责两件事，一是把日志信息转换成字节数组，二是把字节数组写入到输出流。-->
        <encoder>
            <!--用来设置日志的输入格式-->
            <pattern>
                %d %p (%file:%line\)- %m%n
            </pattern>
            <charset>UTF-8</charset>
            <!-- 此处设置字符集 -->
        </encoder>
        <!--
            日志都在这里 过滤出 error
            使用 try {}catch (Exception e){} 的话异常无法写入日志，可以在catch里用logger.error()方法手动写入日志
            -->
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>ERROR</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>
    </appender>
    <!--  日志输出级别 -->
    <!--All\DEBUG\INFO\WARN\ERROR\FATAL\OFF-->
    <!--打印info级别日志，分别在控制台，fileLog，errorFile输出
        异常日志在上面由过滤器过滤出ERROR日志打印
    -->
    <root level="INFO">
        <appender-ref ref="fileLog" />
        <appender-ref ref="console" />
        <appender-ref ref="errorFile" />
    </root>

    <!--打印sql至sqlFile文件日志-->
    <logger name="com.dolphin.mapper" level="DEBUG" additivity="false">
        <appender-ref ref="console" />
        <appender-ref ref="sqlFile" />
    </logger>
</configuration>
```

application配置

```yml
###指定读取logback配置文件
logging:
  config: classpath:log/logback.xml
```

测试案例

```java
@RestController
@Slf4j
public class MyIndexService {
 
@RequestMapping("/getName")
public String getName(String name, int age) {
    log.info("name:{},age:{}", name, age);
    return name;
}
 
}
```



### 日志级别

ALL 最低等级的，用于打开所有日志记录。

TRACE designates finer-grained informational events than the DEBUG.Since:1.2.12，很低的日志级别，一般不会使用。

**DEBUG** **指出细粒度信息事件对调试应用程序是非常有帮助的，主要用于开发过程中打印一些运行信息。**

**INFO** **消息在粗粒度级别上突出强调应用程序的运行过程。打印一些你感兴趣的或者重要的信息，这个可以用于生产环境中输出程序运行的一些重要信息，但是不能滥用，避免打印过多的日志。**

WARN 表明会出现潜在错误的情形，有些信息不是错误信息，但是也要给程序员的一些提示

**ERROR** **指出虽然发生错误事件，但仍然不影响系统的继续运行。打印错误和异常信息，如果不想输出太多的日志，可以使用这个级别。**

FATAL 指出每个严重的错误事件将会导致应用程序的退出。这个级别比较高了。重大错误，这种级别你可以直接停止程序了。

OFF 最高等级的，用于关闭所有日志记录。



日志级别

机制：如果一条日志信息的级别大于等于配置文件的级别，就记录。

 

trace：追踪，就是程序推进一下，可以写个trace输出

debug：调试，一般作为最低级别，trace基本不用。

info：输出重要的信息，使用较多

warn：警告，有些信息不是错误信息，但也要给程序员一些提示。

error：错误信息。用的也很多。

fatal：致命错误。

输出源

CONSOLE（输出到控制台）

FILE（输出到文件）

格式

SimpleLayout：以简单的形式显示

HTMLLayout：以HTML表格显示

PatternLayout：自定义形式显示



lo4j配置

```peoperties
#log4j.rootLogger=CONSOLE,info,error,DEBUG
log4j.rootLogger=DEBUG,error,CONSOLE,info
log4j.appender.CONSOLE=org.apache.log4j.ConsoleAppender     
log4j.appender.CONSOLE.layout=org.apache.log4j.PatternLayout     
log4j.appender.CONSOLE.layout.ConversionPattern=%d{yyyy-MM-dd-HH-mm} [%t] [%c] [%p] - %m%n    
   
log4j.logger.info=info
log4j.appender.info=org.apache.log4j.DailyRollingFileAppender
log4j.appender.info.layout=org.apache.log4j.PatternLayout     
log4j.appender.info.layout.ConversionPattern=%d{yyyy-MM-dd-HH-mm} [%t] [%c] [%p] - %m%n  
log4j.appender.info.datePattern='.'yyyy-MM-dd
log4j.appender.info.Threshold = info   
log4j.appender.info.append=true
log4j.appender.info.File=E:/code/log/info.log

log4j.logger.error=error  
log4j.appender.error=org.apache.log4j.DailyRollingFileAppender
log4j.appender.error.layout=org.apache.log4j.PatternLayout     
log4j.appender.error.layout.ConversionPattern=%d{yyyy-MM-dd-HH-mm} [%t] [%c] [%p] - %m%n  
log4j.appender.error.datePattern='.'yyyy-MM-dd
log4j.appender.error.Threshold = error   
log4j.appender.error.append=true
log4j.appender.error.File=E:/code/log/error.log

log4j.logger.DEBUG=DEBUG
log4j.appender.DEBUG=org.apache.log4j.DailyRollingFileAppender
log4j.appender.DEBUG.layout=org.apache.log4j.PatternLayout     
log4j.appender.DEBUG.layout.ConversionPattern=%d{yyyy-MM-dd-HH-mm} [%t] [%c] [%p] - %m%n  
log4j.appender.DEBUG.datePattern='.'yyyy-MM-dd
log4j.appender.DEBUG.Threshold = DEBUG   
log4j.appender.DEBUG.append=true
log4j.appender.DEBUG.File=E:/code/log/dubug.log
```

maven依赖

```xml
<!-- springboot-log4j -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-log4j</artifactId>
    <version>1.3.8.RELEASE</version>
</dependency>

```

application

```yml
logging:
  config: classpath:log4j.properties
```

### **使用AOP统一处理Web请求日志**

基于AOP实现 或者elk

在我们的方法的前后实现拦截 减少打印日志代码的冗余性的问题



maven依赖

```xml
<dependency>

​      <groupId>org.springframework.boot</groupId>

​      <artifactId>spring-boot-starter-aop</artifactId>

  </dependency>
```

aop切面相关配置

```java
@Aspect
@Component
public class WebLogAspect {

	private static final Logger logger = LoggerFactory.getLogger(WebLogAspect.class);

	@Pointcut("execution(public * com.mayikt.controller.*.*(..))")
	public void webLog() {
	}

	@Before("webLog()")
	public void doBefore(JoinPoint joinPoint) throws Throwable {
		// 接收到请求，记录请求内容
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		// 记录下请求内容
		logger.info("URL : " + request.getRequestURL().toString());
		logger.info("HTTP_METHOD : " + request.getMethod());
		logger.info("IP : " + request.getRemoteAddr());
		Enumeration<String> enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			logger.info("name:{},value:{}", name, request.getParameter(name));
		}
	}

	@AfterReturning(returning = "ret", pointcut = "webLog()")
	public void doAfterReturning(Object ret) throws Throwable {
		// 处理完请求，返回内容
		logger.info("RESPONSE : " + ret);
	}
}

```



**使用@Scheduled创建定时任务**



在Spring Boot的主类中加入@EnableScheduling注解，启用定时任务的配置

```java
@Component
public class ScheduledTasks {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
    @Scheduled(fixedRate = 5000)
    public void reportCurrentTime() {
        System.out.println("现在时间：" + dateFormat.format(new Date()));
    }
}

```

@Scheduled(cron = "0/2 * * * * *") 写法：

https://www.bejson.com/othertools/cron/

Xxl-job

**使用@Async实现异步调用**

启动加上@EnableAsync ,需要执行异步方法上加入 @Async

**异步应用场景**

@Async实际就是多线程封装的

异步线程执行方法有可能会非常消耗cpu的资源，所以大的项目建议使用

Mq异步实现。

**整合线程池**

```java
@Configuration
@EnableAsync
public class ThreadPoolConfig {

    /**
     * 每秒需要多少个线程处理?
     * tasks/(1/taskcost)
     */
    private int corePoolSize = 3;

    /**
     * 线程池维护线程的最大数量
     * (max(tasks)- queueCapacity)/(1/taskcost)
     */
    private int maxPoolSize = 3;

    /**
     * 缓存队列
     * (coreSizePool/taskcost)*responsetime
     */
    private int queueCapacity = 10;

    /**
     * 允许的空闲时间
     * 默认为60
     */
    private int keepAlive = 100;

    @Bean
    public TaskExecutor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        // 设置核心线程数
        executor.setCorePoolSize(corePoolSize);
        // 设置最大线程数
        executor.setMaxPoolSize(maxPoolSize);
        // 设置队列容量
        executor.setQueueCapacity(queueCapacity);
        // 设置允许的空闲时间（秒）
        //executor.setKeepAliveSeconds(keepAlive);
        // 设置默认线程名称
        executor.setThreadNamePrefix("thread-");
        // 设置拒绝策略rejection-policy：当pool已经达到max size的时候，如何处理新任务
        // CALLER_RUNS：不在新线程中执行任务，而是有调用者所在的线程来执行
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        // 等待所有任务结束后再关闭线程池
        executor.setWaitForTasksToCompleteOnShutdown(true);
        return executor;
    }

}


@Slf4j
@Component
public class MemberServiceAsync {
    @Async("taskExecutor")
    public String smsAsync() {
        log.info(">02<");
        try {
            log.info(">正在发送短信..<");
            Thread.sleep(3000);
        } catch (Exception e) {

        }
        log.info(">03<");
        return "短信发送完成!";
    }
}

```



**异步注解配置**

```java
@Configuration
@EnableAsync
public class ThreadPoolConfig {

    /**
     * 每秒需要多少个线程处理?
     * tasks/(1/taskcost)
     */
    private int corePoolSize = 3;

    /**
     * 线程池维护线程的最大数量
     * (max(tasks)- queueCapacity)/(1/taskcost)
     */
    private int maxPoolSize = 3;

    /**
     * 缓存队列
     * (coreSizePool/taskcost)*responsetime
     */
    private int queueCapacity = 10;

    /**
     * 允许的空闲时间
     * 默认为60
     */
    private int keepAlive = 100;

    @Bean
    public TaskExecutor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        // 设置核心线程数
        executor.setCorePoolSize(corePoolSize);
        // 设置最大线程数
        executor.setMaxPoolSize(maxPoolSize);
        // 设置队列容量
        executor.setQueueCapacity(queueCapacity);
        // 设置允许的空闲时间（秒）
        //executor.setKeepAliveSeconds(keepAlive);
        // 设置默认线程名称
        executor.setThreadNamePrefix("thread-");
        // 设置拒绝策略rejection-policy：当pool已经达到max size的时候，如何处理新任务
        // CALLER_RUNS：不在新线程中执行任务，而是有调用者所在的线程来执行
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        // 等待所有任务结束后再关闭线程池
        executor.setWaitForTasksToCompleteOnShutdown(true);
        return executor;
    }

}

```

**失效问题**

注意：如果异步注解写当前自己类，有可能aop会失效，无法拦截注解，最终导致异步注解失效，需要经过代理类调用接口；

所以需要将异步的代码单独抽取成一个类调用接口。



### **全局捕获异常**



@ExceptionHandler 表示拦截异常

·     @ControllerAdvice 是 controller 的一个辅助类，最常用的就是作为全局异常处理的切面类

·     @ControllerAdvice 可以指定扫描范围

·     @ControllerAdvice 约定了几种可行的返回值，如果是直接返回 model 类的话，需要使用 @ResponseBody 进行 json 转换

  返回 String，表示跳到某个 view

  返回 modelAndView

  返回 model + @ResponseBody



```java
@ControllerAdvice
public class MayiktExceptionHandler {

    /**
     * 拦截运行异常出现的错误~~~
     *
     * @return
     */
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public Map<Object, Object> exceptionHandler() {
        Map<Object, Object> map = new HashMap<>();
        map.put("error", "500");
        map.put("msg", "系统出现错误~");
        return map;
    }
}
```

**发布打包**

使用mvn package 打包

使用java –jar 包名

如果报错没有主清单,在pom文件中新增

```xml
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <executions>
                <execution>
                    <goals>
                        <goal>repackage</goal>
                    </goals>
                </execution>
            </executions>
            <configuration>
                <mainClass>com.mayikt.App</mainClass>
                <excludes>
                    <exclude>
                        <groupId>junit</groupId>
                        <artifactId>junit</artifactId>
                    </exclude>
                    <exclude>
                        <groupId>org.springframework.boot</groupId>
                        <artifactId>spring-boot-starter-test</artifactId>
                    </exclude>
                </excludes>
            </configuration>
        </plugin>
    </plugins>
</build>

```





















































