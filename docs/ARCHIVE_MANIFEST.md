# 封存清单

## 源仓库快照

封存日期：2026-11-14

| 来源 | Commit SHA | 归档位置 | 说明 |
| --- | --- | --- | --- |
| `https://github.com/gq18262121731-source/unitree_go` | `b5bbf2a0d219cb06a48f56a9ca08d9ecb01e0bdb` | `services/go2-robot`、`apps/flutter-mobile`、`legacy/health_new_p04` | Go2、Flutter、旧系统 |
| `https://github.com/leroymocian27-ux/Vision-Module` | `f52ce69c7e6d315cc0690367fa538158deb82a27` | `services/vision-module` | 视频、跌倒检测、二分类、VLM |
| `https://github.com/gq18262121731-source/ai_world_static_system` | `2743187caf064c211a1c8c2979ca9674f14cbf4c` | `apps/static-platform` | Vue 3/Vite + FastAPI 用户端 |

## 内容关系

- `ai_world_static_system` 未发现 Flutter。
- `health_new_p02/mobile/flutter_app` 与 `health_new_p04/mobile/flutter_app` 不完全一致。
- p04 增加了 Go2 UWB companion 页面、仓库、模型和测试文件，因此 p04 保存为 `apps/flutter-mobile`，p02 保存为 `legacy/original-flutter`。
- `legacy/health_new_p04/mobile/flutter_app` 仍随旧主系统完整保留，便于恢复原始相对路径。

## 校验清单生成

仓库已提交一份按 Git 跟踪文件生成的校验清单，位于 `docs/generated/SHA256SUMS.txt`；LFS 文件这里记录的是 LFS 指针文件校验值，实际对象由 Git LFS 校验。需要重新生成时执行：

```powershell
New-Item -ItemType Directory -Force docs/generated | Out-Null
git -c core.quotePath=false ls-files | ForEach-Object { Get-FileHash -Algorithm SHA256 -LiteralPath $_ } |
  ForEach-Object { '{0}  {1}' -f $_.Hash, $_.Path } |
  Set-Content docs/generated/SHA256SUMS.txt -Encoding UTF8
```

提交前应再次检查：

```powershell
git status --short
rg -n --hidden --glob '!**/.git/**' 'BEGIN .*PRIVATE KEY|AKIA[0-9A-Z]{16}|sk-[A-Za-z0-9]{20,}' .
```

## 大文件与许可

模型权重、视频、ROS bag、数据库和设备密钥不应直接作为普通 Git 文件提交。当前根目录 `.gitattributes` 为常见模型/视频/压缩包提供 LFS 规则；如果文件受许可限制或体积过大，应放到 Git LFS、Release 附件或受控备份，并在这里补充外部位置和 SHA256。三个上游仓库的许可证状态需要在公开发布前人工确认。

本次上游源码归档中有 21 个二进制文件本身已经是 Git LFS 指针文件，下载的源码压缩包没有对应 LFS 对象（`git lfs fsck` 会报告 missing object）。为保证公开仓库可克隆，这些 133 字节指针文本按普通文本提交；实际二进制需要从原始仓库 LFS、Release 或离线备份恢复，不能把指针误当成可执行库或音频文件。

