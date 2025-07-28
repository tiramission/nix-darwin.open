
## 先决条件

*   [Nix](https://nixos.org/download.html)
*   [Nix-Darwin](https://nix-darwin.org/)


## 重要提示

你需要创建一个存放 secrets 信息的 flake 仓库，使用此方式配置后，**<spand color="red">永远</span>** 不要将此 flake 构建至公开 store 存储库
这个 flake 仓库需要以下信息

```nix
{
  outputs = _: {
    gh-token = builtins.readFile ./texts/gh-token.txt;
    configs = {
      frpc = ./files/frpc.toml;
      attic = ./files/attic.toml;
    };
  };
}
```

- `configs` : 内容可以根据 mtools 模块进行调整
- `gh-token` : GithubPAT，将配置 nix 的 token 以便于本地 `nix flake update` 拉去此仓库 