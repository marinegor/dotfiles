# Kill process by port
killport port:
    lsof -ti:{{port}} | xargs kill -9

# quickly run ipython console
cons:
  uv run --with ipython ipython

# reload environment variables
vars:
  quickenv reload


alias v := vars
alias c := cons
