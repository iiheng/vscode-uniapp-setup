  # setup.ps1

  # 设置GitHub仓库信息
  $RepoOwner = "iiheng"
  $RepoName = "vscode-uniapp-setup"
  $CloneDir = "temp_vscode-uniapp-setup"

  # 克隆仓库
  Write-Host "Cloning repository..."
  git clone "https://github.com/$RepoOwner/$RepoName.git" $CloneDir

  if (Test-Path $CloneDir) {
      # 移动文件
      Write-Host "Moving files..."
      Get-ChildItem -Path $CloneDir -Exclude .git,README.md | ForEach-Object {
          if ($_.PSIsContainer) {
              # 如果是目录，创建目标目录（如果不存在）并复制内容
              $destDir = Join-Path -Path $PWD -ChildPath $_.Name
              if (!(Test-Path $destDir)) {
                  New-Item -ItemType Directory -Path $destDir | Out-Null
              }
              Copy-Item -Path "$($_.FullName)\*" -Destination $destDir -Recurse -Force
          } else {
              # 如果是文件，直接复制
              Copy-Item -Path $_.FullName -Destination $PWD -Force
          }
      }

      # 删除克隆的目录
      Write-Host "Cleaning up..."
      Remove-Item -Path $CloneDir -Recurse -Force
  } else {
      Write-Host "Failed to clone repository. Please check your internet connection and try again."
      exit
  }

  # 检查是否已经初始化了npm项目
  if (-not (Test-Path package.json)) {
      Write-Host "Initializing npm project..."
      npm init -y
  }

  # 安装开发依赖
  Write-Host "Installing development dependencies..."
  try {
      npm i -D @uni-helper/uni-app-types miniprogram-api-typings @types/node
      npm i -D prettier
      npm i -D eslint eslint-plugin-vue @rushstack/eslint-patch @vue/eslint-config-typescript @vue/eslint-config-prettier

      # 添加scripts到package.json
      npm pkg set scripts.lint="eslint . --ext .vue,.js,.jsx,.cjs,.mjs,.ts,.tsx,.cts,.mts --fix --ignore-path .gitignore"
      npm pkg set scripts.format="prettier --write src/"

      Write-Host "Setup complete! Your VSCode UniApp development environment is ready."
      Write-Host "You may need to restart VSCode to apply all settings."
      Write-Host "Remember to customize the downloaded configuration files according to your project needs."
  }
  catch {
      Write-Host "An error occurred during npm installation: $_"
  }