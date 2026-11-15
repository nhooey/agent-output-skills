---
name: agent-output-session-recap
description: Render a recap of the current conversation as a script of alternating one-line entries, 🗣 (U+1F5E3 speaking head) for the user and 🤖 (U+1F916 robot face) for the assistant. Each line is one sentence, the user's intent or the assistant's action and outcome, in chronological order, with adjacent turns of one role folded together, course corrections kept as their own lines, and tool-call mechanics, monitor events and pasted output left out. Use when the user asks to summarize, recap or read back the session ("what did we do?", "recap our conversation", "transcript of the back-and-forth"), or asks for a session summary in this dialogue shape for a pull request, ticket or stand-up note; not for a mid-session question about the state of something.
---

# Session recap as a 🗣 / 🤖 dialogue

_A recap reads like a script: one line per turn, the user's intent on a 🗣 line, the assistant's action and outcome on a 🤖 line, in the order they happened._

```text
🗣 <the user's request, one sentence>
🤖 <what the assistant did and how it came out, one sentence>
🗣 …
🤖 …
```

Use this glyph pair and no other, unless the preferences name another: 🗣 is a human voice and 🤖 a machine, and that asymmetry is what lets the reader scan the script top to bottom.

## What each line carries

- **🗣 line:** the intent of the user's turn in one sentence. "Make a branch and open a pull request" is fine; quoting the user word for word is not the goal.
- **🤖 line:** what the assistant did, leading with the action ("Opened…", "Edited…", "Ran…"), then a clause for the result if there is one ("merged before the amend landed", "all 8 checks green"). It never restates the assistant's prose.

One sentence per line, with no sub-bullets, hedges or quoted tool output.

## What to leave out

- **Tool-call mechanics:** commands, file paths, branch names. A pull request or issue appears only when it is part of the story, named by its title as `writing-hygiene-refer-by-canonical-label` says, never by its number alone.
- **Monitor notifications and check-run events:** fold them into the surrounding 🤖 line ("opened the pull request; checks green").
- **The assistant's deliberation:** what it weighed before answering.
- **Confirmations typed only to unblock a question** ("yes, go ahead"): fold them into the next 🤖 line. A confirmation that carried something new ("yes, and also rename X") keeps its 🗣 line.
- **Long pasted output:** paraphrase it in a clause ("the user shared the TUI hint bar's text").

## Course corrections get their own line

When the user pushes back on the assistant's approach ("don't write memories, write to the skill instead", "that's not what I meant, do X"), keep that turn as its own 🗣 line, and have the next 🤖 line acknowledge the change of direction, not only the new output. These turns make the recap work as a postmortem: the reader sees where the path forked, not only where it ended.

## Order

- **Chronological, not topical:** reordering by topic loses the back-and-forth.
- **Fold adjacent turns of one role:** two assistant turns in a row, such as a tool result and a reply or two monitor reactions, become one 🤖 line; two user messages in quick succession become one 🗣 line.

## When to apply

- The user asks for a summary, recap, readback or transcript of the current session, or "what did we do in this conversation?".
- The user wants a session summary in dialogue shape for a pull request description, a ticket or a stand-up note.
- The user names the format ("with the robot and speech emoji", "as a back-and-forth").

Recap only on request. A mid-session question like "what's the state of X?" gets a direct answer, not a recap.

## Example

A session that opened a pull request, hit a merge race, then turned into a skill edit:

```text
🗣 Make a branch for the current changes and open a pull request.
🤖 Opened the "Cache rate-limit lookups" pull request and armed a CI-checks monitor.
🗣 Rewrite the commit message to focus on why, and force-push.
🤖 Amended locally, but the force-push failed: the pull request had already merged and its branch was deleted.
🗣 Why didn't you set up a monitor for the merge?
🤖 Confused the CI-checks monitor with the broader pull-request watcher, and saved the lesson as a memory.
🗣 Don't write memories; write to the relevant skill instead.
🤖 Removed the memory and added the lesson to the watcher skill.
```

The "Don't write memories" line is the turn that earns the recap: without it, the reader sees a tidy outcome but not the fork.

## Your preferences

!`cat "${CLAUDE_SKILL_DIR}/../agent-output-session-recap.preferences.md" "${CLAUDE_PROJECT_DIR}/.agents/skills/agent-output-session-recap.preferences.md" 2>/dev/null || true`

If your agent doesn't run the line above, read these files yourself if they
exist: `agent-output-session-recap.preferences.md` next to this skill's folder, then
`.agents/skills/agent-output-session-recap.preferences.md` in the project. A project's
file overrides the user's, and the user's overrides this skill's defaults.

The keys this skill reads, with its own defaults:

```markdown
- User glyph: 🗣
- Assistant glyph: 🤖
```

## Related skills

When one of these applies and it's in your skill listing, load it
without asking. If it isn't in your listing, tell the user which skill is
missing and ask whether to install it from the same collection this skill
came from; don't apply it from memory.

- `writing-hygiene-refer-by-canonical-label`: name a pull request, issue or file in a recap line by its title, never by a bare number or path.
