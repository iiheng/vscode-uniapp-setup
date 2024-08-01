# setup.ps1

# 设置GitHub仓库信息
$RepoOwner = "iiheng"
$RepoName = "vscode-uniapp-setup"
$Branch = "main"

# 创建必要的目录
New-Item -ItemType Directory -Force -Path .vscode | Out-Null

# 下载.vscode文件夹下的文件
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/.vscode/settings.json" -OutFile ".vscode/settings.json"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/.vscode/vue3-uniapp.code-snippets" -OutFile ".vscode/vue3-uniapp.code-snippets"

# 下载配置文件
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/.eslintrc.js" -OutFile ".eslintrc.js"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/.prettierrc.json" -OutFile ".prettierrc.json"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/tsconfig.json" -OutFile "tsconfig.json"

# 下载.gitignore文件
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/.gitignore" -OutFile ".gitignore"

# 检查是否已经初始化了npm项目
if (-not (Test-Path package.json)) {
    Write-Host "Initializing npm project..."
    npm init -y
}

# 安装开发依赖
Write-Host "Installing development dependencies..."
npm i -D @uni-helper/uni-app-types miniprogram-api-typings @types/node
npm i -D prettier
npm i -D eslint eslint-plugin-vue @rushstack/eslint-patch @vue/eslint-config-typescript @vue/eslint-config-prettier

# 添加scripts到package.json
npm pkg set scripts.lint="eslint . --ext .vue,.js,.jsx,.cjs,.mjs,.ts,.tsx,.cts,.mts --fix --ignore-path .gitignore"
npm pkg set scripts.format="prettier --write src/"

Write-Host "Setup complete! Your VSCode UniApp development environment is ready."
Write-Host "You may need to restart VSCode to apply all settings."
Write-Host "Remember to customize the downloaded configuration files according to your project needs."
