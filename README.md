# In-Network Inference Mechanisms for Programmable Switches
## 项目介绍

本项目的主要目标是研究`Transformer`模型能否嵌入可编程交换机的数据面，并验证其可行性。通过使用 P4 语言编写代码，并在 BMv2 仿真平台上进行实现，探索如何在网络设备的处理路径中实现加速 Transformer 模型推理。该研究旨在证明即使在硬件资源有限的环境下，也可以通过在交换机中嵌入深度学习模型，提升网络的智能化处理能力。

## 安装与运行
### 环境配置
配置p4的开发环境，系统选择ubuntu20.4，具体配置步骤见我的另一个[p4环境配置](https://github.com/carry3688/p4_environment/blob/main/README.md)仓库。

### 运行项目

在设置好 P4 开发环境并安装必要的依赖项后，按照以下步骤运行项目。

#### 1. 克隆仓库

首先，克隆包含项目代码的仓库：

```bash
git clone https://github.com/carry3688/transformer8.git
cd transformer8
```

#### 2. 构建网络拓扑与编译运行

```bash
make run
```


#### 3. 测试代码

```bash
mininet> h1 python3 sendall.py
```

#### 4. 分析结果

实验结束，查看`log`和`pcap`文件夹的实验结果。

### 实验测试
本实验测试了量化策略对于部署在数据面上的模型的准确度的影响，具体使用到的一些模型参数以及数据集详见我的另一个[整合仓库](https://github.com/carry3688/transformer8_integration)


### 其他说明

- **网络拓扑：** 本项目使用 Mininet 配置简单的网络拓扑，并与 BMv2 交换机结合进行深度学习模型推理的验证。
- **故障排除：** 如果在运行过程中遇到问题，可以查看 `log` 文件中的详细错误信息，并参考 P4 和 BMv2 的官方文档进行调试。
