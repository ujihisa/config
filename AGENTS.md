## How to test vim

* Prefer running Vim headless (`vim -N -Es`) with `-u ~/.vimrc` and `-c "set nomore"` so the exact command sequence can be scripted. Wrap the invocation in a shell script or `bash -lc` call when you plan to rerun it.
* Before launching Vim, set `XDG_CACHE_HOME`, `VIMINFO`, `TMPDIR`, and any plugin-specific cache dirs (e.g., `neomru`'s base) to subdirectories under `/tmp` and `mkdir -p` them so the headless run never writes into `~/.cache`/`~/.viminfo` or asks for interactive confirmations.
* Drive the same keystrokes as the mapping you are testing by chaining `-c` arguments (e.g., `cd ~/git/monorepo`, `tabnew`, `silent Gina status --opener=vsplit`, `echom 'after gina:' . winnr('$')`, `call deol#start(...)`, `echom 'after deol:' . winnr('$')`, `qa`). Capture the `echom` output and window numbers to confirm each stage and use `-V9/tmp/vimlog` if you need to inspect plugin warnings later.
* If the script still emits startup errors such as `E700`, `E495`, `E303` (autocommands referencing `<afile>` or failing to create swapfiles in the sandbox), note that they are environment artifacts. As long as the scripted `echom` markers show the expected state transitions and window numbers, treat those errors as noise and record them in the verification notes.

## Format

Markdown
* Do not start any line with "- ".
* If a list is necessary, use only "* ".
