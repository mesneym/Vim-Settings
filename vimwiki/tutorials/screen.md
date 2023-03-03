# Screen
Screen is a terminal multiplexer


## Useful Commands
| command                       | description                                                                                     |
| screen -ls                    | list of all screens                                                                             |
| <Ctrl>+a+d                    | Detach from screen session                                                                      |
| screen -S *session name*      | Create a screen with name                                                                       |
| screen -r *session_name/id*   | retach to screen session                                                                        |
| screen -X -S 12108 *quit*     | send *quit* command to screen session with id 12108                                             |
| <Ctrl>+a+k                    | kills window in a session. If there is only one window, it kills the session                    |
| ctrl+a+c                      | creates a new window within a screen                                                            |
| ctrl+a+p                      | move back to previous window                                                                    |
| ctrl+a+n                      | move to next window                                                                             |
| ctrl+a+\                      | kill session. Destroys all windows                                                              |
| ctrl+a+w OR ctrl+a+"          | See window list                                                                                 |
| ctrl+a+1                      | Goes to window 1                                                                                |
| ctrl+a+A                      | set window name                                                                                 |
| ctrl+a+ pipe                  | split window vertically                                                                         |
| ctrl+a+ S                     | split window horizontally                                                                       |
| ctrl+a+tab                    | switch between                                                                                  |
| ctrl+a+x                      | lock session                                                                                    |
| ctrl+a+\                      | screen info     a                                                                               |
| ctrl+a+X                      | remove window                                                                                   |
| screen -d -m python script.py | runs the scrip in detached mode. Note the session will terminate itself when the script is done |



