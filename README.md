# claude-code-skills

A curated collection of **33 Claude Code skills** for different programming languages, frameworks, and development workflows. Each skill is a `SKILL.md` file following the official [Claude Code skills format](https://code.claude.com/docs/en/skills) that teaches Claude best practices for a specific technology or task.

## Quick Start

### Install all skills (personal — available in all projects)

```bash
# Clone the repo
git clone https://github.com/<your-username>/claude-code-skills.git

# Run the install script
cd claude-code-skills
bash install.sh
```

### Install for a specific project only

```bash
# Copy specific skills into your project
cp -r skills/python-pro /path/to/your/project/.claude/skills/
cp -r skills/fastapi-developer /path/to/your/project/.claude/skills/
```

### Install a single skill

```bash
# Copy one skill to your personal Claude Code config
mkdir -p ~/.claude/skills
cp -r skills/typescript-pro ~/.claude/skills/
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

Claude Code uses a **SKILL.md** file format to extend its capabilities:

```
skills/python-pro/
└── SKILL.md        # Instructions Claude follows when working with Python
```

Each `SKILL.md` has:
- **YAML frontmatter** — name, description, and configuration
- **Markdown body** — conventions, patterns, and rules for Claude to follow

Skills are auto-loaded by Claude when relevant to your work. Skills with `disable-model-invocation: true` are only triggered when you explicitly call them with `/skill-name`.

### Skill Types

| Type | Behavior | Examples |
|------|----------|---------|
| **Reference** (auto-loaded) | Claude applies these conventions when working in the relevant language/framework | python-pro, react-specialist |
| **Task** (manual `/invoke`) | You trigger these when you want a specific action performed | security-reviewer, test-generator |

## Customization

### Override a skill

Copy a skill to your project, edit it to match your team's conventions:

```bash
cp -r ~/.claude/skills/python-pro .claude/skills/python-pro
# Edit .claude/skills/python-pro/SKILL.md with your project's specific rules
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

See the [official Claude Code skills docs](https://code.claude.com/docs/en/skills) for the full specification.

## Contributing

1. Fork this repo
2. Add or improve a skill in `skills/<skill-name>/SKILL.md`
3. Follow the existing format and conventions
4. Submit a PR with a description of what the skill does

## License

MIT
