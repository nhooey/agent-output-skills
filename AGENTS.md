# agent-output-skills

Coding-agent skills for the shape of an agent's output in isolation, packaged
as a Nix flake. Each skill is a directory under `skills/` with a `SKILL.md`,
built into packages by agent-skill-flake; [README.md](README.md) lists them.

## Build and test

Run `nix develop` to enter the dev shell. It installs the dev shell's
skills from the `skills-devshell/` sub-flake into `.agents/skills/`, and
`menu` lists its commands:

- `check`: build every skill package and check that every file is
  formatted.
- `fmt`: format `*.nix` with nixfmt and `*.md` / `*.yaml` with prettier.
- `update-flake`: update every flake input and rewrite `flake.lock`.
- `update-skills-devshell`: update the `skills-devshell/` sub-flake's lock,
  which pins the dev shell's skills.
- `reap-skills`: remove every skill the dev shell installed.
