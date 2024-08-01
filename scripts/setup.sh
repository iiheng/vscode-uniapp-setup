  #!/bin/bash

  # 设置GitHub仓库信息
  REPO_OWNER="iiheng"
  REPO_NAME="vscode-uniapp-setup"
  CLONE_DIR="temp_vscode-uniapp-setup"

  # 克隆仓库
  echo "Cloning repository..."
  git clone "https://github.com/$REPO_OWNER/$REPO_NAME.git" "$CLONE_DIR"

  if [ -d "$CLONE_DIR" ]; then
      # 移动文件
      echo "Moving files..."
      for item in "$CLONE_DIR"/*; do
          if [ -d "$item" ] && [ "$(basename "$item")" != ".git" ]; then
              # 如果是目录（不是.git），创建目标目录（如果不存在）并复制内容
              dir_name=$(basename "$item")
              mkdir -p "$dir_name"
              cp -R "$item"/* "$dir_name"
          elif [ -f "$item" ] && [ "$(basename "$item")" != "README.md" ]; then
              # 如果是文件（不是README.md），直接复制
              cp "$item" .
          fi
      done

      # 删除克隆的目录
      echo "Cleaning up..."
      rm -rf "$CLONE_DIR"
  else
      echo "Failed to clone repository. Please check your internet connection and try again."
      exit 1
  fi

  # 检查是否已经初始化了npm项目
  if [ ! -f "package.json" ]; then
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