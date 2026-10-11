# benjaminxu2023-glitch.github.io

Ben Xu 的个人工具站（GitHub Pages，main 分支根目录）：https://benjaminxu2023-glitch.github.io/

纯静态 HTML/CSS，没有框架、构建步骤或外部 CDN。

| 路径 | 内容 |
|---|---|
| `/index.html` | 首页 |
| `/quastat/index.html` | QuaStat 介绍 |
| `/quastat/app/index.html` | QuaStat 应用本体：与 QuaStat 仓库 main 分支的 `index.html` 逐字节相同 |
| `/quastat/img/` | 截图（用应用内置示例数据，在无头浏览器中截取） |

## 同步 QuaStat

QuaStat 源码仓库是私有的，这里只发布应用文件。

```bash
gh auth login                 # 需要能读取 benjaminxu2023-glitch/quastat
scripts/sync-quastat.sh       # 下载最新 main 的 index.html，覆盖 quastat/app/index.html，并打印 sha256
git add quastat/app/index.html && git commit -m "sync QuaStat <commit>" && git push
```

用 `QUASTAT_REF=<分支或 commit>` 可以指定版本。推送后 GitHub Pages 会自动重新部署。
