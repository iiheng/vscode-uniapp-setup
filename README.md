# VSCode UniApp Setup

这个项目提供了一套快速配置 VSCode 进行 UniApp 开发的工具和设置。它包含了必要的配置文件、代码片段和自动化脚本，帮助开发者快速搭建 UniApp 开发环境。

## 特性

- 预配置的 VSCode 设置，优化 UniApp 开发体验
- 自定义的 Vue3 UniApp 代码片段
- ESLint 和 Prettier 配置，确保代码质量和一致性
- TypeScript 配置文件
- 自动化安装脚本，快速设置开发环境（支持 Unix/Linux 和 Windows）

## 快速开始

要使用这个配置，请按照以下步骤操作：

1. 确保你的系统已安装 [Node.js](https://nodejs.org/) (推荐 v14.0.0 或更高版本) 和 npm。

2. 在你的项目目录中运行以下命令：

### Unix/Linux/macOS 用户

```bash
curl -O https://raw.githubusercontent.com/iiheng/vscode-uniapp-setup/main/scripts/setup.sh
chmod +x setup.sh
./setup.sh
```

### Windows 用户

在 PowerShell 中运行以下命令：

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/iiheng/vscode-uniapp-setup/main/scripts/setup.ps1" -OutFile "setup.ps1"
.\setup.ps1
```

这些脚本会：

- 下载所有必要的配置文件
- 安装所需的 npm 包
- 设置 ESLint 和 Prettier
- 配置 TypeScript

3. 脚本运行完成后，重启 VSCode 以应用新的设置。

## 文件结构

```
vscode-uniapp-setup/
├── .vscode/
│   ├── settings.json            # VSCode 设置
│   └── vue3-uniapp.code-snippets # Vue3 UniApp 代码片段
├── scripts/
│   ├── setup.sh                 # Unix/Linux/macOS 自动化设置脚本
│   └── setup.ps1                # Windows 自动化设置脚本
├── .gitignore                   # Git 忽略文件
├── .prettierrc.json             # Prettier 配置
├── tsconfig.json                # TypeScript 配置
├── .eslintrc.js                 # ESLint 配置
└── README.md                    # 本文件
```

## 自定义

你可以根据自己的需求修改以下文件：

- `.vscode/settings.json`: 调整 VSCode 设置
- `.vscode/vue3-uniapp.code-snippets`: 添加或修改代码片段
- `.prettierrc.json`: 自定义 Prettier 格式化规则
- `.eslintrc.js`: 调整 ESLint 规则
- `tsconfig.json`: 修改 TypeScript 编译选项

## 推荐的 VSCode 扩展

为了获得最佳的开发体验，我们推荐安装以下 VSCode 扩展：

- [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (Vue 3 支持)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [UniApp Snippets](https://marketplace.visualstudio.com/items?itemName=mrmaoddxxaa.create-uniapp-view)

## 使用方法

安装完成后，你可以使用以下 npm 脚本：

- `npm run lint`: 运行 ESLint 检查并自动修复问题
- `npm run format`: 使用 Prettier 格式化 src/目录下的文件

## UniApp 开发最佳实践

1. 使用 TypeScript 来获得更好的类型检查和代码提示。
2. 遵循 Vue 3 的组合式 API 写法，提高代码的可读性和可维护性。
3. 使用 ESLint 和 Prettier 保持代码风格的一致性。
4. 充分利用 VSCode 的代码片段功能，提高开发效率。
5. 经常查阅[UniApp 官方文档](https://uniapp.dcloud.io/)，了解最新的 API 和最佳实践。

## 常见问题 (FAQ)

Q: 为什么我的 ESLint 报错？
A: 确保你已经正确安装了所有的依赖，并且 ESLint 配置文件(.eslintrc.js)存在于项目根目录。

Q: 如何添加自定义的代码片段？
A: 你可以编辑 `.vscode/vue3-uniapp.code-snippets` 文件来添加自己的代码片段。

## 版本历史

- v1.0.0 (2023-08-01): 初始版本发布
- v1.1.0 (2023-08-15): 添加 Windows 支持

## 贡献

欢迎提交问题和改进建议！如果你想贡献代码，请先开一个 issue 讨论你想改变的内容。

## 支持

如果你在使用过程中遇到任何问题，可以通过以下方式获得支持：

1. 在 GitHub 上提交[Issue](https://github.com/iiheng/vscode-uniapp-setup/issues)
2. 发送邮件至：your-email@example.com

## 许可证

[MIT](https://choosealicense.com/licenses/mit/)

## 致谢

感谢所有为这个项目做出贡献的开发者。特别感谢 UniApp 和 Vue.js 社区的支持。
