#!/bin/bash

# rm -rf subconverter subconverter_linux64.tar.gz
# wget -N https://github.com/tindy2013/subconverter/releases/latest/download/subconverter_linux64.tar.gz
# tar -xzvf subconverter_linux64.tar.gz

cat <<EOF > /tmp/keepalive.sh
#!/bin/bash

while true; do
  curl "https://${REPL_SLUG}.${REPL_OWNER}.repl.co" --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
  sleep 60
done
EOF

nohup bash /tmp/keepalive.sh > /tmp/log.out 2>&1 &  
cd subconverter
chmod 777 subconverter
./subconverter 2>/dev/null
