# Global rules

## Superpowers plan/spec locations

Override the superpowers plugin's defaults (`docs/superpowers/plans/` and
`docs/superpowers/specs/`) with a single canonical location per project,
shared with opencode's built-in `plan` agent:

- **Plans** (`writing-plans` skill): save to `.opencode/plans/YYYY-MM-DD-<feature-name>.md`
- **Specs / design docs** (`brainstorming` skill): save to `.opencode/specs/YYYY-MM-DD-<topic>-design.md`

Do not use `docs/superpowers/plans/` or `docs/superpowers/specs/` — this
rule replaces those defaults everywhere, in every project.
