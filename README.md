# 学生管理系统（Student Management System）

一个基于JSP和MySQL的学校学生管理与考勤系统。

## 功能特性

- ✅ **用户认证** - 登录/注册功能
- ✅ **学生信息管理** - 增删改查学生信息
- ✅ **考勤管理** - 记录学生进出校时间
- ✅ **数据统计** - 查看考勤统计信息

## 技术栈

- **前端**: JSP, HTML5, CSS3, JavaScript
- **后端**: Java Servlet
- **数据库**: MySQL
- **服务器**: Apache Tomcat
- **构建工具**: Maven (可选)

## 项目结构

```
JSP/
├── database/
│   └── schema.sql           # 数据库初始化脚本
├── src/
│   ├── java/
│   │   └── com/
│   │       └── student/
│   │           ├── servlet/
│   │           │   ├── LoginServlet.java
│   │           │   ├── StudentServlet.java
│   │           │   └── AttendanceServlet.java
│   │           └── util/
│   │               ├── DBUtil.java
│   │               └── PasswordUtil.java
│   └── webapp/
│       ├── jsp/
│       │   ├── login.jsp
│       │   ├── register.jsp
│       │   ├── dashboard.jsp
│       │   ├── student/
│       │   │   ├── list.jsp
│       │   │   ├── add.jsp
│       │   │   ├── edit.jsp
│       │   │   └── detail.jsp
│       │   └── attendance/
│       │       ├── list.jsp
│       │       ├── add.jsp
│       │       └── statistics.jsp
│       ├── css/
│       │   └── style.css
│       ├── js/
│       │   └── main.js
│       └── WEB-INF/
│           └── web.xml
└── README.md
```

## 快速开始

### 1. 数据库设置

```bash
# 连接到MySQL
mysql -u root -p

# 创建数据库和表
source database/schema.sql;
```

### 2. 配置数据库连接

编辑 `src/java/com/student/util/DBUtil.java` 中的数据库连接参数。

### 3. 部署到Tomcat

- 将项目放入Tomcat的webapps目录
- 启动Tomcat服务器
- 访问 `http://localhost:8080/JSP`

## 使用说明

1. **首次使用**: 进入注册页面创建账户
2. **登录**: 使用注册的账户登录
3. **管理学生**: 在学生管理页面进行学生信息的增删改查
4. **记录考勤**: 在考勤页面记录学生的进出时间
5. **查看统计**: 查看学生的考勤统计数据

## 数据库表结构

### users表
- 存储用户账号信息

### students表
- 存储学生基本信息

### attendance表
- 存储学生考勤记录

详见 `database/schema.sql`

## 许可证

MIT License

## 作者

yzy523
