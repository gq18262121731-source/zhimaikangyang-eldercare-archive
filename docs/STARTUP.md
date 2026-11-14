# 启动手册

所有命令默认从仓库根目录 `zhimai-eldercare-archive` 执行。Windows 命令使用 PowerShell；Linux/ROS/Go2 命令请进入对应模块原目录执行。

## 1. 环境检查

```powershell
.\launcher\check-env.bat
```

最低要求：Git、Python 3.10+、Node.js 18+、Flutter（移动端需要）、PowerShell。视觉 GPU、ROS、Unitree SDK、CUDA 和 Docker 只在对应模块启动时需要。

## 2. 演示模式：只启动用户端

```powershell
.\launcher\start-demo.bat
```

等价于调用：

```powershell
Set-Location .\apps\static-platform
.\start.bat
```

服务端口：前端 `5173`，后端 `8080`。停止可执行：

```powershell
.\launcher\stop-all.bat
```

第一次启动会创建 `apps/static-platform/backend/.venv`、安装依赖、复制 `.env.example` 并安装前端依赖，耗时取决于网络。生成的虚拟环境、数据库、日志和 `node_modules` 不提交 Git。

## 3. 视觉服务

先进入服务目录，复制配置模板并按现场情况填写：

```powershell
Set-Location .\services\vision-module
Copy-Item .env.example .env -ErrorAction SilentlyContinue
```

安全演示（会使用仓库原有安全配置）：

```powershell
.\scripts\start_safe_demo.ps1 -HostName 0.0.0.0 -Port 8011
```

GPU 运行：

```powershell
.\scripts\start_visual_gpu.ps1 -HostName 0.0.0.0 -Port 8000
```

原脚本默认带有历史机器路径时，请通过 `-PythonPath` 指定当前 Python，例如：

```powershell
.\scripts\start_visual_gpu.ps1 -PythonPath C:\Tools\miniconda3\envs\vision\python.exe -Port 8000
```

打开 `http://127.0.0.1:8011/demo` 或对应端口。视觉服务与 Legacy 默认都使用 `8000`，两者不能同时占用同一端口。

## 4. Flutter 移动端

```powershell
Set-Location .\apps\flutter-mobile
flutter doctor
flutter pub get
flutter devices
flutter run
```

如需指定设备：`flutter run -d <device-id>`。移动端连接后端的地址、端口和平台配置沿用快照内原配置；换网络时先查看 `configs/local.env`，再按模块的 `.env.example` 或 Flutter 配置调整。

## 5. Go2 机器狗

### 只读网络与 UWB 检查（推荐）

```powershell
Set-Location .\services\go2-robot\go2_dev\tools
.\check_go2_network.ps1
```

进入 Ubuntu/WSL 后按原文档执行只读探针：

```bash
python3 tools/go2_read_only_status.py <robot_ethernet_interface> --seconds 15
```

UWB 只读检查示例：

```powershell
$env:PYTHONPATH = (Resolve-Path '..\unitree_sdk2_python').Path
python ..\tools\go2_uwb_readonly_probe.py --peer 192.168.123.161 --local-address 192.168.123.222 --seconds 30
```

### 网关 Mock 模式

```bash
cd services/go2-robot/go2_dev/go2-gateway
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
GO2_MODE=mock uvicorn app.main:app --host 0.0.0.0 --port 8090 --workers 1
```

### 真实模式

只有在 Go2 网络、DDS、设备状态和急停路径都已确认后才执行：

```bash
GO2_MODE=real GO2_NETWORK_INTERFACE=enp3s0 uvicorn app.main:app --host 0.0.0.0 --port 8090 --workers 1
```

保持 `FOLLOW_SIMULATION=true`、`FOLLOW_EXECUTION_ENABLED=false` 进行安全验证；真实运动必须人工设置独立的运动闸门。不要启动多个网关 worker。

## 6. Legacy 历史模式

Legacy 与当前静态平台复用部分常用端口，启动前先停止其他模块：

```powershell
Set-Location .\legacy\health_new_p04
Copy-Item .env.example .env -ErrorAction SilentlyContinue
.\scripts\start_server.ps1 -CondaEnv health -ListenHost 0.0.0.0 -Port 8000
```

另开 PowerShell 启动前端：

```powershell
Set-Location .\legacy\health_new_p04
.\scripts\start_frontend.ps1 -ListenHost 0.0.0.0 -Port 5173
```

完整旧栈、模型调试和机器人 Mock 命令仍以 `legacy/health_new_p04/scripts` 下的原文档为准。

## 7. 移动 Wi-Fi IP 一键配置

查看当前 Wi-Fi/热点地址并写入本机配置：

```powershell
.\launcher\set-network-ip.bat
```

也可以指定网卡和机器人地址：

```powershell
.\launcher\set-network-ip.bat -InterfaceAlias '移动热点' -RobotIp 192.168.123.161
```

脚本只会获取当前移动 Wi-Fi IPv4 并生成统一配置参考 `configs/local.env`（该文件被 `.gitignore` 排除），包含：

```text
HOST_IP=当前 Wi-Fi IPv4
STATIC_PLATFORM_HOST=当前 Wi-Fi IPv4
VISION_SERVICE_PUBLIC_BASE_URL=http://当前 Wi-Fi IPv4:8011
MAIN_SYSTEM_BASE_URL=http://当前 Wi-Fi IPv4:8080
UNITREE_ROBOT_IP=填写的 Go2 地址
```

它不会自动修改网卡，也不会改写 `apps/`、`services/` 或 `legacy/` 内的原始代码和 `.env.example`。模块启动时仍需把对应变量人工填入该模块自己的本地 `.env`；因此它是一键获取和生成参考配置，不是全模块自动网络配置。

