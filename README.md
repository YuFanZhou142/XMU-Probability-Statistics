# XMU-Probability-Statistics

这是一个围绕“随机变量的计算机产生”展开的概率统计课程设计项目，面向厦门大学通信工程专业《概率统计》课程。项目使用 MATLAB 完成 4 个实验任务，包括均匀随机数生成、Rayleigh 分布模拟、高斯分布模拟以及离散随机变量模拟。

这次整理的目标不是简单保存作业文件，而是把原始课程提交材料重构成一个更标准、更清晰、可复现的 GitHub 项目。

## 项目内容

项目围绕以下 4 个实验任务展开：

1. 使用 Wichmann-Hill 算法生成 `(0,1)` 均匀分布随机数，并检查均匀性与独立性。
2. 使用逆变换法生成 Rayleigh 分布随机变量，并对不同 `sigma` 的分布形态进行可视化。
3. 使用 Box-Muller 方法生成高斯分布随机变量，并与理论正态分布曲线进行对比。
4. 根据给定离散分布律生成离散随机变量，并比较理论概率与实验频率。

## 当前仓库结构

```text
.
├─ archive/
│  └─ original_submission/
│     ├─ code/                  原始 MATLAB 作业脚本
│     └─ code.rar               原始压缩包
├─ docs/
│  ├─ original_submission/
│  │  ├─ 自学内容安排.docx       原始作业要求
│  │  └─ 课程设计报告.docx       原始实验报告
│  └─ 项目分析.md               项目现状分析与整理说明
├─ results/
│  └─ figures/                  运行脚本后生成的图片结果
├─ scripts/
│  ├─ run_all_tasks.m
│  ├─ task1_wichmann_hill_uniform.m
│  ├─ task2_rayleigh_inverse_transform.m
│  ├─ task3_gaussian_box_muller.m
│  └─ task4_discrete_random_variable.m
├─ src/
│  ├─ ensure_directory.m
│  ├─ generate_discrete_samples.m
│  ├─ generate_gaussian_box_muller.m
│  ├─ generate_rayleigh_samples.m
│  ├─ generate_wichmann_hill.m
│  └─ normal_pdf_local.m
├─ .gitignore
└─ README.md
```

## 与原始仓库相比做了什么整理

本次整理主要做了下面几件事：

1. 把原始的压缩包、文档、脚本从根目录拆分到独立目录中。
2. 保留原始提交材料，避免课程作业内容丢失。
3. 把原先零散的 MATLAB 脚本重构为“任务入口 + 可复用函数”的形式。
4. 新增统一入口 `scripts/run_all_tasks.m`，便于一次性复现实验。
5. 为任务 2、3、4 固定随机种子，提升可复现性。
6. 去掉对 `normpdf` 的工具箱依赖，改用本地实现的正态密度函数。
7. 增加 `results/figures/` 目录，用于保存实验图片结果。
8. 新增中文分析文档，方便在 GitHub 上直接阅读项目内容。

## 运行环境

- MATLAB
- 已在本机 `D:\matlab\bin\matlab.exe` 环境下进行验证

## 运行方式

### 方式一：运行全部任务

在 MATLAB 中进入仓库根目录后执行：

```matlab
addpath('scripts');
run_all_tasks();
```

### 方式二：单独运行某个任务

```matlab
addpath('scripts');
task1_wichmann_hill_uniform();
task2_rayleigh_inverse_transform();
task3_gaussian_box_muller();
task4_discrete_random_variable();
```

## 输出结果

脚本运行后，会自动将图片保存到：

```text
results/figures/
```

当前整理后的脚本会生成以下结果图：

1. `task1_histograms.png`
2. `task1_scatter.png`
3. `task2_rayleigh.png`
4. `task3_gaussian.png`
5. `task4_discrete.png`

## 原始材料说明

如果你需要查看最初提交给课程作业的原貌，可以直接看下面两个目录：

1. `archive/original_submission/`
2. `docs/original_submission/`

这样既保留了原始作业痕迹，也让整理后的项目结构更适合 GitHub 展示和后续维护。

## 说明

本项目仅用于课程学习、实验复现与个人整理展示，请勿直接照搬作为课程作业提交。
