# agent-output-skills

Coding-agent skills for the shape of an agent's output in isolation, packaged
as a Nix flake. Each skill is a directory under `skills/` with a `SKILL.md`,
built into packages by agent-skill-flake; [README.md](README.md) lists them.

## Build and test

- `nix develop`: enter the dev shell, which installs the dev shell's skills
  from the `skills-devshell/` sub-flake into `.agents/skills/`.
- `nix fmt`: format `*.nix` with nixfmt and `*.md` / `*.yaml` with prettier.
- `nix flake check`: build every skill package and check that every file is
  formatted.
