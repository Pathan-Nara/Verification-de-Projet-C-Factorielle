#!/bin/sh
fact="1 2 6 24 120 720 5040 40320 362880 3628800"
i=1
for expected in $fact; do
  res=$(./"$1" "$i")
  if [ "$res" -ne "$expected" ] 2>/dev/null; then
    echo "false"
    exit 0
  fi
  i=$((i + 1))
done
echo "true"
exit 1