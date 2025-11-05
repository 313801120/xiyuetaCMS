<p align=center>
  <a href="http://www.xiyueta.com">
    <img src="http://www.xiyueta.com/images/xiyuetacms.jpg" alt="xiyueta" width="360">
  </a>
</p>

## 简介
XiyuetaCMS v1.3 是一款基于 Classic ASP 的开源网站管理系统，支持 Access/SQL Server 多数据库，集 PC/移动/平板于一体，多语言（简体/繁体/英文）和动静态切换。内置后台管理、内容模型（新闻/产品/案例/下载/单页/留言等）、模板系统、上传中心、站点地图/RSS 以及安全与统计功能。

适用于企业官网、产品展示、资讯门户、案例作品集等快速建站场景，可一键切换为“纯静态 HTML”以获得更佳的访问性能与 SEO 友好性。

### 主要特性
- 多端适配：PC/移动/平板自适应显示
- 多语言：简体/繁体/英文，可扩展
- 动静切换：支持动态 ASP、伪静态与纯静态 HTML 输出
- 内容模型：新闻、产品、下载、案例、单页、留言、标签等
- 模板系统：模块化区块模板，快速搭建整站风格
- 上传中心：图片/视频/文本/Excel/IIS 日志等多类上传
- SEO 支持：自定义标题/关键词/描述，内置 RSS 与 Sitemap
- 安全与运维：后台安全策略、日志统计、数据库备份

## 目录结构
项目根目录关键结构如下（省略部分文件）：

```text
admin/           后台管理（内容、栏目、模板、系统、统计、备份等）
api/             前台 API（评论/留言、点赞、上传、RSS、Sitemap 等）
data/            数据库与数据文件
inc/             核心程序与类库（数据库、FSO、JSON、缓存、IP、图像、会员等）
install/         安装程序（可选 Access 或 SQL Server）
uploadfiles/     上传文件目录
web/             前台资源与模板（CSS/JS/区块模板）
common.asp       前台公共程序（SEO/URL/导航/文章解析/静态化逻辑）
default.asp      前台首页入口（动态模式）
web.config       IIS 配置（默认文档优先 index.html）
```

## 快速开始
### 环境要求
- Windows + IIS（启用 ASP）
- Access 或 SQL Server（任选其一）

### 安装步骤
1. 将项目部署至 IIS 站点目录。
2. 确保 `data/` 可读写（如使用 Access）。
3. 访问 `install/` 根据引导完成安装（可选 Access 或 SQL Server）。
4. 访问前台：`/`（动态模式默认 `default.asp`），或静态首页 `index.html`。
5. 登录后台：`/admin/`，默认账号密码：`admin / admin`。

### 后台常用入口
- 内容管理：新闻/产品/案例/下载/单页/留言等模块
- 栏目与模板：`网站栏目`、`layout_*`、`tpl` 等
- 系统运维：`系统日志`、`数据库备份`、`IIS 统计`、`站点地图`

### 示例与调试入口（强烈推荐）
- 核心测试/布局模块（用于快速生成与调试后台界面）：
  - test_layout_page（页面布局示例｜生成后台布局界面程序）
    - 后台入口：`/admin/app/test_layout_page/list.asp`
  - test_layout_page_config（页面布局配置）
    - 后台入口：`/admin/app/test_layout_page_config/list.asp`
  - test_layout_table_button（表格按钮示例）
    - 后台入口：`/admin/app/test_layout_table_button/list.asp`
  - test_layout_table_action（表格行内操作示例）
    - 后台入口：`/admin/app/test_layout_table_action/list.asp`
  - test_layout_table_toolbar（表格工具栏示例）
    - 后台入口：`/admin/app/test_layout_table_toolbar/list.asp`
  - test_layout_listPage_form（列表 + 表单联动示例）
    - 后台入口：`/admin/app/test_layout_listPage_form/list.asp`
  - test_layout_action（通用动作示例）
    - 后台入口：`/admin/app/test_layout_action/list.asp`
  - test_layout_field（字段配置示例）
    - 后台入口：`/admin/app/test_layout_field/list.asp`
  - test_layout_database（数据库布局示例）
    - 后台入口：`/admin/app/test_layout_database/list.asp`
  - test_layout_database_table（数据库表布局示例）
    - 后台入口：`/admin/app/test_layout_database_table/list.asp`
  - test_layout_database_field（数据库字段布局示例）
    - 后台入口：`/admin/app/test_layout_database_field/list.asp`
  - （可选）test_layout_search_list、test_layout_sortrank_list（已注释的搜索/排序列表示例，可按需启用）

## 动静态切换与纯静态 HTML
系统支持动态 ASP、伪静态以及纯静态 HTML 输出。核心控制由 `common.asp` 中的 `asporhtml` 标志与后台设置决定：

### 开启步骤
1. 后台 → 设置 → 网站设置 → “网站动静转换” → 选择“静态”。
2. 确保 IIS 默认文档将 `index.html` 置于优先（本项目 `web.config` 已内置）。
3. 如需按语言/栏目生成独立目录，建议在“网站栏目”为每个栏目设置 `filename`。

### 说明
- 开启“静态”后，系统会生成以 `.html` 结尾的链接；结合后台发布/生成操作，可落地纯静态文件。
- 仍可通过在 URL 末尾添加 `?ishtml=1` 临时开启静态预览。
- 详情页静态命名示例：`目录/detail_文章ID.html`，更利于 SEO 与管理。

### 相关后台操作
- 站点地图：`admin/app/sitemap/sitemap.asp`
- RSS：`api/rss/default.asp`（可通过后台或直接访问更新）
- （如提供）整站/单栏目/单页的“静态生成”入口：在后台的“发布/生成/测试HTML”等菜单中。

## 模板与样式
前台模板位于 `web/`：
- `web/css`、`web/js`：通用资源
- `web/tpl/*`：区块化模板（导航、页头、页脚、Banner、产品/新闻/详情/留言等多套方案）

你可以在“网站栏目”中将栏目与模板进行绑定，或直接在模板中使用 `common.asp` 提供的函数输出链接与内容。

## 多语言支持
- 默认简体中文（`cn`），内置英文（`en`）与繁体（`ft`）
- 英文字段使用 `en_` 前缀，繁体通过简繁转换函数 `jtToft()` 输出
- URL 可带 `?language=en/ft`，静态模式会按规则处理语言参数

## 数据库
支持 Access 与 SQL Server：
- Access 默认库：`/data/data.mdb`
- SQL Server 可在 `inc/Config.Asp` 中配置连接参数（主机、端口、库名、账号密码）

表前缀默认为 `xy_`，可在 `inc/Config.Asp` 配置。

## 安全与运维
- 后台登录安全：
  - 允许登录错误次数限制
  - 同账号同 IP 限制
  - 后台登录允许 IP 白名单（`admin/Admin_Login_Allow_IP.dat`）
- 系统日志与统计：后台 `system` 与 `iislog` 模块
- 数据库备份：后台 `system/backupDatabase.asp` 与 `admin/app/database`

## 常用功能清单
- 导航/栏目管理、单页、新闻、产品、下载、案例、标签、留言板
- 上传中心（图片/视频/文本/Excel/IIS 日志）
- RSS 与 Sitemap 生成
- 多语言与 SEO 字段（标题/关键词/描述）
- 静态/动态 URL 自适应

## 常见问题（FAQ）
### 后台默认账号是什么？
默认账号密码：`admin / admin`。建议首次登录后立即修改。

### 如何开启纯静态 HTML？
后台 → 设置 → 网站设置 → “网站动静转换” → 选择“静态”。如需整站批量生成，请使用后台“发布/生成”相关功能。

### 首页访问优先级如何？
IIS 默认文档优先 `index.html`，若存在静态首页，将自动优先展示。

### 如何切换数据库？
在 `inc/Config.Asp` 中将 `databaseType` 设置为 `access` 或 `sqlserver` 并配置对应连接参数。

### 如何固定域名？
在 `inc/Config.Asp` 设置 `pubWebSite="https://你的域名/"`，系统将统一输出指定主域的绝对地址。

## 参与贡献
欢迎提 PR 与 Issue：
- Bug 修复与安全加固
- 新模板与区块
- 静态生成与发布流程优化
- 多语言与 SEO 方案改进

## 授权与版权
本项目为开源项目，作者信息与版权声明见源代码头部注释与官网说明。使用前请遵循相关协议与法律法规。

## 相关链接
- 官网：<http://www.xiyueta.com/xiyuetacms/>
- 演示站：<http://demo.xiyueta.com/>
- 演示后台：<http://demo.xiyueta.com/admin/>
- 更多模板：<http://www.xiyueta.com/case>
