# 恢复说明

## 从 GitHub 恢复

```powershell
git clone https://github.com/gq18262121731-source/zhimai-eldercare-archive.git zhimai-eldercare-archive
Set-Location .\zhimai-eldercare-archive
.\launcher\check-env.bat
```

当前公开归档不包含可用的 LFS 对象；缺失的 26 个路径（21 个唯一 OID）按 [`MISSING_ASSETS.md`](MISSING_ASSETS.md) 从原始仓库 LFS 或离线备份恢复。不要执行 `git lfs pull` 后就直接认为恢复完整。

恢复后先按 `MISSING_ASSETS.md` 对二进制逐项检查大小和 SHA256，再按 `docs/ACCEPTANCE.md` 验收各模块。

## 按模块恢复

1. 用户端：按 `docs/STARTUP.md` 启动 `apps/static-platform/start.bat`。
2. Flutter：安装 Flutter SDK，进入 `apps/flutter-mobile` 执行 `flutter pub get`。
3. Vision：安装与原仓库匹配的 Python/CUDA/ONNX 环境，恢复模型到 `services/vision-module/models`。
4. Go2：在 Ubuntu/WSL 或机器人主机恢复 ROS、CycloneDDS、Unitree SDK 和网络接口，先做只读检查。
5. Legacy：进入 `legacy/health_new_p04`，按原 `README.md`、`setup.md` 和 `scripts` 恢复，不与展示模式混用端口。

## 换电脑或换 Wi-Fi

```powershell
.\launcher\set-network-ip.bat
```

该脚本只会读取当前 Wi-Fi/热点 IPv4 并生成统一配置参考 `configs/local.env`，不会自动改写三个模块内部配置，也不会修改网卡地址。需要连接局域网时，再把值复制到对应模块的本地 `.env`；不要把 `configs/local.env` 提交到 GitHub。机器人有线网段和移动 Wi-Fi 网段可能不同，Go2 的 `UNITREE_ROBOT_IP` 应以现场探测结果为准。

## 无法恢复时的排查顺序

1. 执行 `launcher/check-env.bat`，确认工具和关键文件存在。
2. 检查端口是否被旧进程占用。
3. 检查本地 `.env` 是否从 `.env.example` 创建且没有真实密钥缺失。
4. 对比 `ARCHIVE_MANIFEST.md` 的 SHA256。
5. 再检查模型、摄像头、ROS/DDS 和硬件连接。

