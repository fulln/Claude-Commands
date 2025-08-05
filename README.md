# Claude Code 自定义命令系统

基于 Claude Code 官方斜杠命令系统的自定义开发工作流程命令集合，实现从需求分析到代码优化的完整自动化流程。

## 🚀 快速开始

### 安装 Claude Code
```bash
# 安装 Claude Code
npm install -g @anthropic-ai/claude-code

# 进入项目目录
cd your-project

# 启动 Claude Code
claude
```

### 使用自定义命令
```bash
# 复制命令文件到项目或用户目录
cp -r .claude/commands/ your-project/.claude/
# 或者复制到用户全局目录
cp -r .claude/commands/ ~/.claude/
```

## 📋 核心工作流程

```
需求分析 (/ask) → 代码实现 (/code) → 测试用例 (/test) → 代码审查 (/review) → 优化调整 (/optimize, /refactor)
```

每个环节都有明确的输入输出，支持自动化执行。

## 🛠️ 命令详解

### `/ask` - 需求分析和架构设计
**作用**: 把模糊的业务需求转化为技术文档，进行系统性的架构分析。

**使用场景**:
```bash
/ask 设计一个支持千万级用户的电商平台的微服务架构
/ask 用户认证系统，包含JWT、登录、注册、密码重置功能
```

**输出内容**:
- 系统边界定义
- 技术栈选择理由  
- 非功能性需求分析
- 潜在风险点识别
- 详细的技术文档（保存到 `docs/` 目录）

### `/code` - 从文档到代码实现
**作用**: 基于文档内容生成具体的、完整的、可运行的代码。

**使用场景**:
```bash
/code @docs/user_auth_spec.md 基于技术方案文档生成认证系统代码
/code @docs/payment_system.md 实现支付模块
```

**重要提示**: **请务必开启 Plan 模式 (shift+tab)** 以获得更好的实现效果。

**工作机制**:
- 读取 `docs/` 目录下的需求文档
- 分析现有代码库结构
- 生成符合项目规范且与现有系统兼容的代码

### `/test` - 测试用例生成
**作用**: 基于需求文档自动生成测试用例，覆盖单元测试、集成测试、边界条件测试。

**使用场景**:
```bash
/test @docs/user_auth_spec.md 基于技术方案文档生成单元测试
/test 支付系统全面测试
```

**自动生成测试类型**:
- 单元测试（每个方法）
- 集成测试（API接口）
- 安全测试（注入攻击防护）
- 性能测试（并发场景）

### `/review` - 文档与代码一致性检查
**作用**: 对比需求文档和实际代码，检查代码质量和安全问题。这是整个流程中**最关键的一环**。

**使用场景**:
```bash
/review @docs/user_auth_spec.md 基于技术方案文档检查代码是否符合要求
/review 全面代码质量检查
```

**检查内容**:
- 验证性能和可扩展性
- 识别架构偏离
- 安全漏洞检测
- 代码质量评估

### `/optimize` - 性能问题优化
**作用**: 主要处理性能问题，当 `/review` 发现性能相关问题后使用。

**使用场景**:
```bash
/optimize @docs/user_auth_spec.md 优化认证系统性能
/optimize 数据库查询性能优化
```

**优化内容**:
- 算法复杂度优化
- 资源使用优化
- 并发处理优化
- 缓存策略调整

### `/refactor` - 代码结构重构
**作用**: 主要处理代码结构问题，当 `/review` 发现架构或可维护性问题后使用。

**使用场景**:
```bash
/refactor @docs/user_auth_spec.md 基于技术方案文档重构代码结构
/refactor 微服务架构重构
```

**重构内容**:
- 设计模式应用
- 代码复用性提升
- 可维护性改进
- 技术债务清理

## 📁 文件结构

```
.claude/
├── commands/           # 自定义命令目录
│   ├── ask.md         # 需求分析命令
│   ├── code.md        # 代码实现命令
│   ├── test.md        # 测试生成命令
│   ├── review.md      # 代码审查命令
│   ├── optimize.md    # 性能优化命令
│   └── refactor.md    # 代码重构命令
└── README.md          # 说明文档

docs/                  # 生成的技术文档目录
├── *_technical_spec.md  # 技术规格文档
├── test_plan.md        # 测试计划
├── performance_optimization.md  # 性能优化报告
└── refactoring_report.md       # 重构报告
```

## 🎯 实际开发案例：用户认证系统

### 第一步：需求分析
```bash
/ask 设计支持JWT的用户认证系统，包含登录、注册、密码重置功能
```
**输出**: API接口设计、数据库表结构、安全策略、错误处理机制等文档

### 第二步：代码实现  
```bash
/code @docs/user_auth_spec.md 实现用户认证系统的后端API
```
**生成**: 完整的后端代码，包括Controller层、Service层、Repository层、JWT工具类、异常处理

### 第三步：测试用例
```bash
/test @docs/user_auth_spec.md 用户认证功能的全面测试
```
**自动生成**: 单元测试、集成测试、安全测试、性能测试

### 第四步：代码审查
```bash
/review @docs/user_auth_spec.md 用户认证模块代码审查
```
**检查结果可能包括**: 密码加密强度、请求频率限制、错误信息安全、数据库查询优化等

### 第五步：问题修复
```bash
/optimize @docs/user_auth_spec.md 用户认证API性能优化
/refactor @docs/user_auth_spec.md 用户认证代码结构优化
```
**针对性修复**: review发现的问题进行修复和优化

## 🔧 命令特性

### 参数支持
- **文档引用**: 使用 `@docs/filename.md` 引用技术文档
- **动态参数**: 使用 `$ARGUMENTS` 传递自定义参数
- **文件引用**: 使用 `@filepath` 引用特定文件

### 权限控制
每个命令都配置了合适的工具权限：
- **读取权限**: `Read`, `Grep`, `Glob`
- **编辑权限**: `Edit`, `MultiEdit`, `Write` 
- **执行权限**: `Bash` (受限命令)

### 模型配置
所有命令默认使用 `sonnet` 模型，确保高质量输出。

## 📚 最佳实践

### 1. 工作流程规范
- 严格按照 ask → code → test → review → optimize/refactor 的顺序执行
- 每个环节都要基于前一环节的输出进行工作
- 保持文档与代码的一致性

### 2. 文档管理
- 所有技术文档统一保存在 `docs/` 目录
- 使用描述性的文件名
- 定期更新和维护文档

### 3. 版本控制
- 将 `.claude/commands/` 目录加入版本控制
- 团队共享自定义命令
- 记录命令的变更历史

### 4. 安全考虑
- 审查命令的权限配置
- 避免在命令中包含敏感信息
- 定期检查和更新安全策略

## 🤝 团队协作

### 项目级命令
将命令文件放在项目的 `.claude/commands/` 目录下，团队成员共享使用。

### 个人级命令  
将命令文件放在用户的 `~/.claude/commands/` 目录下，个人使用。

### 命令优先级
项目级命令优先于个人级命令，确保团队规范的一致性。

## 📖 扩展阅读

- [Claude Code 官方文档](https://docs.anthropic.com/en/docs/claude-code/overview)
- [自定义命令文档](https://docs.anthropic.com/en/docs/claude-code/slash-commands)
- [子代理系统](https://docs.anthropic.com/en/docs/claude-code/sub-agents)

## 🔄 更新日志

- **v1.0.0**: 初始版本，包含完整的6个核心命令
- 支持完整的开发工作流程
- 基于 Claude Code 官方斜杠命令系统

---

**提示**: 这个命令系统旨在提升开发效率，确保代码质量，减少重复工作。建议团队成员熟悉整个工作流程，充分利用自动化能力。
