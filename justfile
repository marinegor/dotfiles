glances:
    TERM=linux TERMINFO=/etc/terminfo glances


# Kill process by port
killport port:
    lsof -ti:{{port}} | xargs kill -9

# quickly run ipython console
cons with='':
  uv run --with "ipython,{{with}}" ipython

# reload environment variables
vars:
  quickenv reload


alias v := vars
alias c := cons
