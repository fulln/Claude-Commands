#!/bin/bash

# Claude Code 自定义命令系统安装脚本

echo "🚀 Claude Code 自定义命令系统安装器"
echo "======================================="

# 检查 Claude Code 是否已安装
if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code 未安装，请先安装："
    echo "   npm install -g @anthropic-ai/claude-code"
    exit 1
fi

echo "✅ Claude Code 已安装"

# 询问安装类型
echo ""
echo "请选择安装类型："
echo "1) 项目级安装 (推荐用于团队协作)"
echo "2) 用户级安装 (个人使用)"
echo ""
read -p "请输入选择 (1 或 2): " choice

case $choice in
    1)
        # 项目级安装
        if [ ! -d ".claude" ]; then
            mkdir -p .claude
        fi
        cp -r .claude/commands .claude/
        echo "✅ 项目级安装完成"
        echo "📁 命令已安装到: $(pwd)/.claude/commands/"
        echo "🔄 团队成员可以通过 git 共享这些命令"
        ;;
    2)
        # 用户级安装
        if [ ! -d "$HOME/.claude" ]; then
            mkdir -p "$HOME/.claude"
        fi
        cp -r .claude/commands "$HOME/.claude/"
        echo "✅ 用户级安装完成"
        echo "📁 命令已安装到: $HOME/.claude/commands/"
        echo "🌐 这些命令在所有项目中都可用"
        ;;
    *)
        echo "❌ 无效选择，退出安装"
        exit 1
        ;;
esac

echo ""
echo "🎉 安装完成！"
echo ""
echo "📚 可用命令："
echo "   /ask     - 需求分析和架构设计"
echo "   /code    - 从文档到代码实现"
echo "   /test    - 测试用例生成"
echo "   /review  - 代码审查"
echo "   /optimize - 性能优化"
echo "   /refactor - 代码重构"
echo ""
echo "🚀 使用方法："
echo "   1. 运行 'claude' 启动 Claude Code"
echo "   2. 使用 '/help' 查看所有可用命令"
echo "   3. 开始你的开发工作流程："
echo "      /ask 你的需求描述"
echo ""
echo "📖 更多信息请查看 README.md"
