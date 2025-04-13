# Nix-Darwin 配置

此仓库包含我的个人 Nix-Darwin 配置，使用 Nix 以声明式方式管理我的 macOS 系统和用户环境。它利用 `nix-darwin` 进行系统级设置，并使用 `home-manager` 进行用户特定配置，确保开发环境的可重现性和一致性。

## 特性

*   **声明式系统管理**: 使用 Nix-Darwin 管理 macOS 系统设置、应用程序和服务。
*   **可重现的用户环境**: 使用 Home Manager 配置用户特定的工具、点文件和应用程序。
*   **Neovim 配置**: 包含 `nix4nvchad` 用于管理 NvChad (Neovim) 配置。
*   **包管理**: 利用 Nixpkgs 提供广泛的软件包。
*   **Homebrew 集成**: 与 Homebrew 集成，用于 Nixpkgs 中不可用的软件包。

## 先决条件

*   [Nix](https://nixos.org/download.html)
*   [Nix-Darwin](https://nix-darwin.org/)

## 安装

1.  **克隆仓库**:
    ```bash
    git clone https://github.com/your-username/nix-darwin-config.git ~/.config/nix-darwin
    cd ~/.config/nix-darwin
    ```
    *(注意: 如果您有不同的首选位置，请替换 `~/.config/nix-darwin`。)*

2.  **激活配置**:
    ```bash
    darwin-rebuild switch --flake ~/.config/nix-darwin#jaign-mac
    ```
    *(注意: `jaign-mac` 是 `flake.nix` 中定义的系统名称。如果您的系统名称不同，请进行调整。)*

## 使用

本项目使用 `just` 来执行常见任务。请确保您已安装 `just` (`nix-shell -p just` 或 `brew install just`)。

*   **`just f`**: 使用 `alejandra` 格式化 Nix 文件。
    ```bash
    just f
    ```

*   **`just a`**: 将所有更改添加到 Git 暂存区。
    ```bash
    just a
    ```

*   **`just b`**: 构建并切换到新的 Nix-Darwin 配置。这等同于 `darwin-rebuild switch --flake .#jaign-mac --ask`。
    ```bash
    just b
    ```

*   **`just c "您的提交信息"`**: 使用提供的消息提交暂存的更改。
    ```bash
    just c "feat: add new package"
    ```

## 项目结构

*   `flake.nix`: 主 Nix flake 定义，指定输入和输出。
*   `justfile`: 定义用于管理配置的便捷命令。
*   `homes/`: 包含用于用户特定设置的 Home Manager 配置。
*   `lib/`: 包含配置中使用的 Nix 实用函数。
*   `packages/`: 此仓库中定义的自定义 Nix 包。
*   `systems/`: 包含 Nix-Darwin 系统配置。
