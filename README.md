# DevOps Maven Service & Helm

基于 Spring Boot + Kubernetes + Helm + Jenkins 的云原生持续交付工程。

## 目录结构

```text
devops-maven-service-helm/
├── java/               # Java (Spring Boot) 后端工程与 Docker 构建
│   ├── src/            # 业务源代码及单元测试
│   ├── pom.xml         # Maven 依赖与构建配置
│   ├── Dockerfile      # 容器镜像构建文件
│   └── mvnw*           # Maven Wrapper
│
├── helm/               # Helm Chart Kubernetes 应用编排
│   ├── Chart.yaml      # Chart 元数据
│   ├── values.yaml     # 部署配置参数定义
│   └── templates/      # K8s 资源清单模板 (Deployment, Service, Ingress)
│
├── deploy/             # CI/CD 持续交付配置
│   ├── Jenkinsfile     # Jenkins Pipeline 流水线定义
│   └── rbac.yaml       # K8s ServiceAccount 及 RBAC 权限配置
│
├── doc/                # 项目架构与 Helm 详细说明文档
│   ├── README.md       # Helm 与 Kubernetes 详细使用手册
│   └── assets/         # 架构图与演示截图
│
└── README.md           # 本说明文件
```

## 核心流程说明

1. **Java 构建**：基于 `java/` 目录执行 Maven 编译打包及单元测试。
2. **镜像构建**：基于 `java/Dockerfile` 配合 Kaniko 将产物构建并推送到容器镜像仓库。
3. **应用部署**：使用 Helm 渲染 `helm/` 目录中的 Kubernetes 编排文件，执行原子升级（Atomic Upgrade）与自动回滚支持。

详细教程与配置说明请参见 [doc/README.md](doc/README.md)。
