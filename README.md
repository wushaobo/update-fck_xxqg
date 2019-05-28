## 目的

感谢这款著名的"成年人学刁工具" `https://github.com/fuck-xuexiqiangguo/Fuck-XueXiQiangGuo`

这里贡献一个为 **Mac** 用户写的脚本，用以自动化完成下载 app.asar 更新包、校验sha256、部署到 app 里的目标位置替换旧文件。

## 准备

### 运行环境
- `Mac OS X`
- `Bash` 命令行执行

### 依赖项

- `jq`，命令行里高效处理json的工具
- `openssl`，用以方便地计算文件的 sha256

### 脚本可执行权限

通过 git 拿到的脚本文件权限就是可执行的，但如果你单独下载或复制粘贴，记得添上文件的可执行权限。

```
chmod +x ./update_asar.sh
```

## 约定

app 解压安装在目录里，而不是系统的 Applications 目录（只是懒得 sudo 或做可配置）

```
update-fck_xxqg
    ├── LICENSE
    ├── README.md
    ├── fuck-xuexiqiangguo.app
    │   └── Contents
    │       ├── Frameworks
    │       ├── Info.plist
    │       ├── MacOS
    │       ├── PkgInfo
    │       └── Resources
    └── update_asar.sh
```

## 运行

执行脚本的当前工作目录位置无关紧要

```
RIGHT/PATH/TO/update_asar.sh
```
