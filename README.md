# AI Engineer Skills

A curated collection of **33 Agent Skills** for different programming languages, frameworks, and development workflows. Each skill is a `SKILL.md` file following the open [Agent Skills standard](https://agentskills.io/) — compatible with **both Claude Code and GitHub Copilot**.

## Compatibility

These skills use the **Agent Skills open standard** (`SKILL.md` format) which is supported across multiple AI coding agents:

| Agent | Project Skills | Personal Skills | Status |
|-------|---------------|-----------------|--------|
| **Claude Code** | `.claude/skills/` | `~/.claude/skills/` | Fully supported |
| **GitHub Copilot** (VS Code) | `.github/skills/` or `.claude/skills/` | `~/.copilot/skills/` or `~/.claude/skills/` | Fully supported |
| **GitHub Copilot CLI** | `.github/skills/` or `.claude/skills/` | `~/.copilot/skills/` | Fully supported |
| **Copilot Coding Agent** | `.github/skills/` or `.claude/skills/` | N/A (cloud-based) | Fully supported |

### SKILL.md format (shared standard)

Both Claude Code and GitHub Copilot use the same file format:

```markdown
---
name: skill-name                    # Required: lowercase, hyphens
description: What it does            # Required: when to use it
disable-model-invocation: false      # Optional: manual-only if true
user-invocable: true                 # Optional: show in /slash menu
argument-hint: "[args]"              # Optional: hint for arguments
allowed-tools: Read, Grep, Glob     # Optional: restrict tool access (Claude Code)
context: fork                        # Optional: run in subagent (Claude Code)
---

# Skill Instructions

Your detailed instructions, guidelines, and examples here...
```

### How it differs from custom instructions

| Feature | Agent Skills (`SKILL.md`) | Custom Instructions |
|---------|--------------------------|---------------------|
| **Format** | Open standard ([agentskills.io](https://agentskills.io/)) | Vendor-specific |
| **Loading** | On-demand (only when relevant) | Always applied |
| **Content** | Instructions + scripts + examples | Instructions only |
| **Portability** | Works across Claude Code, Copilot, CLI | Single platform |
| **Invocation** | Auto-loaded or `/slash` command | Always injected |

Custom instructions files are still useful for always-on repo conventions:

| File | Platform | Purpose |
|------|----------|---------|
| `.github/copilot-instructions.md` | GitHub Copilot | Repo-wide coding standards |
| `.github/instructions/*.instructions.md` | GitHub Copilot | Path-specific rules (with `applyTo` glob) |
| `CLAUDE.md` | Claude Code | Repo-wide context and conventions |
| `AGENTS.md` | Multi-agent (OpenAI standard) | General agent instructions |

## Quick Start

### Install all skills (personal — available in all projects)

```bash
# Clone the repo
git clone https://github.com/ai-engineer-skills/ai-engineer-skills.git

# Install to both Claude Code and GitHub Copilot
cd ai-engineer-skills
bash install.sh

# Or install to a specific target only
bash install.sh --target claude
bash install.sh --target copilot
```

### Install for a specific project only

```bash
# For Claude Code
cp -r skills/python-pro /path/to/your/project/.claude/skills/

# For GitHub Copilot
cp -r skills/python-pro /path/to/your/project/.github/skills/

# Both agents read from .claude/skills/, so this works for both:
cp -r skills/python-pro /path/to/your/project/.claude/skills/
```

### Install specific skills only

```bash
bash install.sh python-pro typescript-pro react-specialist
bash install.sh --target copilot docker-expert terraform-engineer
```

## Available Skills

### Language Specialists

| Skill | Description |
|-------|-------------|
| **[python-pro](skills/python-pro)** | Python 3.11+, type hints, ruff, pytest, modern patterns |
| **[typescript-pro](skills/typescript-pro)** | Strict TypeScript, Zod, Vitest, discriminated unions |
| **[javascript-pro](skills/javascript-pro)** | ES2024+, ESM, modern APIs, Vitest |
| **[rust-engineer](skills/rust-engineer)** | Ownership, thiserror/anyhow, clippy, idiomatic Rust |
| **[golang-pro](skills/golang-pro)** | Effective Go, table-driven tests, error wrapping |
| **[csharp-developer](skills/csharp-developer)** | C# 12, .NET 8, nullable refs, records, xUnit |
| **[java-architect](skills/java-architect)** | Java 21+, records, sealed classes, virtual threads |
| **[swift-expert](skills/swift-expert)** | Swift 5.9+, SwiftUI, structured concurrency |
| **[kotlin-specialist](skills/kotlin-specialist)** | Kotlin 2.0, Compose, coroutines, Flow |

### Frontend Frameworks

| Skill | Description |
|-------|-------------|
| **[react-specialist](skills/react-specialist)** | React 19, hooks, Server Components, TanStack Query |
| **[nextjs-developer](skills/nextjs-developer)** | Next.js 15, App Router, Server Actions |
| **[vue-expert](skills/vue-expert)** | Vue 3, Composition API, Pinia, VueUse |
| **[angular-architect](skills/angular-architect)** | Angular 18+, signals, standalone components |
| **[flutter-expert](skills/flutter-expert)** | Dart 3.2+, Riverpod, go_router, freezed |

### Backend Frameworks

| Skill | Description |
|-------|-------------|
| **[django-developer](skills/django-developer)** | Django 5, DRF, pytest-django, N+1 prevention |
| **[fastapi-developer](skills/fastapi-developer)** | Pydantic v2, async, SQLAlchemy 2.0, Alembic |
| **[flask-developer](skills/flask-developer)** | Flask 3, app factory, Blueprints, Marshmallow |
| **[rails-expert](skills/rails-expert)** | Rails 7.1+, service objects, RSpec, Turbo |
| **[laravel-specialist](skills/laravel-specialist)** | Laravel 11, PHP 8.3, Pest, Sanctum |
| **[spring-boot-engineer](skills/spring-boot-engineer)** | Spring Boot 3.2, Java 21, slice tests |
| **[dotnet-core-expert](skills/dotnet-core-expert)** | ASP.NET Core, Minimal APIs, EF Core, xUnit |

### Infrastructure & DevOps

| Skill | Description |
|-------|-------------|
| **[docker-expert](skills/docker-expert)** | Multi-stage builds, security, docker-compose |
| **[terraform-engineer](skills/terraform-engineer)** | IaC modules, state management, tflint |
| **[kubernetes-specialist](skills/kubernetes-specialist)** | Manifests, Helm, security contexts, GitOps |
| **[sql-pro](skills/sql-pro)** | Schema design, indexing, query optimization |

### Workflow & Quality

| Skill | Description |
|-------|-------------|
| **[security-reviewer](skills/security-reviewer)** | OWASP Top 10 security audit (`/security-reviewer`) |
| **[code-reviewer](skills/code-reviewer)** | Code review checklist (`/code-reviewer`) |
| **[test-generator](skills/test-generator)** | Generate tests for any module (`/test-generator`) |
| **[api-designer](skills/api-designer)** | REST/GraphQL API design patterns |
| **[git-workflow](skills/git-workflow)** | Branching, conventional commits (`/git-workflow`) |
| **[refactoring-specialist](skills/refactoring-specialist)** | Safe refactoring patterns (`/refactoring-specialist`) |
| **[performance-optimizer](skills/performance-optimizer)** | Profiling and optimization (`/performance-optimizer`) |
| **[documentation-writer](skills/documentation-writer)** | README, API docs, architecture docs (`/documentation-writer`) |

## How It Works

Both Claude Code and GitHub Copilot use `SKILL.md` files to extend their capabilities:

```
skills/python-pro/
└── SKILL.md        # Instructions the agent follows when working with Python
```

Each `SKILL.md` has:
- **YAML frontmatter** — `name`, `description`, and configuration fields
- **Markdown body** — conventions, patterns, and rules for the agent to follow

Skills are auto-loaded when the agent determines they're relevant to your work. Skills with `disable-model-invocation: true` are only triggered when you explicitly call them with `/skill-name`.

### Skill Types

| Type | Behavior | Examples |
|------|----------|---------|
| **Reference** (auto-loaded) | Agent applies these conventions when working in the relevant language/framework | python-pro, react-specialist |
| **Task** (manual `/invoke`) | You trigger these when you want a specific action performed | security-reviewer, test-generator |

### Progressive Loading

Agents use a 3-level loading system to keep context efficient:

1. **Discovery** — Agent reads `name` + `description` from frontmatter (always available, lightweight)
2. **Instructions** — When relevant, the full `SKILL.md` body is loaded into context
3. **Resources** — Scripts, examples, and other files in the skill directory load only when referenced

## Customization

### Override a skill

Copy a skill to your project, edit it to match your team's conventions:

```bash
# Claude Code
cp -r ~/.claude/skills/python-pro .claude/skills/python-pro

# GitHub Copilot
cp -r ~/.copilot/skills/python-pro .github/skills/python-pro
```

Project-level skills take priority over personal-level skills.

### Create a new skill

```bash
mkdir -p .claude/skills/my-skill
cat > .claude/skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: What this skill does and when to use it
---

Your instructions here...
EOF
```

See the [Agent Skills specification](https://agentskills.io/specification) for the full format reference.

## Contributing

1. Fork this repo
2. Add or improve a skill in `skills/<skill-name>/SKILL.md`
3. Follow the existing format and conventions
4. Submit a PR with a description of what the skill does

## License

MIT
