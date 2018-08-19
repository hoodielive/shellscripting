# shellscripting
Lets Play with Shells

1. command line args 
2. file descriptors (stdin, stdout, stderr)
3. current directory
4. environment
5. identities: user (effective, current & login), groups (effective group, primary & supplementary groups) 
6. umask 
7. ulimit (some 16 different resource limits) 
8. process group, session, controlling terminal and cgroup 
9. namespaces (pid user mounts ipc net uts) 
   + 'container'
   + root directory (more generally, the filesystem *namespace*, which includes all apparent mount points) 
   + network namespace

## Forwards and Backwards
1. builtins - effect the shell *context* 

Task: replace every occurence of '\ \ \' with some to-be-defined value (value is supplied in variable) and the search pattern is '\ \ \'
As a regex that's: 
	\ \ \ \ \ \ 
As a shell command line argument thats 's#\ \ \ \ \ \ \ \ \ \ \ \ # $replacement #' LOL

