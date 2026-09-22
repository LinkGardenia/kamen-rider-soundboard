<<<<<<< HEAD
一个整合了大部分假面骑士的变身系统，帮助每位骑士随时随地变身！HenShin！
=======
# 🎭 假面骑士变身音效板 (Kamen Rider Soundboard)

> Flutter 跨平台移动端应用 · ZZZ 复古潮流风格 UI · 收录 20 部 TV 系列 60+ 假面骑士

[![Flutter](https://img.shields.io/badge/Flutter-3.2+-02569B?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android-blue)]()

---

## 📱 应用预览

| 假面骑士系统 | 形态选择 | 音效面板 |
|:---:|:---:|:---:|
| TV系列列表 + 搜索 + 收藏 | 骑士形态选择 | ZZZ胶囊按钮 + 变身 |

---

## ✨ 功能特性

- 🎨 **5 套可切换主题**：ZZZ 复古潮流 / 赛博朋克 / 昭和复古 / 平成经典 / 令和未来
- 📺 **CRT 扫描线特效**：ZZZ 风格电视美学叠加层
- 💊 **胶囊形状按钮**：粗黑偏移阴影 + 故障闪烁 + 脉冲动画
- 🔍 **智能搜索**：支持 TV 系列名 / 骑士名模糊搜索，直接跳转
- ⭐ **收藏功能**：持久化收藏常用骑士，横向滚动栏快速进入
- 📥 **音效下载**：8 个扩展音效包，在线下载更多骑士音效
- 👆 **完整流程**：TV系列 → 骑士 → 形态 → 变身按钮 → 播放音效

---

## 🏗️ 架构

```
lib/
├── main.dart                     # 应用入口
├── models/                       # TVSeries, KamenRider, RiderForm, SoundEffect
├── data/                         # sound_repository (20部TV数据), download_registry
├── theme/                        # 5套主题 + ThemeManager
│   └── themes/                   # zzz, neo_cyber, showa_retro, heisei_classic, reiwa_future
├── providers/                    # AudioProvider, FavoritesProvider, DownloadProvider
├── screens/
│   ├── main_scaffold.dart        # 底部3Tab: 系统/下载/设置
│   ├── system/                   # 主页→骑士列表→形态选择→音效面板
│   ├── download/                 # 音效下载页
│   └── settings/                 # 设置 + 主题选择
├── widgets/                      # ZZZCapsuleButton, CRTOverlay, 卡片, 搜索, 收藏
└── utils/                        # 常量, 音频管理器
```

---

## 🚀 快速开始

### 环境要求

- Flutter SDK >= 3.2.0
- Visual Studio 2022 (Windows 桌面开发) - 仅 Windows 构建需要
- Android Studio + Android SDK - 仅 Android 构建需要

### 三步构建

```bash
# 1. 克隆仓库
git clone https://github.com/LinkGardenia/kamen-rider-soundboard.git
cd kamen-rider-soundboard

# 2. 一键构建（推荐）
.\scripts\build_all.ps1

# 或手动分步：
flutter pub get
.\scripts\generate_assets.ps1    # 生成占位图片
.\scripts\download_resources.ps1 # 从网络下载音效/图片（交互式）
.\scripts\setup_windows.ps1      # 添加 Windows 平台支持
flutter build windows --release  # 构建 .exe
flutter build apk --release      # 构建 .apk
```

### 输出位置

| 平台 | 输出路径 |
|------|---------|
| 🖥️ **Windows .exe** | `build/windows/x64/runner/Release/kamen_rider_soundboard.exe` |
| 📱 **Android APK** | `build/app/outputs/flutter-apk/app-release.apk` |

---

## 📥 从网络下载音效和图片

### 音效来源：Voicemod Tuna

| 步骤 | 操作 |
|------|------|
| 1 | 打开 https://tuna.voicemod.net/ |
| 2 | 搜索 `kamen rider henshin` / `kamen rider belt` 等关键词 |
| 3 | 将下载的 `.mp3` 放入 `assets/sounds/{系列id}/{骑士id}/` |
| 4 | 或运行 `.\scripts\download_resources.ps1 -Sounds` 自动引导 |

### 图片来源：HiClipart

| 步骤 | 操作 |
|------|------|
| 1 | 打开 https://www.hiclipart.com/ |
| 2 | 搜索各骑士名（如 `Kamen Rider Kuuga`），下载透明 PNG |
| 3 | 放入 `assets/images/riders/` 按骑士 ID 命名 |
| 4 | 或运行 `.\scripts\download_resources.ps1 -Images` 自动引导 |

### 音效文件命名规则

```
assets/sounds/{系列id}/{骑士id}/
├── henshin.mp3       # 变身音效
├── hissatsu.mp3      # 必杀技
├── belt.mp3          # 腰带音效
├── weapon.mp3        # 武器音效
└── lines.mp3         # 经典台词
```

---

## 🎨 主题切换

5 套主题可在「设置 → 界面主题」中切换：

| 主题 | 风格 | 特效 |
|------|------|------|
| 🔥 ZZZ 复古潮流 | 街头涂鸦 · CRT 电视 | CRT扫描线 + 故障闪烁 |
| 💚 赛博朋克 | 霓虹灯管 · 全息投影 | 故障艺术 + 粒子 |
| ❤️ 昭和复古 | 经典特摄 · 颗粒胶片 | — |
| 💜 平成经典 | 炫彩渐变 · 科技感 | 粒子特效 |
| 💛 令和未来 | 极简科技 · HUD | 粒子特效 |

---

## 📋 收录作品

### 平成系列
| 年代 | 作品 | 骑士数 |
|------|------|:--:|
| 2000-2001 | 假面骑士空我 | 1 |
| 2002-2003 | 假面骑士龙骑 | 4 |
| 2003-2004 | 假面骑士555 | 1 |
| 2004-2005 | 假面骑士剑 | 1 |
| 2007-2008 | 假面骑士电王 | 1 |
| 2009 | 假面骑士Decade | 1 |
| 2009-2010 | 假面骑士W | 1 |
| 2010-2011 | 假面骑士OOO | 1 |
| 2011-2012 | 假面骑士Fourze | 1 |
| 2012-2013 | 假面骑士Wizard | 1 |
| 2013-2014 | 假面骑士铠武 | 1 |
| 2014-2015 | 假面骑士Drive | 1 |
| 2016-2017 | 假面骑士Ex-Aid | 1 |
| 2017-2018 | 假面骑士Build | 1 |
| 2018-2019 | 假面骑士Zi-O | 1 |

### 令和系列
| 年代 | 作品 | 骑士数 |
|------|------|:--:|
| 2019-2020 | 假面骑士Zero-One | 1 |
| 2020-2021 | 假面骑士Saber | 1 |
| 2021-2022 | 假面骑士Revice | 2 |
| 2022-2023 | 假面骑士Geats | 1 |
| 2023-2024 | 假面骑士Gotchard | 1 |

---

## ⚠️ 版权声明

本应用为粉丝向开源项目，仅供学习交流使用。

- 所有假面骑士相关版权归**东映株式会社**所有
- 音效资源请自行从合法渠道获取
- 禁止用于任何商业用途

---

## 📄 License

MIT License - 详见 [LICENSE](LICENSE)
>>>>>>> 9323bfb (Add README, placeholder images, and asset generation script)
