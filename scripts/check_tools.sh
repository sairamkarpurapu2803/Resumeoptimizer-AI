
#!/bin/bash

echo "Checking installed tools"

git --version
python3 --version
node -v
npm -v
docker --version
docker compose version
java -version
kubectl version --client
nginx -v

echo "Verification completed"
