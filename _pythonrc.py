import rlcompleter
import readline
readline.parse_and_bind("bind -v")
readline.parse_and_bind("bind ^I rl_complete")
readline.parse_and_bind("bind ^N rl_complete")
readline.parse_and_bind("bind ^P rl_complete")
