# dotfiles-rsync (Allow-list Strategy)

This repository stores ONLY the files you explicitly list in `tracked.txt`.
A sync script copies them from your `$HOME` into this repo. Nothing else is touched.

## Files
- `tracked.txt` — one relative path per line (e.g. `.bashrc`, `dwm-btw/config.h`).
- `sync.sh` — copies each listed path from `$HOME` into the repo.

## Basic Workflow
```bash
cd ~/dotfiles-rsync
./sync.sh          # copy updated versions into repo
git add .          # stage changes
git commit -m "Update"  # commit
git push           # (after adding remote)
```

To add a new file:
1. Edit `tracked.txt` and append the path relative to `$HOME`.
2. Run `./sync.sh` again.
3. `git add`, commit, push.

## Safety
- Only allow-listed files are included. No secrets elsewhere in `$HOME` can leak by accident.
- Review `git diff` before committing.

## Restoring on a new machine
After cloning this repo:
```bash
while read p; do [ -z "${p%%#*}" ] && continue; cp -v "$PWD/$p" "$HOME/$p"; done < tracked.txt
```
(Or write a reverse sync script.)

## Extending
- Add a pre-commit hook to lint shell files.
- Add a `reverse-sync.sh` to push changes from repo back into `$HOME`.
- Integrate with a secret manager for sensitive templates.
