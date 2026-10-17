{
  description = "agent-output-session-recap: Agent-output skill — render the current conversation as an alternating 🗣 / 🤖 dialogue script when the user asks for a session recap";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agent-skill-flake.url = "github:nhooey/agent-skill-flake";
    agent-skill-flake.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, agent-skill-flake, ... }:
    agent-skill-flake.lib.mkSkillFlake {
      inherit nixpkgs;
      source = import ../../source.nix;
      skillName = "agent-output-session-recap";
      src = ./.;
    };
}
