# Antigravity 2.0 简体中文汉化套件

将 Antigravity 2.0 的英文界面完整汉化为**简体中文（大陆用语）**，并支持**简体 / 繁体一键切换**。

本套件通过解包、注入、重打包本地 Electron ASAR 文件实现汉化，不修改官方核心二进制、不散布任何官方文件，全部操作在你的电脑本地完成。

> 本仓库基于 [workkkkkkez00m/antigravity2.0-zh-tw](https://github.com/workkkkkkez00m/antigravity2.0-zh-tw) 改造，在繁体汉化基础上新增简体中文支持与命令授权弹窗汉化。

---

## 功能特色

- 🌏 **简体中文（大陆）**：全部界面文案按大陆用语习惯翻译（设置、项目、文件、终端、刷新、全屏…）
- 🪟 **命令授权弹窗完整汉化**：任意命令（`gcc`、`python`、`git`、`node` 等）请求授权时，确认框标题与选项全部汉化，支持"仅本次 / 此对话 / 此项目 / 永久"四种授权作用域
- 🔀 **简体 / 繁体可选**：安装时自由选择，随时可切换
- 🖥️ **跨平台**：Windows 与 macOS
- 🛡️ **安全备份**：首次安装自动备份官方 `app.asar`，可一键还原
- 📦 **离线运行**：使用本地 `@electron/asar`，不依赖网络动态下载
- 🎯 **精准翻译**：自动避开代码编辑器、终端、输入框等不应翻译的区域

---

## 快速开始（Windows）

### 1. 安装依赖

需要先安装 [Node.js LTS](https://nodejs.org/)，然后在套件目录执行：

```cmd
npm install
```

> PowerShell 若被执行策略拦截，请改用命令提示符 cmd，或执行 `npm.cmd install`。

### 2. 安装汉化

1. **完全退出** Antigravity
2. 双击 `install-win.bat`
3. 选择语言：
   - 输入 `1`：安装**简体中文**
   - 输入 `2`（或直接回车）：安装**繁體中文**
4. 重新启动 Antigravity 即可看到中文界面

### 3. 切换语言

重复执行安装脚本，选择另一种语言即可，无需先还原。

---

## 快速开始（macOS）

```bash
cd <套件目录>
npm install
chmod +x install-macos.command
# 双击 install-macos.command，按提示选择简体或繁体
```

---

## 命令行方式

```bash
# 安装简体中文
node localization_engine.js --lang zh-CN

# 安装繁體中文
node localization_engine.js --lang zh-TW

# 指定 Antigravity 安装路径（默认自动检测）
node localization_engine.js --lang zh-CN --install-dir "你的安装路径"

# 还原官方原版
node localization_engine.js --restore
```

---

## 翻译范围

| 区域 | 说明 |
|------|------|
| 主界面 | 侧边栏、顶部导航、按钮与标签 |
| 设置页 | 完整设置面板、权限控制、子菜单 |
| Agent / Workspace | Agent 管理、工作区页面 |
| MCP / Knowledge | MCP 服务器与知识库页面 |
| 系统菜单 | 标题栏菜单（文件、编辑、查看、窗口、帮助） |
| 任务栏菜单 | 右键菜单、Agent 状态显示 |
| 启动画面 | 加载动画文字 |
| **命令授权弹窗** | **任意命令的确认标题与授权选项** |

目前简体字典共 **825 条**翻译词条。

### 不翻译区域

以下区域自动避开，避免干扰开发工作流：代码编辑器（Monaco）、终端、输入框、`<code>`/`<pre>` 代码块、SVG/Canvas、Debug Console 等。

---

## 目录结构

```
├── dicts/                 # 繁體中文（台灣）字典
├── dicts-zh-CN/           # 简体中文（大陆）字典
├── localization_engine.js # 汉化引擎（解包/注入/重打包）
├── install-win.bat        # Windows 安装脚本（含语言选择）
├── install-macos.command  # macOS 安装脚本（含语言选择）
├── restore-win.bat        # Windows 还原脚本
├── restore-macos.command  # macOS 还原脚本
└── package.json
```

---

## 常见问题

### Antigravity 更新后汉化消失了？

官方更新会覆盖 `app.asar`，这是正常现象。重新运行安装脚本即可恢复汉化。

### 如何还原官方原版？

双击 `restore-win.bat`（Windows）或 `restore-macos.command`（macOS），或执行 `node localization_engine.js --restore`。还原会使用首次安装时自动创建的 `app.asar.bak` 备份。

### 命令授权弹窗里为什么命令名还是英文？

命令文本（如 `gcc --version; g++ --version`）保留英文，保证与系统命令一致；标题与授权选项已全部汉化。

---

## 许可

本项目基于 [antigravity2.0-zh-tw](https://github.com/workkkkkkez00m/antigravity2.0-zh-tw)（Apache License 2.0 with Commons Clause）改造，`LICENSE` 保留原作者版权声明。

## 免责声明

- 非官方社区工具，与 Antigravity 官方无关
- 不包含、不散布 Antigravity 官方 `app.asar` 或任何官方二进制文件
- 修改本机应用资源存在风险，使用者自行承担
- 提供完整备份与还原机制
