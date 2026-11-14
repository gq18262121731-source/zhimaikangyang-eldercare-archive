# 恢复说明

## 从 GitHub 恢复

```powershell
git clone <ARCHIVE_REPOSITORY_URL> zhimai-eldercare-archive
Set-Location .\zhimai-eldercare-archive
git lfs install
git lfs pull
.\launcher\check-env.bat
```

如果仓库使用 Git LFS，先确认大文件指针已经下载；如果模型、视频或 ROS bag 存在于 Release/外部备份，则按 `docs/ARCHIVE_MANIFEST.md` 的校验值恢复到原模块路径。

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

然后把 `configs/local.env` 中的值复制到需要连接局域网的模块本地 `.env`；不要把 `configs/local.env` 提交到 GitHub。机器人有线网段和移动 Wi-Fi 网段可能不同，Go2 的 `UNITREE_ROBOT_IP` 应以现场探测结果为准。

## 无法恢复时的排查顺序

1. 执行 `launcher/check-env.bat`，确认工具和关键文件存在。
2. 检查端口是否被旧进程占用。
3. 检查本地 `.env` 是否从 `.env.example` 创建且没有真实密钥缺失。
4. 对比 `ARCHIVE_MANIFEST.md` 的 SHA256。
5. 再检查模型、摄像头、ROS/DDS 和硬件连接。

