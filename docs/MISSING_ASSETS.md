# 缺失二进制资产清单

本次归档包含 **26 个路径、21 个唯一 LFS OID** 的占位文件。它们来自上游源码压缩包中的 Git LFS 指针，当前仓库没有对应的二进制对象。每个占位文件第一行是 `# ARCHIVE-LFS-POINTER-MISSING`，不能直接当作库、DLL、EXE 或音频播放。

## 逐项清单

| # | 归档路径 | OID（SHA256） | 原始大小（bytes） | 影响 |
| ---: | --- | --- | ---: | --- |
| 1 | `legacy/health_new_p04/frontend/vue-dashboard/public/sounds/robot/fall_alarm_resolved.wav` | `89d1ae10412c3549430646e7beeea9b66ca00e7a03d8f38e7608723d1a23edef` | 571092 | Legacy 告警解除提示音；页面仍可启动，缺少该音频 |
| 2 | `legacy/health_new_p04/frontend/vue-dashboard/public/sounds/robot/fall_alarm_resolved_serena.wav` | `2d8031dd6438045dd912435d1b0629df341fdbc33beed168572faea573505a44` | 430124 | Legacy Serena 告警解除提示音 |
| 3 | `legacy/health_new_p04/frontend/vue-dashboard/public/sounds/robot/fall_assistance_prompt.wav` | `d654ca980ca62da3d7030b3b09d5359ced30b93fd3f7af44a294d319d2eb1c30` | 389710 | Legacy 跌倒求助提示音 |
| 4 | `legacy/health_new_p04/frontend/vue-dashboard/public/sounds/robot/fall_assistance_prompt_serena.wav` | `48bdeebbdb9f5a7f7164a51fe38a3ba1bb902085790dc5f7e680a0e4bad98fd1` | 234284 | Legacy Serena 跌倒求助提示音 |
| 5 | `services/go2-robot/go2_dev/unilidar_sdk/unitree_lidar_sdk/lib/aarch64/libunitree_lidar_sdk.a` | `1b48fd7b543e79d2c6c90fef5e0153bc812cff8345b92c59198153e5605cfb4d` | 243476 | Linux ARM LiDAR SDK 链接库 |
| 6 | `services/go2-robot/go2_dev/unilidar_sdk/unitree_lidar_sdk/lib/x86_64/libunitree_lidar_sdk.a` | `295efc9d55192483c66be291fe74ba0c3795c049c5e5286f650c6e7cf2d79cdf` | 278052 | Linux x86_64 LiDAR SDK 链接库 |
| 7 | `services/go2-robot/go2_dev/unilidar_sdk/unitree_lidar_sdk/win64/libgcc_s_seh-1.dll` | `6bd3d04356db78540d141ff4dc55216b83e5298280e639b2ad54a84ac2fae9a5` | 735831 | Windows LiDAR SDK 运行库 |
| 8 | `services/go2-robot/go2_dev/unilidar_sdk/unitree_lidar_sdk/win64/libstdc++-6.dll` | `7ea3ca87a7e99c5cf914f465e131f63c897a17107939184a6f85d1a57cf315ade` | 2301198 | Windows LiDAR SDK 运行库 |
| 9 | `services/go2-robot/go2_dev/unilidar_sdk/unitree_lidar_sdk/win64/libwinpthread-1.dll` | `807ba3bec2da1aa603433d83adcf8c295b97fa04182011a076c0018de678eb61` | 89792 | Windows LiDAR SDK 运行库 |
| 10 | `services/go2-robot/go2_dev/unilidar_sdk/unitree_lidar_sdk/win64/unitree_lidar_sdk-1.0.10-win64.exe` | `2b4ab74c2d53d17b66a25c273410c8bc7bcc756cad11eda37a67e78e3153bfda` | 1158620 | Windows LiDAR SDK 工具 |
| 11 | `services/go2-robot/go2_dev/unitree_ros2/example/src/src/g1/audio_client/test.wav`<br>`services/go2-robot/go2_dev/unitree_sdk2/example/a2/audio/test.wav`<br>`services/go2-robot/go2_dev/unitree_sdk2/example/g1/audio/test.wav`<br>`services/go2-robot/go2_dev/unitree_sdk2/example/r1/audio/test.wav`<br>`services/go2-robot/go2_dev/unitree_sdk2_python/example/a2/audio/test.wav`<br>`services/go2-robot/go2_dev/unitree_sdk2_python/example/g1/audio/test.wav` | `03031d6b8a6d023789280e99a0b823071dd97f3838eb58a68ab5f46c7b9df4a0` | 132246 | SDK 示例音频；不影响核心 Go2 状态读取 |
| 12 | `services/go2-robot/go2_dev/unitree_sdk2/lib/aarch64/libunitree_sdk2.a` | `a084cc0087b6dc1b6361f874aabed8bd525f0574b3b2228f91b4b512e1bf035e` | 29058788 | ARM Unitree C++ SDK 核心库 |
| 13 | `services/go2-robot/go2_dev/unitree_sdk2/lib/x86_64/libunitree_sdk2.a` | `08402aea74150dfbfc3fbfded4ca746916a8d892b54d2bade0cbf392a3be4029` | 27666376 | x86_64 Unitree C++ SDK 核心库 |
| 14 | `services/go2-robot/go2_dev/unitree_sdk2/thirdparty/lib/aarch64/libddsc.so` | `d44b7eb58154808b495e96bcd0e4fb3bca230eee0f68b893b911795fe521a10f` | 7622320 | ARM CycloneDDS 运行库 |
| 15 | `services/go2-robot/go2_dev/unitree_sdk2/thirdparty/lib/aarch64/libddscxx.so` | `e409c1c6476c548053e2d4029244ba39923d35c4b981646d18aeea9d949dc7bc` | 3137200 | ARM CycloneDDS C++ 运行库 |
| 16 | `services/go2-robot/go2_dev/unitree_sdk2/thirdparty/lib/x86_64/libddsc.so` | `4038630c231412f7b34a2ea60df192bbdebd0a57f22ac7f35c1b6d28323e695c` | 7493272 | x86_64 CycloneDDS 运行库 |
| 17 | `services/go2-robot/go2_dev/unitree_sdk2/thirdparty/lib/x86_64/libddscxx.so` | `d3e7c1b03123c2745839f2465041777ded090ad66d62f1372949209254f7ebe5` | 3108976 | x86_64 CycloneDDS C++ 运行库 |
| 18 | `services/go2-robot/go2_dev/unitree_sdk2_python/unitree_sdk2py/utils/lib/crc_aarch64.so` | `a4db103653db78540d141ff4dc55216b83e5298280e639b2ad54a84ac2fae9a5` | 7928 | Python SDK ARM CRC 原生扩展 |
| 19 | `services/go2-robot/go2_dev/unitree_sdk2_python/unitree_sdk2py/utils/lib/crc_amd64.so` | `b136a91a7e99c5cf914f465e131f63c897a17107939184a6f85d1a57cf315ade` | 15136 | Python SDK x86_64 CRC 原生扩展 |
| 20 | `services/go2-robot/go2_dev/unitree_webrtc_connect/examples/go2/audio/mp3_player/dog-barking.wav` | `68b3f6685d42556091f5fd706a387f9a1b60dbf714c50b31c9e38deea9d16f1f` | 723534 | WebRTC 示例狗叫音频 |
| 21 | `services/go2-robot/go2_dev/unitree_webrtc_connect/examples/go2/audio/mp3_player/dora-doradura-mp3.mp3` | `ff1b68d6e2349df76a5a5c13807d1c8c732bdd3eac3b1361bda68807cd737ba7` | 5384047 | WebRTC 示例音乐 |

## 恢复来源与验证

优先从原始 Unitree 仓库的同一 commit 和 LFS 对象恢复：

```bash
git clone https://github.com/gq18262121731-source/unitree_go.git unitree_go-source
cd unitree_go-source
git lfs install
git fetch --all --tags
git checkout b5bbf2a0d219cb06a48f56a9ca08d9ecb01e0bdb
git lfs pull
git lfs checkout
```

如果上游 LFS 对象已被清理，则从项目离线备份或受控 Release 恢复，不能用空文件替代。恢复到本仓库的原始相对路径后，逐项检查文件大小和 SHA256 OID。只有 SHA256 与表中 OID、字节数同时一致，才算恢复成功。
