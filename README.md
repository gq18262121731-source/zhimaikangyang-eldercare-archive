# 智脉康养完整技术成果封存仓库

本仓库用于**冻结、保存、展示和恢复**已有的智脉康养技术成果。它是一个 Monorepo 归档，不是重新开发的统一运行时，也不宣称三个系统已经完成实时联动。

## 先看这里：如何启动

在 Windows PowerShell 中进入仓库根目录：

```powershell
Set-Location E:\unitree\zhimai-eldercare-archive
.\launcher\check-env.bat
.\launcher\start-demo.bat
```

`start-demo.bat` 只启动用户端静态演示系统，适合第一次检查封存内容。浏览器通常会打开：

- 用户端：`http://127.0.0.1:5173`
- 后端 API：`http://127.0.0.1:8080/docs`

查看完整命令、端口冲突和真实设备限制，请阅读 [`docs/STARTUP.md`](docs/STARTUP.md)。换 Wi-Fi 后先执行：

```powershell
.\launcher\set-network-ip.bat
```

该脚本会显示当前移动 Wi-Fi 地址，并写入未跟踪的 `configs/local.env`；不会改写原始模块源码。

## 目录

```text
apps/static-platform/       用户端静态演示系统（Vue 3/Vite + FastAPI）
apps/flutter-mobile/        p04 Flutter 移动端快照（含 Go2 UWB 伴随界面）
services/vision-module/     视频、跌倒检测、二分类和 VLM 服务
services/go2-robot/         Go2 网关、UWB、WebRTC、ROS/SDK 代码
legacy/health_new_p04/      旧主系统，完整冻结
legacy/original-flutter/    p02 Flutter 历史快照
launcher/                   外层启动、检查、停止和网络配置入口
configs/                    非敏感配置模板和本机配置说明
docs/                       架构、启动、清单和恢复文档
```

## 三个源仓库

| 模块 | 来源 | 封存 Commit |
| --- | --- | --- |
| 用户端静态系统 | [ai_world_static_system](https://github.com/gq18262121731-source/ai_world_static_system) | `2743187caf064c211a1c8c2979ca9674f14cbf4c` |
| 视频视觉系统 | [Vision-Module](https://github.com/leroymocian27-ux/Vision-Module) | `f52ce69c7e6d315cc0690367fa538158deb82a27` |
| Go2/Flutter/旧系统 | [unitree_go](https://github.com/gq18262121731-source/unitree_go) | `b5bbf2a0d219cb06a48f56a9ca08d9ecb01e0bdb` |

三个上游仓库当前没有清晰的 SPDX 许可证声明。公开发布前请确认源码、模型、视频和第三方 SDK 的再分发权限；在确认前建议将新仓库设为 Private。

## 运行边界

- 静态系统、视觉服务、Flutter 和 Go2 网关仍保留各自依赖环境。
- 不强行合并 Python、Node、Flutter、CUDA、ROS 环境。
- `start-all.bat` 不会自动让真实机器狗运动；真实模式必须人工按 Go2 原始文档逐项检查。
- 视觉仓库当前安全演示默认是 Binary-First；目标摄像头校准和正式验收仍需现场完成。
- 静态页面中的模拟数据不能当作实时检测结果。

## 归档状态

本地归档完成后，按 [`docs/ARCHIVE_MANIFEST.md`](docs/ARCHIVE_MANIFEST.md) 记录文件数量、校验值和外部模型备份位置。跨电脑恢复按 [`docs/RECOVERY.md`](docs/RECOVERY.md) 执行。

缺失二进制的逐项 OID、大小、影响和恢复方法见 [`docs/MISSING_ASSETS.md`](docs/MISSING_ASSETS.md)；当前已执行与尚未执行的验收状态见 [`docs/ACCEPTANCE.md`](docs/ACCEPTANCE.md)。

