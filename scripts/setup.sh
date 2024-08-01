#!/bin/bash

# 设置GitHub仓库信息
REPO_OWNER="iiheng"
REPO_NAME="vscode-uniapp-setup"
BRANCH="main"

# 创建必要的目录
mkdir -p .vscode

# 下载.vscode文件夹下的文件
curl -o .vscode/settings.json https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/.vscode/settings.json
curl -o .vscode/vue3-uniapp.code-snippets https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/.vscode/vue3-uniapp.code-snippets

# 下载配置文件
curl -o .eslintrc.js https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/.eslintrc.js
curl -o .prettierrc.json https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/.prettierrc.json
curl -o tsconfig.json https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/tsconfig.json

# 下载.gitignore文件
curl -o .gitignore https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$BRANCH/.gitignore

# 检查是否已经初始化了npm项目
if [ ! -f package.json ]; then
    echo "Initializing npm project..."
    npm init -y
fi

# 安装开发依赖
echo "Installing development dependencies..."
npm i -D @uni-helper/uni-app-types miniprogram-api-typings @types/node
npm i -D prettier
npm i -D eslint eslint-plugin-vue @rushstack/eslint-patch @vue/eslint-config-typescript @vue/eslint-config-prettier

# 添加scripts到package.json
npm pkg set scripts.lint="eslint . --ext .vue,.js,.jsx,.cjs,.mjs,.ts,.tsx,.cts,.mts --fix --ignore-path .gitignore"
npm pkg set scripts.format="prettier --write src/"

echo "Setup complete! Your VSCode UniApp development environment is ready."
echo "You may need to restart VSCode to apply all settings."
echo "Remember to customize the downloaded configuration files according to your project needs."
