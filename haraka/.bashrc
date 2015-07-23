if mkdir /var/lock/mylock; then
  echo "Locking succeeded" >&2
  /root/start/bootstrap.sh
else
  echo "Lock failed - exit" >&2
  exit 1
fi
/root/start/run.sh
