<div align="center">

# vibe-pro

**바이브 코딩을 프로덕션급 코드로 끌어올리는 Claude Code 플러그인**  
*A Claude Code plugin that elevates vibe-coded ideas to production-grade software*

[![Version](https://img.shields.io/badge/version-1.0.0-blue)](https://github.com/sjh/vibe-pro-claude-plugin)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-orange)](https://claude.ai/code)

<br/>

🇰🇷 [한국어](#한국어) &nbsp;·&nbsp; 🇺🇸 [English](#english)

</div>

---

<a id="한국어"></a>

## 🇰🇷 한국어

### 왜 이 플러그인이 필요한가?

Claude에게 "로그인 기능 만들어줘"라고 하면 코드가 나옵니다. 하지만 시니어 엔지니어라면 이런 질문을 추가로 던집니다:

- 결제 API가 다운되면 어떻게 되나요? *(내결함성)*
- 두 사용자가 동시에 같은 좌석을 예약하면? *(레이스 컨디션)*
- 10만 명이 사용하면 이 쿼리가 버틸까요? *(복잡도)*
- 이 입력값으로 SQL 인젝션이 가능한가요? *(보안)*
- 같은 요청이 두 번 들어오면 중복 처리되나요? *(멱등성)*

**vibe-pro**는 이 모든 질문에 대한 답을 코드에 자동으로 반영합니다.

---

### 설치

#### 방법 1 — GitHub 마켓플레이스 (권장)

```bash
# Claude Code 세션에서
/plugin marketplace add sjh/vibe-pro-claude-plugin
/plugin install vibe-pro
```

#### 방법 2 — 로컬 경로 (개발/테스트)

```bash
claude --plugin-dir /path/to/vibe-pro-claude-plugin
```

#### 방법 3 — 단일 세션 로드

```bash
claude --plugin-dir ./vibe-pro-claude-plugin
```

---

### Skills

| 명령어 | 설명 |
|--------|------|
| `/vibe-pro:enhance` | **핵심 스킬.** 간단한 기능 아이디어를 8가지 CS 원칙이 포함된 전문 엔지니어링 스펙 프롬프트로 변환합니다. 출력된 프롬프트를 Claude에 다시 붙여넣으면 프로덕션급 코드가 생성됩니다. |
| `/vibe-pro:review` | 작성된 코드를 8가지 원칙 기준으로 검토합니다. A–F 등급 스코어카드와 구체적인 수정 코드를 제공합니다. |
| `/vibe-pro:security` | OWASP Top 10 보안 감사. SQL 인젝션, XSS, 인증/인가 취약점, CORS 설정 오류 등을 탐지하고 정확한 수정 코드를 제시합니다. |
| `/vibe-pro:arch` | 시스템 아키텍처 컨설팅. DB 선택(PostgreSQL/MongoDB/Redis), 통신 패턴(REST/WebSocket/큐), 컴포넌트 경계 설계를 도와줍니다. |
| `/vibe-pro:resilience` | 내결함성 설계. 멱등성 키, 서킷 브레이커, 지수 백오프 재시도, 캐스케이딩 실패 방지 코드를 생성합니다. |
| `/vibe-pro:complexity` | 알고리즘 복잡도 분석(Big-O), N+1 쿼리 탐지, 레이스 컨디션 진단, 최적화 코드 제시. |

---

### Agent

| 에이전트 | 활성화 방법 | 설명 |
|----------|------------|------|
| **pro-architect** | `/agents` → `pro-architect` 선택 | 전체 세션 동안 수석 엔지니어 페르소나로 동작합니다. 보안, 내결함성, 클린 아키텍처, 성능 원칙이 작성하는 모든 코드에 자동 적용됩니다. |

---

### 추천 워크플로우

#### 새 기능을 개발할 때

```
1. /vibe-pro:enhance  [기능 아이디어를 간단히 설명]
2. 출력된 "향상된 프롬프트"를 복사
3. Claude에 붙여넣기 → 프로덕션급 코드 생성
4. /vibe-pro:review  [생성된 코드 붙여넣기]
5. /vibe-pro:security  [인증/데이터 처리가 있는 코드에 적용]
```

#### 전체 프로젝트 세션에서 프로처럼 코딩하기

```
1. /agents → pro-architect 활성화
2. 평소처럼 바이브 코딩 → 생성되는 모든 코드가 자동으로 프로덕션급
3. 특정 영역 심층 분석이 필요할 때 개별 스킬 사용
```

#### 빠른 참조

```bash
# 아이디어 → 전문 스펙 프롬프트
/vibe-pro:enhance  Google OAuth 로그인 + JWT 세션 관리

# 코드 리뷰
/vibe-pro:review  [코드 붙여넣기]

# 보안 감사
/vibe-pro:security  [API 라우트 핸들러 붙여넣기]

# 아키텍처 설계 상담
/vibe-pro:arch  실시간 경매 플랫폼을 만들고 있어요

# 외부 API 내결함성 설계
/vibe-pro:resilience  Stripe 결제와 SendGrid 이메일을 호출해요

# 성능 분석
/vibe-pro:complexity  [루프나 DB 쿼리가 있는 코드 붙여넣기]
```

---

### 8가지 엔지니어링 원칙

vibe-pro의 모든 스킬과 에이전트가 적용하는 핵심 CS 지식:

| # | 원칙 | 핵심 개념 |
|---|------|----------|
| 1 | **분산 시스템 & 상태 관리** | Stateless 설계, 이벤트 기반 패턴, Pub/Sub |
| 2 | **데이터 무결성 & 트레이드오프** | CAP 정리, ACID 트랜잭션, 정규화 vs 비정규화 |
| 3 | **계산 복잡도 & 동시성** | Big-O 분석, 데드락 방지, 레이스 컨디션, 뮤텍스 |
| 4 | **내결함성 & 복원력** | 멱등성, 서킷 브레이커, 지수 백오프 |
| 5 | **컴포넌트 결합도 & 인터페이스** | SOLID, DIP, DI, IoC, DTO |
| 6 | **도메인 주도 설계 & 패턴** | 보편적 언어, GoF 패턴, 바운디드 컨텍스트 |
| 7 | **네트워크 프로토콜 & 통신** | REST vs GraphQL vs gRPC, WebSocket, OSI 계층 |
| 8 | **시스템 보안 & 접근 제어** | JWT, HttpOnly 쿠키, RBAC, OWASP Top 10 |

---

### 자동 리마인더 훅

`.js`, `.ts`, `.py`, `.go` 등 코드 파일이 작성될 때마다 `/vibe-pro:review`와 `/vibe-pro:security` 실행을 자동으로 안내합니다.

---

### 플러그인 구조

```
vibe-pro-claude-plugin/
├── .claude-plugin/
│   └── plugin.json              # 플러그인 매니페스트
├── skills/
│   ├── enhance/SKILL.md         # 핵심: 기능 설명 → 전문 스펙 프롬프트
│   ├── review/SKILL.md          # 8가지 원칙 코드 리뷰
│   ├── security/SKILL.md        # OWASP 보안 감사
│   ├── arch/SKILL.md            # 시스템 아키텍처 컨설팅
│   ├── resilience/SKILL.md      # 내결함성 설계
│   └── complexity/SKILL.md      # 복잡도 & 동시성 분석
├── agents/
│   └── pro-architect.md         # 수석 엔지니어 페르소나 에이전트
├── hooks/
│   └── hooks.json               # PostToolUse 훅 설정
└── README.md
```

---

<a id="english"></a>

## 🇺🇸 English

### Why This Plugin?

When you ask Claude to "build a login feature," you get code. But a senior engineer asks:

- What happens if the payment API goes down? *(fault tolerance)*
- What if two users book the same seat simultaneously? *(race conditions)*
- Will this query hold up with 100,000 users? *(complexity)*
- Can this input cause a SQL injection? *(security)*
- What if the same request arrives twice? *(idempotency)*

**vibe-pro** automatically encodes all of these concerns into every piece of code Claude writes.

---

### Installation

#### Option 1 — GitHub Marketplace (Recommended)

```bash
# Inside a Claude Code session
/plugin marketplace add sjh/vibe-pro-claude-plugin
/plugin install vibe-pro
```

#### Option 2 — Local Path (Development / Testing)

```bash
claude --plugin-dir /path/to/vibe-pro-claude-plugin
```

#### Option 3 — Single-Session Load

```bash
claude --plugin-dir ./vibe-pro-claude-plugin
```

---

### Skills

| Command | Description |
|---------|-------------|
| `/vibe-pro:enhance` | **Core skill.** Transforms a simple feature idea into a professional engineering specification prompt covering all 8 CS principles. Paste the output back to Claude to generate production-ready code. |
| `/vibe-pro:review` | Reviews written code against all 8 principles. Produces an A–F scorecard with specific fix code. |
| `/vibe-pro:security` | OWASP Top 10 security audit. Detects SQL injection, XSS, auth/authz vulnerabilities, CORS misconfigurations, and provides exact remediation code. |
| `/vibe-pro:arch` | System architecture consulting. Guides DB selection (PostgreSQL/MongoDB/Redis), communication patterns (REST/WebSocket/queue), and component boundary design. |
| `/vibe-pro:resilience` | Fault tolerance engineering. Generates idempotency keys, circuit breakers, exponential backoff retries, and cascading failure prevention. |
| `/vibe-pro:complexity` | Algorithm complexity analysis (Big-O), N+1 query detection, race condition diagnosis, and optimized code. |

---

### Agent

| Agent | Activation | Description |
|-------|-----------|-------------|
| **pro-architect** | `/agents` → select `pro-architect` | Acts as a principal engineer for the entire session. Security, fault tolerance, clean architecture, and performance principles are applied automatically to every line of code — no prompting required. |

---

### Recommended Workflows

#### Building a new feature

```
1. /vibe-pro:enhance  [describe your feature idea simply]
2. Copy the generated "Enhanced Prompt"
3. Paste it back to Claude → production-grade code is generated
4. /vibe-pro:review  [paste the generated code]
5. /vibe-pro:security  [apply to any code handling auth or user data]
```

#### Full-session pro coding

```
1. /agents → activate pro-architect
2. Vibe-code as usual → every generated piece is automatically production-grade
3. Use individual skills for deep-dives on specific areas
```

#### Quick reference

```bash
# Idea → professional specification prompt
/vibe-pro:enhance  Google OAuth login with JWT session management

# Code review
/vibe-pro:review  [paste code]

# Security audit
/vibe-pro:security  [paste API route handler]

# Architecture consultation
/vibe-pro:arch  I'm building a real-time auction platform

# External API fault tolerance
/vibe-pro:resilience  I call Stripe payments and SendGrid email

# Performance analysis
/vibe-pro:complexity  [paste code with loops or DB queries]
```

---

### The 8 Engineering Principles

Every skill and agent in vibe-pro applies these core CS concepts automatically:

| # | Principle | Key Concepts |
|---|-----------|-------------|
| 1 | **Distributed Systems & State Management** | Stateless design, event-driven patterns, Pub/Sub |
| 2 | **Data Integrity & Trade-offs** | CAP theorem, ACID transactions, normalization vs denormalization |
| 3 | **Computational Complexity & Concurrency** | Big-O analysis, deadlock prevention, race conditions, mutexes |
| 4 | **Fault Tolerance & Resilience** | Idempotency, circuit breakers, exponential backoff |
| 5 | **Component Coupling & Interface Design** | SOLID, DIP, DI, IoC, DTOs |
| 6 | **Domain-Driven Design & Patterns** | Ubiquitous language, GoF patterns, bounded contexts |
| 7 | **Network Protocols & Communication** | REST vs GraphQL vs gRPC, WebSocket, OSI layers |
| 8 | **System Security & Access Control** | JWT, HttpOnly cookies, RBAC, OWASP Top 10 |

---

### Automatic Reminder Hook

Whenever a code file (`.js`, `.ts`, `.py`, `.go`, etc.) is written or edited, the plugin automatically reminds you to run `/vibe-pro:review` and `/vibe-pro:security`.

---

### Plugin Structure

```
vibe-pro-claude-plugin/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest
├── skills/
│   ├── enhance/SKILL.md         # Core: idea → professional spec prompt
│   ├── review/SKILL.md          # 8-principle code review
│   ├── security/SKILL.md        # OWASP security audit
│   ├── arch/SKILL.md            # Architecture consulting
│   ├── resilience/SKILL.md      # Fault tolerance engineering
│   └── complexity/SKILL.md      # Complexity & concurrency analysis
├── agents/
│   └── pro-architect.md         # Principal engineer persona agent
├── hooks/
│   └── hooks.json               # PostToolUse hook configuration
└── README.md
```

---

### Requirements

- [Claude Code](https://claude.ai/code) — latest version
- `jq` installed on your system (required for the hook)
  ```bash
  # macOS
  brew install jq
  # Ubuntu/Debian
  sudo apt-get install jq
  ```

---

<div align="center">

Made by [sjh](mailto:shin034316@gmail.com) · MIT License

</div>
