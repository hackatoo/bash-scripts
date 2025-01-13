#!/bin/bash
USER="dzadiran"
KEYFILE=""
HOSTS=("host1" "host2" "host3")
LOG_FILE="ssh_check_results.log"

> "$LOG_FILE"
check_ssh() {
    local HOST=$1
    echo "Checking SSH connection to $HOST..."
    sshpass -f $KEYFILE ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no -o BatchMode=yes "$USER@$HOST" exit
    if [ $? -eq 0 ]; then
        echo "$HOST: SSH connection successful." | tee -a "$LOG_FILE"
    else
        echo "$HOST: SSH connection failed." | tee -a "$LOG_FILE"
    fi
}

for HOST in "${HOSTS[@]}"; do
    check_ssh "$HOST"
done
