# Process Handling.
[Cheatsheet](https://gist.github.com/LeCoupa/122b12050f5fb267e75f)

- ##### To suspend a job, type CTRL+Z while it is running. You can also suspend a job with CTRL+Y.
- ##### This is slightly different from CTRL+Z in that the process is only stopped when it attempts to read input from terminal.
- ##### To interrupt a job, type CTRL+C.

---

- runs job in the background and prompts back the shell
```bash
myCommand &
```

- lists all jobs (use with -l to see associated PID)
  ```bash
jobs
```
---

-  brings a background job into the foreground
```bash
fg          
```
- brings most recently invoked background job
```bash
fg %+        
```
- brings second most recently invoked background job
```bash
fg %-        
```
- brings job number N
```bash
fg %N        
```
- brings job whose command begins with string
```bash
fg %string   
```
- brings job whose command contains string
```bash
fg %?string  
```

---

- returns a list of all signals on the system, by name and number
```bash
kill -l      
```

- terminates process with specified PID
```bash
kill PID     
```

---

-  prints a line of information about the current running login shell and any processes running under it
```bash
ps          
```

-  selects all processes with a tty except session leaders
```bash
ps -a       
```
---

- executes a command when a signal is received by the script
```bash
trap cmd sig1 sig2  
```

- ignores that signals
```bash
trap "" sig1 sig2   
```

- resets the action taken when the signal is received to the default
```bash
trap - sig1 sig2    
```
---

-  removes the process from the list of jobs
```bash
disown <PID|JID>    
```
---
- waits until all background jobs have finished
```bash
wait                
```
