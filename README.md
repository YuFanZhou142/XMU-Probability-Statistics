# XMU-Probability-Statistics

这是一个围绕“随机变量的计算机产生”展开的概率统计课程设计项目，面向厦门大学通信工程专业《概率统计》课程。项目使用 MATLAB 完成 4 个实验任务，包括均匀随机数生成、Rayleigh 分布模拟、高斯分布模拟以及离散随机变量模拟。

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
│     ├─ code/  
│     └─ code.rar   
├─ docs/
│  ├─ original_submission/
│  │  ├─ 自学内容安排.docx   
│  │  └─ 课程设计报告.docx   
│  └─ 项目分析.md           
├─ results/
│  └─ figures/                
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

## 运行环境

- MATLAB
- 已在本机环境下进行验证

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

## 说明

本项目仅用于课程学习、实验复现与个人整理展示，请勿直接照搬作为课程作业提交。
