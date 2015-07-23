if mkdir /var/lock/mylock; then
  echo "Locking succeeded" >&2
  /root/start/bootstrap.sh
else
  echo "Lock failed - exit" >&2
fi
/root/start/run.sh
