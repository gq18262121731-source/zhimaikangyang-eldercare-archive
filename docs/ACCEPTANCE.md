# 封存验收记录

状态含义：`PASS` 表示本次已执行并通过；`BLOCKED` 表示需要硬件、外部资产或授权条件；`NOT_TESTED` 表示只完成静态检查，未启动真实模块。

| 验收项 | 状态 | 证据与范围 |
| --- | --- | --- |
| 三个源仓库 Commit 记录 | PASS | `docs/ARCHIVE_MANIFEST.md` 已记录三个来源与 SHA |
| Monorepo 目录和关键入口 | PASS | `launcher/check-env.ps1` 已检查静态、Vision、Go2、Flutter、Legacy 路径 |
| PowerShell 启动器语法 | PASS | `launcher/*.ps1` 统一解析通过 |
| Wi-Fi IP 参考配置脚本 | PASS | `set-network-ip.ps1 -IpAddress 127.0.0.1` 已生成并验证 `configs/local.env`；未验证真实热点联调 |
| GitHub Public 仓库推送 | PASS | 远程 `main` 已建立，封存版本由 `archive-v1.0.0` 固定 |
| SHA256 清单本地复算 | PASS | `docs/generated/SHA256SUMS.txt` 复算结果 `checksum_bad=0` |
| 干净克隆后 SHA256 复算 | PASS | 临时干净克隆共检查 5877 个文件，`checksum_bad=0`；清单排除 `docs/generated/` 自身 |
| 静态平台实际启动 | NOT_TESTED | 本次只做路径和启动脚本检查，未启动服务窗口 |
| Flutter p04 构建/运行 | NOT_TESTED | 已确认 `pubspec.yaml` 和源码存在，未执行 `flutter run` |
| Flutter p02 历史快照构建/运行 | NOT_TESTED | 已归档，未执行构建 |
| Vision 模型推理 | NOT_TESTED | 需要 CUDA/模型/摄像头或回放素材 |
| Go2 真实设备连接 | BLOCKED | 本次没有连接 Go2；部分 Unitree/ROS/LiDAR 二进制对象缺失，见 `MISSING_ASSETS.md` |
| 新电脑完整恢复 | NOT_TESTED | 已验证文档和清单，未在第二台机器完成端到端恢复 |

`PASS` 只代表对应验收范围完成，不代表三个系统已经实现实时联动，也不代表真实机器狗运动链路已获准运行。
