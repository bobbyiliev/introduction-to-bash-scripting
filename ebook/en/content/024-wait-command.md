
# The `Wait` commands

  
  It is a command that waits for completing any runnung process of given id. if the process id is not given then it waits for all current child processes to complete. 

  ### Example : 
  This example shows how the `wait`  command works : <br />
  first --> Create a file named "wait_example.sh" and add the following scripit to it.
  ```
  #!/bin/bash
  echo "Wait command" &
  process_id=$!
  wait $process_id
  echo "Exited with status $?"
  ```
    second --> run the file with bash command.

  ```
  $ bash wait_example.sh
  ```


    


  
