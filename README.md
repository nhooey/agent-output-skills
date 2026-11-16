# agent-output-skills

Coding-agent skills for the shape of an agent's output in isolation, packaged
as a Nix flake.

Each skill here describes one kind of output an agent produces on request,
such as a recap of the session, and the exact shape it takes: what each line
carries, what it leaves out and in what order. They cover the output itself,
not how the agent works to get there; skills for that live in
coding-agent-skills.

Each skill is a self-contained directory under [`skills/`](skills/) with a
`SKILL.md` that an agent loads on demand. Skills are built by
[`agent-skill-flake`](https://github.com/nhooey/agent-skill-flake).

## Skills

| Skill                                                                      | What it does                                                                                                           |
| -------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| [`agent-output-session-recap`](skills/agent-output-session-recap/SKILL.md) | Renders a session summary as alternating 🗣 user / 🤖 assistant one-liners, one sentence per turn, no tool-call noise. |

## Install

```bash
# Preview what installing every skill would change, without writing anything
nix run github:nhooey/agent-output-skills#preview

# Install all skills into the agent's skill directory
nix run github:nhooey/agent-output-skills#install
```

Package outputs:

- `agent-skills-nhooey-agent-output-all` — the aggregate of every skill (also `default`)
- `agent-skill-nhooey-agent-output-session-recap`

## Development

Run `nix develop` to enter the dev shell, then `menu` to list its commands:

- `check`: build every skill package and check that every file is formatted.
- `fmt`: format `*.nix` with nixfmt and `*.md` / `*.yaml` with prettier.
- `update-flake`: update every flake input and rewrite `flake.lock`.
- `update-skills-devshell`: update the lock that pins the dev shell's skills.
- `reap-skills`: remove every skill the dev shell installed.
