# 使用示例：用户认证系统开发

这是一个完整的使用 Claude Code 自定义命令系统开发用户认证系统的示例。

## 开发流程演示

### 第一步：需求分析

```bash
# 启动 Claude Code
claude

# 执行需求分析
/ask 设计一个支持JWT的用户认证系统，包含用户注册、登录、密码重置、权限验证等功能，需要支持多种登录方式（邮箱、手机号），包含安全防护措施（限制登录次数、密码强度验证等）
```

**预期输出**：
- 系统架构设计文档
- API 接口规范
- 数据库设计
- 安全策略
- 技术栈选择理由
- 文件保存到：`docs/user_auth_system_technical_spec.md`

### 第二步：代码实现

```bash
# 基于技术文档生成代码（记得开启 Plan 模式：shift+tab）
/code @docs/user_auth_system_technical_spec.md 基于技术方案文档实现用户认证系统的完整后端代码
```

**预期输出**：
- Controller 层：认证相关的 REST API
- Service 层：业务逻辑实现
- Repository 层：数据访问层
- Model 层：数据模型定义
- Utils 层：JWT 工具类、密码加密等
- 配置文件：数据库配置、应用配置
- 错误处理：统一异常处理机制

### 第三步：测试用例生成

```bash
# 生成全面的测试用例
/test @docs/user_auth_system_technical_spec.md 为用户认证系统生成完整的测试用例
```

**预期输出**：
- 单元测试：每个方法的独立测试
- 集成测试：API 接口的端到端测试
- 安全测试：SQL注入、XSS防护测试
- 性能测试：并发登录、压力测试
- 边界测试：异常输入、边界条件测试

**具体测试场景**：
- ✅ 正常用户注册流程
- ✅ 邮箱格式验证
- ✅ 密码强度验证
- ✅ 用户名重复检查
- ✅ 正常登录流程
- ✅ 错误密码处理
- ✅ 账号锁定机制
- ✅ JWT token 生成和验证
- ✅ 权限验证功能
- ✅ 密码重置流程
- ✅ 并发登录限制
- ✅ SQL 注入防护
- ✅ 暴力破解防护

### 第四步：代码审查

```bash
# 全面的代码质量检查
/review @docs/user_auth_system_technical_spec.md 对用户认证系统进行全面的代码审查
```

**可能的审查发现**：

#### 🔴 严重问题（必须修复）
- 密码采用明文存储 → 需要使用 bcrypt 加密
- JWT 密钥硬编码 → 需要使用环境变量
- 缺少 SQL 注入防护 → 需要使用参数化查询
- 错误信息泄露敏感信息 → 需要统一错误处理

#### 🟡 警告问题（应该修复）
- 缺少请求频率限制 → 添加 rate limiting
- 密码强度验证不够 → 增强密码复杂度要求
- 缺少登录日志记录 → 添加审计日志
- 数据库查询可以优化 → 添加索引和查询优化

#### 🔵 建议改进（考虑优化）
- 可以添加双因子认证
- 可以支持 OAuth2 第三方登录
- 可以实现单点登录 (SSO)
- 可以添加用户行为分析

### 第五步：性能优化

```bash
# 针对性能问题进行优化
/optimize @docs/user_auth_system_technical_spec.md 对用户认证系统进行性能优化
```

**优化措施**：
- 数据库查询优化：添加用户表的邮箱和用户名索引
- 缓存机制：JWT token 黑名单缓存
- 连接池优化：数据库连接池配置
- 并发处理：异步处理用户注册邮件发送
- 算法优化：密码验证算法优化

### 第六步：代码重构

```bash
# 代码结构优化
/refactor @docs/user_auth_system_technical_spec.md 对用户认证系统进行代码重构优化
```

**重构改进**：
- 应用策略模式：多种登录方式的策略封装
- 工厂模式：JWT token 生成器工厂
- 装饰器模式：权限验证装饰器
- 责任链模式：认证过程的责任链
- 代码复用：提取公共的验证逻辑
- 接口抽象：认证服务接口化

## 最终成果

经过完整的工作流程，你将得到：

### 1. 完整的技术文档
- `docs/user_auth_system_technical_spec.md` - 技术规格文档
- `docs/test_plan.md` - 测试计划文档
- `docs/performance_optimization.md` - 性能优化报告
- `docs/refactoring_report.md` - 重构报告

### 2. 高质量的代码实现
```
src/
├── controllers/
│   ├── auth.controller.js      # 认证相关 API
│   └── user.controller.js      # 用户管理 API
├── services/
│   ├── auth.service.js         # 认证业务逻辑
│   ├── user.service.js         # 用户业务逻辑
│   └── jwt.service.js          # JWT 处理服务
├── repositories/
│   └── user.repository.js      # 用户数据访问
├── models/
│   └── user.model.js           # 用户数据模型
├── middleware/
│   ├── auth.middleware.js      # 认证中间件
│   └── validation.middleware.js # 输入验证中间件
├── utils/
│   ├── password.util.js        # 密码加密工具
│   └── validation.util.js      # 验证工具
└── config/
    ├── database.js             # 数据库配置
    └── jwt.js                  # JWT 配置
```

### 3. 全面的测试覆盖
```
tests/
├── unit/
│   ├── auth.service.test.js
│   ├── user.service.test.js
│   └── jwt.service.test.js
├── integration/
│   ├── auth.api.test.js
│   └── user.api.test.js
├── security/
│   ├── sql-injection.test.js
│   └── xss-protection.test.js
└── performance/
    └── concurrent-login.test.js
```

### 4. 部署和运行配置
- 数据库迁移脚本
- Docker 配置文件
- 环境变量模板
- CI/CD 配置

## 工作流程优势

1. **标准化流程**：确保每个环节都不被遗漏
2. **文档驱动**：保证代码与需求的一致性
3. **质量保证**：通过审查和测试确保代码质量
4. **持续改进**：通过优化和重构提升代码质量
5. **团队协作**：标准化的流程便于团队协作

## 时间估算

对于一个中等复杂度的用户认证系统：
- 需求分析：10-15 分钟
- 代码实现：15-20 分钟
- 测试用例生成：10-15 分钟
- 代码审查：5-10 分钟
- 优化重构：10-15 分钟

**总计：50-75 分钟完成从需求到高质量代码的完整流程**

相比传统开发方式，效率提升约 **60-80%**，同时保证了更高的代码质量和更完整的文档。
