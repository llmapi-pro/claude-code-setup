# Claude Code Setup

> One-line installer and setup guide for [Claude Code CLI](https://docs.anthropic.com/claude/docs/claude-code) with the [LLM API](https://llmapi.pro) Claude-compatible relay.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) [![Made for Claude Code](https://img.shields.io/badge/Made_for-Claude_Code-D97757)](https://docs.anthropic.com/claude/docs/claude-code)

## What this is

[Claude Code](https://docs.anthropic.com/claude/docs/claude-code) is Anthropic's official agentic CLI for AI-assisted coding. Claude Code CLI supports a configurable backend via the documented `ANTHROPIC_BASE_URL` environment variable — you can point it at any Anthropic-API-compatible endpoint.

This repo provides:

- One-line install scripts (Windows PowerShell, macOS, Linux)
- Manual setup instructions
- A common-issues reference

The default backend used by these scripts is [LLM API](https://llmapi.pro) — a Claude-compatible API relay service running a multi-provider pool with automatic failover, directly accessible from China without VPN, and supporting CNY billing via Alipay/WeChat.

## Quick install (60 seconds)

### Windows (PowerShell)

```powershell
irm llmapi.pro/setup.ps1 | iex
```

### macOS / Linux

```bash
curl -fsSL llmapi.pro/setup.sh | bash
```

The installer will:

1. Install Claude Code CLI via npm (if not already installed)
2. Walk you through registering at [llmapi.pro](https://llmapi.pro/register) to get a free API key
3. Set the two environment variables (`ANTHROPIC_BASE_URL`, `ANTHROPIC_API_KEY`)
4. Run a connectivity check

## Manual setup

If you would rather not run a script:

```bash
# 1. Install Claude Code CLI
npm install -g @anthropic-ai/claude-code

# 2. Get a free API key from https://llmapi.pro/register

# 3. Set environment variables (add to ~/.bashrc or ~/.zshrc)
export ANTHROPIC_BASE_URL=https://llmapi.pro
export ANTHROPIC_API_KEY=sk-...your-key...

# 4. Use Claude Code
claude
```

To switch back to the default backend, just `unset ANTHROPIC_BASE_URL`.

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `Connection refused` / TLS hangs | Network issue | Try a different ISP or DNS |
| `401 Unauthorized` | Wrong API key | Re-copy the key from your dashboard |
| `429 Rate limit exceeded` | Free tier cap hit | See the [429 triage guide](https://llmapi.pro/blog/fix-claude-code-429-rate-limit-exceeded) |
| Tools fail silently | Claude Code version mismatch | `npm update -g @anthropic-ai/claude-code` |
| Behind GFW / China network issues | Direct foreign endpoints unreliable | See the [China setup guide](https://llmapi.pro/blog/claude-code-from-china-setup-guide) |

## Why use a relay backend?

| | Direct foreign API | LLM API relay |
|---|---|---|
| China access | VPN required | Direct from most ISPs |
| Payment | Foreign card | Alipay / WeChat / CNY |
| Failover | Single vendor | Multi-provider pool |
| Setup | Account + billing | One API key |

More background on the relay model: [llmapi.pro/blog](https://llmapi.pro/blog).

## Recommended extensions

Once you have Claude Code running, consider these workflow add-ons:

- **[claude-next](https://github.com/llmapi-pro/claude-next)** — One-key handoff between deep Claude Code sessions. When a long conversation starts hallucinating past ~400K tokens, `/next` in the old window produces an audited handoff; paste `continue A` in a new window to resume instantly. `npx claude-next install`.
- [claude-md-templates](https://github.com/llmapi-pro/claude-md-templates) — Drop-in `CLAUDE.md` templates tuned for popular stacks (Next.js, FastAPI, Go, Rust, etc.).
- [awesome-claude-code](https://github.com/llmapi-pro/awesome-claude-code) — Curated list of other high-quality Claude Code tools and guides.

## Related blogs

- [Fix Claude Code 429 "Rate Limit Exceeded": Complete Triage Guide](https://llmapi.pro/blog/fix-claude-code-429-rate-limit-exceeded)
- [Running Claude Code from China: A Practical 2026 Guide](https://llmapi.pro/blog/claude-code-from-china-setup-guide)
- [Claude Code Tool Use: A Complete Developer Guide](https://llmapi.pro/blog/claude-code-tool-use-complete-guide)
- [Claude Code on a Budget: A Solo Developer Starter Guide](https://llmapi.pro/blog/claude-code-budget-guide-solo-developers)

## License

MIT — see [LICENSE](LICENSE).

## Disclaimer

LLM API and this repository are independent of Anthropic and not affiliated with Anthropic. Claude Code CLI is Anthropic's official tool that supports configurable backends via the documented `ANTHROPIC_BASE_URL` environment variable.
