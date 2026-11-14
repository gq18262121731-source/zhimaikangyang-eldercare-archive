# 封存架构

## 定位

`zhimai-eldercare-archive` 采用 Monorepo 多模块封存架构。各模块保留原有内部目录、启动命令、配置引用和相对路径；根目录只提供归档说明、环境检查和外层入口。

```text
apps/static-platform  ── 用户端演示页面与 FastAPI
apps/flutter-mobile   ── Flutter 客户端快照
services/vision-module ── 摄像头/视频、跌倒检测、二分类、VLM
services/go2-robot    ── Go2 网关、UWB、WebRTC、ROS/SDK
legacy/health_new_p04 ── 旧主系统完整快照
```

## 模块边界

| 模块 | 归档位置 | 运行方式 | 当前边界 |
| --- | --- | --- | --- |
| 用户端静态系统 | `apps/static-platform` | 原 `start.bat` | 主要展示入口，包含模拟数据 |
| Flutter | `apps/flutter-mobile` | `flutter pub get` / `flutter run` | p04 移动客户端快照，含 Go2 UWB 伴随界面 |
| Original Flutter | `legacy/original-flutter` | `flutter pub get` / `flutter run` | p02 历史快照，保留与 p04 的差异 |
| Vision | `services/vision-module` | 原 `scripts/start_safe_demo.ps1` 或 GPU 启动脚本 | 需要独立 Python/CUDA/模型环境 |
| Go2 | `services/go2-robot/go2_dev` | 原网关、只读探针、ROS/SDK 命令 | 真实设备只读检查与运动链路分开 |
| Legacy | `legacy/health_new_p04` | 原 `scripts/start_*.ps1` | 冻结历史系统，和当前展示入口分开 |

## 不做的事情

本次封存不改业务代码、不把三个 API 改造成一个服务、不把模拟数据包装成真实数据、不自动启动真实运动。若需要新的实时联动，应从本仓库另开开发分支或新仓库。

## Flutter 判定

`ai_world_static_system` 不包含 Flutter。Unitree 仓库同时包含 p02 和 p04 两个 Flutter 快照；逐文件校验发现 p04 增加了 Go2 UWB 伴随功能，因此分别保存到 `legacy/original-flutter` 和 `apps/flutter-mobile`。

