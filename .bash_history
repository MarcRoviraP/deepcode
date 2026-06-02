exit
ping google.com
ip a
clear
cls
clear
poweroff
python3 app.py
python3 src/app.py 
source .venv/bin/activate
python3 src/app.py 
gunicorn -w 2 -b 0.0.0.0:5000 app:app --log-level debug
python3 src/app.py 
cls
clear
python3 src/app.py 
netstat -tuln | grep 5000
ps aux | grep app.py
sudo ufw status || sudo iptables -L -n | grep 5000
python3 src/app.py
./.venv/bin/python3 src/app.py
ss -tuln | grep 5000
curl -s https://ifconfig.me
sysctl net.ipv4.icmp_echo_ignore_all
sudo iptables -L -n -v
ip addr
curl -X POST http://localhost:5000/tts -H "Content-Type: application/json" -d '{"text":"test"}' --output test.wav
netstat -tuln | grep 5000
ss -tuln | grep 5000
nohup ./.venv/bin/python3 src/app.py > app.log 2>&1 &
curl -X POST http://localhost:5000/tts -H "Content-Type: application/json" -d '{"text":"hola"}' --output test_final.wav && ls -l test_final.wav
ps aux | grep app.py
cat app.log
pkill -f "src/app.py" || true && nohup ./.venv/bin/python3 src/app.py > app.log 2>&1 &
[200~pip install flask-cors
pip install flask-cors
source .venv/bin/activate
pip install flask-cors
# Entra a la carpeta de modelos
cd models
# Descarga el modelo Sharvard
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/sharvard/medium/es_ES-sharvard-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/sharvard/medium/es_ES-sharvard-medium.onnx.json
ls
cd ..
./start.sh 
ps aux | grep flask
netstat -tulnp | grep 5000
ss -tuln | grep 5000
lsof -t -i:5000
kill 12612 && nohup .venv/bin/python src/app.py > server.log 2>&1 &
ss -tuln | grep 5000
curl -X POST http://localhost:5000/tts -H "Content-Type: application/json" -d @scratch/test_long_text.json --output scratch/test.wav
tail -n 20 server.log
./.venv/bin/pip list | grep gunicorn
lsof -t -i:5000 | xargs kill -9 || true
nohup ./.venv/bin/gunicorn --bind 0.0.0.0:5000 --timeout 600 --workers 1 --chdir src app:app > server.log 2>&1 &
chmod +x start.sh
tail -n 50 server.log
ls -F
./start.sh
tail -n 10 server.log
sudo -n true
sudo tee /etc/systemd/system/piper-tts.service <<EOF
[Unit]
Description=Piper TTS API Service
After=network.target
[Service]
User=deepcode
Group=deepcode
WorkingDirectory=/home/deepcode/piper
ExecStart=/home/deepcode/piper/.venv/bin/gunicorn --bind 0.0.0.0:5000 --timeout 600 --workers 1 --chdir src app:app
Restart=always
[Install]
WantedBy=multi-user.target
EOF
lsof -t -i:5000 | xargs kill -9 || true && \
sudo systemctl daemon-reload && \
sudo systemctl enable piper-tts && \
sudo systemctl start piper-tts
sudo systemctl status piper-tts
systemctl is-active piper-tts
ss -tuln | grep 5000
# Descargar Daniela (Argentina - Femenina)
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_AR/daniela/low/es_AR-daniela-low.onnx -P models/
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_AR/daniela/low/es_AR-daniela-low.onnx.json -P models/
# Descargar MLS 9972 (España - Femenina)
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/mls_9972/low/es_ES-mls_9972-low.onnx -P models/
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/mls_9972/low/es_ES-mls_9972-low.onnx.json -P models/
# Descargar Daniela (Argentina - Femenina - Alta Calidad)
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_AR/daniela/high/es_AR-daniela-high.onnx -P models/
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_AR/daniela/high/es_AR-daniela-high.onnx.json -P models/
# Descargar Carlfm (España - Masculina - Calidad Media)
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/carlfm/medium/es_ES-carlfm-medium.onnx -P models/
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/carlfm/medium/es_ES-carlfm-medium.onnx.json -P models/
./.venv/bin/python -m piper.download_voices | grep es_ES
grep -A 20 "es_" /home/deepcode/.gemini/antigravity/brain/ba25a446-4fa5-4ece-9097-0801893cbf25/.system_generated/steps/298/content.md
grep -n "Spanish" /home/deepcode/.gemini/antigravity/brain/ba25a446-4fa5-4ece-9097-0801893cbf25/.system_generated/steps/298/content.md
# Descargar Cortana (México - Femenina - Alta Calidad)
wget https://huggingface.co/HirCoir/Piper-TTS-Spanish/resolve/main/es_MX-cortana-19669-epoch-high.onnx -O models/es_MX-cortana-high.onnx
wget https://huggingface.co/HirCoir/Piper-TTS-Spanish/resolve/main/es_MX-cortana-19669-epoch-high.onnx.json -O models/es_MX-cortana-high.onnx.json
# Descargar Laura (México - Femenina - Alta Calidad)
wget https://huggingface.co/HirCoir/Piper-TTS-Laura/resolve/main/es_MX-laura-high.onnx -O models/es_MX-laura-high.onnx
wget https://huggingface.co/HirCoir/Piper-TTS-Laura/resolve/main/es_MX-laura-high.onnx.json -O models/es_MX-laura-high.onnx.json
# Descargar Davefx (España - Masculina - Muy bien entrenada)
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/davefx/medium/es_ES-davefx-medium.onnx -P models/
wget https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/davefx/medium/es_ES-davefx-medium.onnx.json -P models/
clear
sudo apt update
sudo apt install git python3 python3-pip -y
git clone https://github.com/rhasspy/piper.git
sudo apt install uv
cd piper/
ls
tree
sudo apt install tree
tree
cd src/
ls
cd python
ls
pip install -r requirements.txt 
python3 -m venv venv
sudo apt install python3.12-venv
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt 
pip install -r requirements_dev.txt 
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/medium/es_ES-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/medium/es_ES-medium.onnx.json
cd ..
cd..
cd ..
deactivate
ls
rm -Rf piper/
sudo apt update && sudo apt upgrade -y
sudo apt install git python3 python3-pip wget -y
git clone https://github.com/rhasspy/piper.git
cd piper/
ls
cd 
ls
cd ..
cd deepcode/
deepcode@deepcode:~$ cd piper/
deepcode@deepcode:~/piper$ ls
CMakeLists.txt  Dockerfile  LICENSE.md  Makefile  README.md  TRAINING.md  VERSION  VOICES.md  etc  lib  notebooks  script  src
deepcode@deepcode:~/piper$ 
ls
rm -Rf piper/
wget https://github.com/rhasspy/piper/releases/latest/download/piper_linux_x86_64.tar.gz
tar -xvf piper_linux_x86_64.tar.gz
cd piper/
ls
mkdir models
cd models/
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/medium/es_ES-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/medium/es_ES-medium.onnx.json
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/carlfm/medium/es_ES-carlfm-medium.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/x_low/es_ES-x_low.onnx.json
wget https://huggingface.co/rhasspy/piper-voices/blob/main/es/es_ES/carlfm/x_low/es_ES-carlfm-x_low.onnx
wget https://huggingface.co/rhasspy/piper-voices/blob/main/es/es_ES/carlfm/x_low/es_ES-carlfm-x_low.onnx.json
ls
rm *
ls
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/carlfm/x_low/es_ES-carlfm-x_low.onnx
wget https://huggingface.co/rhasspy/piper-voices/resolve/main/es/es_ES/carlfm/x_low/es_ES-carlfm-x_low.onnx.json
ls
ls -lh
echo "Ahora sí funciona de verdad de la buena" | ./piper --model models/es_ES-carlfm-x_low.onnx --output_file prueba.wav
ls
mkdir piper
echo "Ahora sí funciona de verdad de la buena" | ./piper --model models/es_ES-carlfm-x_low.onnx --output_file prueba.wav
ls
rm piper/
rm -R piper/
cd ~
ls
cd piper/
ls
ls piper
echo "Ahora sí funciona de verdad de la buena" | ./piper/piper --model models/es_ES-carlfm-x_low.onnx --output_file prueba.wav
ls
ls -lh piper
cd ~/piper
ls
tree
ls
ls piper
file piper
echo "Esto ya debería hablar sin problemas" | ./piper --model models/es_ES-carlfm-x_low.onnx --output_file prueba.wav
ls -lh prueba.wav
pip3 install flask gunicorn
python3 -m venv .venv
source .venv/bin/activate
pip install flask gunicorn
ls
mkdir src
cd src/
nano app.py
touch app.py
nano app.py 
curl -X POST http://localhost:5000/tts -H "Content-Type: application/json" -d '{"text":"prueba local"}' --output test.wav
sudo ufw allow 5000
exit
free -mega
free --mega
free --giga
lscpu
cat /etc/postgresql/16/main/pg_hba.conf 
sudo cat /etc/postgresql/16/main/pg_hba.conf 
who
free --giga
curl http://localhost:5001/health
sudo ufw allow 5001
ls -R /home/deepcode/sql && cat /home/deepcode/sql/bd.sql
psql --version
python3 --version && pip3 --version && node -v && npm -v
sudo apt-get update && sudo apt-get install -y postgresql postgresql-contrib
sudo systemctl start postgresql && sudo -u postgres psql -c "CREATE USER postgresql WITH PASSWORD '123456';" && sudo -u postgres psql -c "ALTER USER postgresql WITH SUPERUSER;" && sudo -u postgres psql -c "CREATE DATABASE app_db OWNER postgresql;"
sudo -u postgres psql -d app_db -f sql/bd.sql
pip3 install flask flask-cors psycopg2-binary
sudo -u postgres psql -d app_db < sql/bd.sql
python3 -m venv venv && ./venv/bin/pip install flask flask-cors psycopg2-binary
./venv/bin/python app.py
./venv/bin/python app.py
./venv/bin/python app.py
curl http://localhost:5001/health
sudo -u postgres psql -c "SHOW port;"
sudo -u postgres psql -c "SHOW config_file;" && sudo -u postgres psql -c "SHOW hba_file;"
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/16/main/postgresql.conf && sudo sed -i "s/listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/16/main/postgresql.conf
sudo cat /etc/postgresql/16/main/pg_hba.conf
echo "host    all             all             0.0.0.0/0               scram-sha-256" | sudo tee -a /etc/postgresql/16/main/pg_hba.conf && echo "host    all             all             ::/0                    scram-sha-256" | sudo tee -a /etc/postgresql/16/main/pg_hba.conf
sudo systemctl restart postgresql
sudo ufw status
curl -s https://ifconfig.me
curl http://localhost:5001/health
python3 -c "import secrets; print(secrets.token_hex(16))"
netstat -tuln | grep 5432
free ---help
free --help
free --mega
history
clea
clear
history
ls
ls _A
ls -A
clear
~/venv/bin/python ~/app.py
sudo nano /etc/systemd/system/api-postgres.service
sudo -U postgres psql
sudo -s postgres psql
sudo -s psql postgres
sudo psql -U postgres
cat /etc/passwd | grep post
sudo psql -u postgres
sudo psql -U postgres
ls
clear
sudo nano /etc/systemd/system/api-postgres.service
sudo nano /etc/systemd/system/api
sudo nano /etc/systemd/system/piper-tts.service 
sudo nano /etc/systemd/system/api-postgres.service
sudo systemctl daemon-reload 
sudo systemctl status api-postgres.service 
sudo systemctl enable api-postgres.service 
sudo nano /etc/systemd/system/piper-tts.service 
sudo systemctl enable api-postgres.service 
sudo nano /etc/systemd/system/api-postgres.service
sudo systemctl daemon-reload 
sudo systemctl enable api-postgres.service 
sudo systemctl start api-postgres.service 
cd server/
npm install
sudo -c psql -U postgres
sudo -c psql postgres
sudo -u postgres psql
sudo -u postgres psql -d app_db
clear
history -w
sudo -c psql -U postgres
sudo -c psql postgres
sudo -u postgres psql
sudo -u postgres psql -d app_db
clear
history -w
clear
cd DeepTutor/
ls
clear
ls
sudo -u postgres psql -d app_db
uptime -p
who
poweroff
exit
ss --help
clear
ss -tulpn
clear
ss -tulpn
jobs
clear
ss -tulpn | grep 5002
ss -tulpn | grep 5001
ss -tulpn | grep 5000
systemctl restart api-postgres.service 
clear
uptime -p
ps aux | grep app.py
curl -s -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" http://localhost:5001/usuarios/1
ps aux | grep app.py
curl -X GET "http://localhost:5001/usuarios?google_id=eq.113415650463101186262" -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3"
curl -X GET "http://localhost:5001/usuarios?google_id=eq.nonexistent" -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3"
curl -X GET "http://localhost:5001/usuarios?google_id=eq.113415650463101186262" -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3"
psql -U postgresql -d app_db -c "\d conversaciones"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\d conversaciones"
sudo apt update
sudo apt install build-essential curl file git   
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"   
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/$USER/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"   
brew
brew install gentle-ai
brew tap Gentleman-Programming/homebrew-tap
brew install gentle-ai
gentle-ai
clear
systemctl restart api-postgres.service 
clear
export PGPASSWORD='123456' && psql -h localhost -U postgresql -d app_db -f /home/deepcode/.gemini/antigravity/brain/b61475ac-733c-4c38-a0b6-87cc122fe88c/scratch/rag_schema.sql
cat /etc/os-release
apt search pgvector
sudo apt-get update && sudo apt-get install -y postgresql-16-pgvector
export PGPASSWORD='123456' && psql -h localhost -U postgresql -d app_db -f /home/deepcode/.gemini/antigravity/brain/b61475ac-733c-4c38-a0b6-87cc122fe88c/scratch/rag_schema.sql
export PGPASSWORD='123456' && psql -h localhost -U postgresql -d app_db -c "\d topics"
export PGPASSWORD='123456' && psql -h localhost -U postgresql -d app_db -f /home/deepcode/.gemini/antigravity/brain/b61475ac-733c-4c38-a0b6-87cc122fe88c/scratch/add_fkeys.sql
cd /home/deepcode/srv
python ingest_pdf.py
ls -l /home/deepcode/srv/rag-data/pdf/python-apuntes.pdf
export PGPASSWORD='123456' && psql -h localhost -U postgresql -d app_db -c "SELECT id, nombre FROM topics;"
python ingest_pdf.py
/home/deepcode/srv/.venv/bin/python /home/deepcode/.gemini/antigravity/brain/b61475ac-733c-4c38-a0b6-87cc122fe88c/scratch/test_search.py
journalctl -u api-postgres.service -n 50 --no-pager
/home/deepcode/venv/bin/pip install sentence-transformers torch
sudo systemctl reset-failed api-postgres.service && sudo systemctl restart api-postgres.service
systemctl status api-postgres.service
npx autoskills
ll
ls
ls sql
mkdir -p srv/rag-data
ls
cd srv/rag-data/
pip3 install pymupdf psycopg2-binary numpy
pip3 install google-generativeai
ll
cd ..
uv
sudo apt install uv
curl -sS https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/debian.griffo.io.gpg
echo "deb https://debian.griffo.io/apt $(lsb_release -sc 2>/dev/null) main" | sudo tee /etc/apt/sources.list.d/debian.griffo.io.list
sudo apt update   
sudo apt install uv
uv venv .venv
source .venv/bin/activate
uv pip3 install pymupdf psycopg2-binary numpy
uv pip install pymupdf psycopg2-binary numpy
uv pip install google-generativeai
uv pip install sentence-transformers
python ingest_pdf.py 
systemctl restart api-postgres.service 
systemctl status api-postgres.service 
systemctl restart api-postgres.service 
systemctl status api-postgres.service 
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SELECT count(*) FROM knowledge_chunks;"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SELECT id, content, length(embedding::text) as vec_len FROM knowledge_chunks LIMIT 5;"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SELECT id, left(content, 20), length(embedding::text) as vec_len FROM knowledge_chunks LIMIT 5;"
cd /home/deepcode/scratch
python3 /home/deepcode/scratch/test_query.py
/home/deepcode/venv/bin/python3 /home/deepcode/scratch/test_query.py
/home/deepcode/venv/bin/python3 /home/deepcode/scratch/test_query.py
cd /home/deepcode
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\d knowledge_chunks"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SELECT id FROM knowledge_chunks LIMIT 5;"
VEC="["$(printf '0,%.0s' {1..767})"0]"; PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SELECT id FROM knowledge_chunks ORDER BY embedding <=> '$VEC'::vector LIMIT 5;"
VEC="["$(printf '0,%.0s' {1..767})"0]"; PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SET enable_indexscan = off; SELECT id FROM knowledge_chunks ORDER BY embedding <=> '$VEC'::vector LIMIT 5;"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "DROP INDEX idx_chunks_embedding;"
cd /home/deepcode/scratch
/home/deepcode/venv/bin/python3 /home/deepcode/scratch/test_query.py
/home/deepcode/venv/bin/python3 /home/deepcode/scratch/test_query.py
/home/deepcode/venv/bin/python3 /home/deepcode/scratch/test_query.py
cd /home/deepcode
curl -X POST http://localhost:5001/ask \
           -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" \
           -H "Content-Type: application/json" \
           -d '{"question": "python", "limit": 3}'
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "SELECT * FROM topics;"
cd /home/deepcode/srv
/home/deepcode/srv/.venv/bin/pip list
uv pip uninstall fitz frontend && uv pip install pymupdf
/home/deepcode/srv/.venv/bin/python -m pip list
uv pip list
uv pip list | grep -i fitz
uv pip uninstall fitz frontend starlette uvicorn aiofiles itsdangerous && uv pip install pymupdf
uv pip install pymupdf
/home/deepcode/srv/.venv/bin/python -c "import fitz; print(fitz.__file__)"
/home/deepcode/srv/.venv/bin/python ingest_pdf.py
ls -F /home/deepcode/srv/.venv/lib/python3.12/site-packages/ | grep -i fitz
ls -F /home/deepcode/srv/.venv/lib/python3.12/site-packages/fitz/
ls -d /home/deepcode/srv/.venv/lib/python3.12/site-packages/frontend/
rm -rf /home/deepcode/srv/.venv/lib/python3.12/site-packages/fitz; uv pip install --force-reinstall pymupdf
/home/deepcode/srv/.venv/bin/python -c "import fitz; print(fitz.version)"
/home/deepcode/srv/.venv/bin/python ingest_pdf.py
psql -h localhost -U postgresql -d app_db -c "SELECT count(*) FROM knowledge_chunks;"
/home/deepcode/venv/bin/python3 /home/deepcode/srv/ingest_pdf.py
cd srv/
source .venv/bin/activate
uv pip install fitz
python ingest_pdf.py 
uv pip install frontend
python ingest_pdf.py 
uv pip uninstall fitz frontend
uv pip install pymupdf
python ingest_pdf.py 
systemctl restart api-postgres.service 
cd /home/deepcode/DeepTutor
lsb_release -a && dpkg -l | grep -E "phppgadmin|postgresql|apache2|nginx"
dpkg -l | grep -E "apache2|php"
apt-cache search phppgadmin
sudo apt-get update && sudo apt-get install -y phppgadmin apache2 php libapache2-mod-php
ls /etc/apache2/conf-enabled/phppgadmin.conf || ls /etc/apache2/conf-available/phppgadmin.conf
ls /etc/postgresql/16/main/pg_hba.conf
sudo sed -i 's/Require local/Require all granted/' /etc/apache2/conf-enabled/phppgadmin.conf && sudo sed -i "s/\$conf\['extra_login_security'\] = true;/\$conf\['extra_login_security'\] = false;/" /etc/phppgadmin/config.inc.php
sudo systemctl restart apache2 && sudo systemctl restart postgresql
dpkg -l | grep php-pgsql
sudo ss -tulpn | grep 80
sudo -u postgres psql -c "ALTER USER postgres PASSWORD '123456';"
sudo ufw status
history
history -w
history
history -w
history
ll
nano test.txt
systemctl status api-postgres.service 
systemctl status api-postgres.service 
sudo ss -tulpn | grep 80
sudo ss -tulpn
id sandbox_user
ls /etc/sudoers.d/sandbox
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@test.py" http://localhost:5002/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@test.py" http://localhost:5002/execute
php -v
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@test.php" http://localhost:5002/execute
# Wait for API and test JS
sleep 5
python3 --version && node --version && java -version && javac -version
sudo apt-get update && sudo apt-get install -y default-jdk
systemctl --user status flask_api.service
cd /home/deepcode/scratch
cat <<EOF > test_py.py
print("Hola desde Python")

EOF

cat <<EOF > test_js.js
console.log("Hola desde Javascript");

EOF

cat <<EOF > HolaMundo.java
public class HolaMundo {

    public static void main(String[] args) {

        System.out.println("Hola desde Java");

    }

}

EOF

cd /home/deepcode
source venv/bin/activate && python3 app.py
curl -s http://localhost:5001/health
API_KEY="806bfc1ea9173997e05e9d23263556b3"
URL="http://localhost:5001/execute"
echo "Testing Python:"
curl -X POST -H "X-API-Key: \$API_KEY" -F "file=@scratch/test_py.py" \$URL
echo -e "\nTesting Javascript:"
curl -X POST -H "X-API-Key: \$API_KEY" -F "file=@scratch/test_js.js" \$URL
echo -e "\nTesting Java:"
curl -X POST -H "X-API-Key: \$API_KEY" -F "file=@scratch/HolaMundo.java" \$URL
# Test Python
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_py.py" http://localhost:5001/execute
echo ""
# Test JS
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_js.js" http://localhost:5001/execute
echo ""
# Test Java
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/HolaMundo.java" http://localhost:5001/execute
# Test Python
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_py.py" http://localhost:5001/execute
echo "---"
# Test JS
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_js.js" http://localhost:5001/execute
echo "---"
# Test Java
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/HolaMundo.java" http://localhost:5001/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_py.py" http://localhost:5001/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_js.js" http://localhost:5001/execute
which node && node --version
source venv/bin/activate && python3 -c "import shutil; print(shutil.which('node'))"
source venv/bin/activate && python3 app.py
# Test JS again
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_js.js" http://localhost:5001/execute
pkill -f "python3 app.py" || true
source venv/bin/activate && python3 app.py
ps aux | grep gunicorn
lsof -i :5001
kill -9 14235 47639 || true
source venv/bin/activate && python3 app.py
sudo fuser -k 5001/tcp || true
source venv/bin/activate && python3 app.py
source venv/bin/activate && FLASK_RUN_PORT=5002 python3 app.py
source venv/bin/activate && python3 app.py
lsof -i :5002
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_py.py" http://localhost:5002/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_js.js" http://localhost:5002/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/HolaMundo.java" http://localhost:5002/execute
pkill -f "python3 app.py" || true && sleep 1 && lsof -i :5002 -t | xargs kill -9 || true && sleep 1 && source venv/bin/activate && python3 app.py
pkill -f "python3 app.py" || true && sleep 1 && lsof -i :5002 -t | xargs kill -9 || true && sleep 1 && source venv/bin/activate && python3 app.py
cat <<EOF > scratch/test_multi_input.py
a = input()

b = input()

print(f"Resultado: {a} y {b}")

EOF

sleep 5
# Test multi input with multiple -F
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" \
     -F "file=@scratch/test_multi_input.py" \
     -F "input=Valor1" \
     -F "input=Valor2" \
     http://localhost:5002/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" \
     -F "file=@scratch/test_multi_input.py" \
     -F "input=Valor1" \
     -F "input=Valor2" \
     http://localhost:5002/execute
pkill -f "python3 app.py" || true && sleep 1 && lsof -i :5002 -t | xargs kill -9 || true && sleep 1 && source venv/bin/activate && python3 app.py
# Test with requested structure
sleep 5
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" \
     -F "file=@scratch/test_multi_input.py" \
     -F "input=['aaaaa','bbbb']" \
     http://localhost:5002/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" \
     -F "file=@scratch/test_multi_input.py" \
     -F "input=['aaaaa','bbbb']" \
     http://localhost:5002/execute
sudo apt update && sudo apt install lua5.4 -y
systemctl status api-postgres.service 
systemctl restart api-postgres.service 
systemctl status api-postgres.service 
sudo ss -tulpn | grep 5002
sudo ss -tulpn | grep 5001
systemctl status api-postgres.service 
systemctl restart api-postgres.service 
sudo ss -tulpn | grep 5001
sudo ss -tulpn | grep 5002
systemctl status api-postgres.service 
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/test_js.js" http://localhost:5002/execute
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@scratch/HolaMundo.java" http://localhost:5002/execute
docker --version && docker ps
sudo useradd -m sandbox_user && sudo passwd -d sandbox_user
firejail --version || nsjail --version || unshare --version
unshare -n echo "hola"
echo "deepcode ALL=(sandbox_user) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/sandbox_user
sudo -u sandbox_user node -v
which python3 && which node && which java && which javac
sudo -u sandbox_user /home/deepcode/.nvm/versions/node/v24.15.0/bin/node -v
ls -ld /home/deepcode /home/deepcode/.nvm /home/deepcode/.nvm/versions/node/v24.15.0/bin/node
sudo setfacl -m u:sandbox_user:x /home/deepcode
sudo apt-get update && sudo apt-get install -y nodejs
which nodejs && nodejs -v
pkill -f "python3 app.py" || true && sleep 2 && lsof -i :5002 -t | xargs kill -9 || true && sleep 1 && source venv/bin/activate && python3 app.py
cat <<EOF > scratch/test_input.py
name = input()

print(f"Hola, {name}!")

EOF

# Test input
sleep 5
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" \
     -F "file=@scratch/test_input.py" \
     -F "input=Antigravity" \
     http://localhost:5002/execute
ls
cat 'curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@test.py" http://localhost:5001/execute'
history -w
nano test-curl.txt
which lua5.4 || which lua5.3 || which lua
which php
curl -X POST http://68.221.175.191:5001/execute -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@test.lua" -F "input='HOLA'"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\dt"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\d user_ejer"
ps aux | grep app.py
systemctl --user list-units --type=service | grep deeptutor
curl -X GET http://localhost:5001/user_ejer -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\dt ejer*"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\dt"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\dt Ejercicios_Usuarios"
PGPASSWORD=123456 psql -h localhost -U postgresql -c "\l"
tail -n 50 ~/.bash_history
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\dt *ejer*"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\dt"
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\d user_ejer"
cd /home/deepcode/DeepTutor
grep -r "Pista" /home/deepcode/DeepTutor | grep -v "node_modules"
grep -r "lightbulb" /home/deepcode/DeepTutor | grep -v "node_modules"
grep -ri "Pista" /home/deepcode/DeepTutor | grep -v "node_modules"
psql -h localhost -U postgresql -d app_db -c "\dt"
ls
npx skills add https://github.com/github/awesome-copilot --skill documentation-writer
tree
tree | grep *sh
tree | grep *js
tree | grep ".sh"
tree | grep "\.sh"
tree | grep "\.ipynb"
git config --global user.name "MarcRoviraP"
git config --global user.email "marcrovira2eso1@gmail.com"
systemctl status api-postgres.service 
systemctl restart api-postgres.service 
systemctl status api-postgres.service 
systemctl status  piper-tts.service 
systemctl status api-postgres.service 
ls -F /home/deepcode/DeepTutor/server
cd /home/deepcode/server
ls -F /home/deepcode/server
cd /home/deepcode
find /home/deepcode -name "*.py" -not -path "*/venv/*" -not -path "*/node_modules/*"
cd /home/deepcode/piper
ls -R /home/deepcode/piper | grep ".py"
ls -R /home/deepcode
ls -la /home/deepcode
cd /home/deepcode/piper
ls -F /home/deepcode/piper
cd /home/deepcode/DeepTutor
ls -F /home/deepcode/DeepTutor
cd /home/deepcode
du -sh /home/deepcode/*
ls -d .git
cd /home/deepcode/srv
ls -F /home/deepcode/srv
cd /home/deepcode
pg_dump -s app_db > /home/deepcode/sql/schema.sql
/home/deepcode/venv/bin/pip freeze
git init && git add . && git commit -m "Initial commit: DeepTutor Server Blueprint"
git status
git add .gitignore .env.example README.md app.py documentacion.md requirements.txt sql/ DeepTutor/ server/ srv/ piper/src/ && git commit -m "Initial commit: DeepTutor Server Infrastructure"
ls -d DeepTutor/.git server/DeepTutor/.git
du -sh DeepTutor server/DeepTutor
git rm --cached DeepTutor server/DeepTutor && rm -rf DeepTutor/.git server/DeepTutor/.git && git add DeepTutor server/DeepTutor && git commit -m "Flattened submodules into a single monorepo for easier replication"
journalctl -u api-postgres.service -n 50 --no-pager
/home/deepcode/venv/bin/pip install python-dotenv
sudo systemctl restart api-postgres.service
systemctl status api-postgres.service
systemctl status piper-tts.service
/home/deepcode/piper/.venv/bin/pip install python-dotenv && sudo systemctl restart piper-tts.service
systemctl status api-postgres.service piper-tts.service --no-pager
git add . && git commit -m "Fixed missing dependency and refactored Piper API"
curl -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" "http://localhost:5001/ejercicios/stats?topic_id=eq.6"
python3 -c "import psycopg2, os; from dotenv import load_dotenv; load_dotenv(); conn = psycopg2.connect(host=os.getenv('DB_HOST', 'localhost'), database=os.getenv('DB_NAME', 'app_db'), user=os.getenv('DB_USER', 'postgresql'), password=os.getenv('DB_PASS', '123456'), port=int(os.getenv('DB_PORT', 5432))); cur=conn.cursor(); cur.execute('SELECT COUNT(*) FROM ejercicios;'); print('Ejercicios:', cur.fetchone()[0]); cur.execute('SELECT topic_id, count(*) FROM ejercicios GROUP BY topic_id;'); print('Grouped:', cur.fetchall()); cur.close(); conn.close()"
/home/deepcode/srv/.venv/bin/python -c "import psycopg2, os; from dotenv import load_dotenv; load_dotenv(); conn = psycopg2.connect(host=os.getenv('DB_HOST', 'localhost'), database=os.getenv('DB_NAME', 'app_db'), user=os.getenv('DB_USER', 'postgresql'), password=os.getenv('DB_PASS', '123456'), port=int(os.getenv('DB_PORT', 5432))); cur=conn.cursor(); cur.execute('SELECT COUNT(*) FROM ejercicios;'); print('Ejercicios:', cur.fetchone()[0]); cur.execute('SELECT topic_id, count(*) FROM ejercicios GROUP BY topic_id;'); print('Grouped:', cur.fetchall()); cur.close(); conn.close()"
/home/deepcode/venv/bin/python -c "import psycopg2, os; from dotenv import load_dotenv; load_dotenv(); conn = psycopg2.connect(host=os.getenv('DB_HOST', 'localhost'), database=os.getenv('DB_NAME', 'app_db'), user=os.getenv('DB_USER', 'postgresql'), password=os.getenv('DB_PASS', '123456'), port=int(os.getenv('DB_PORT', 5432))); cur=conn.cursor(); cur.execute('SELECT COUNT(*) FROM ejercicios;'); print('Ejercicios:', cur.fetchone()[0]); cur.execute('SELECT topic_id, count(*) FROM ejercicios GROUP BY topic_id;'); print('Grouped:', cur.fetchall()); cur.close(); conn.close()"
ps aux | grep python
curl -i http://localhost:5001/health
curl -i -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" http://localhost:5001/ejercicios/stats
curl -i -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" "http://localhost:5001/ejercicios/stats?topic_id=eq.6"
curl -i -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" "http://localhost:5001/ejercicios/stats?topic_id=eq.99"
curl -i http://localhost:5001/ejercicios/stats
python
python3
ll
python3 test.py 
python
python3
python3 --version
python3 -c "import psycopg2; conn=psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur=conn.cursor(); cur.execute('SELECT COUNT(t.*) as num_ejercicios, t.nombre FROM topics t RIGHT JOIN ejercicios e on t.id = e.topic_id GROUP BY t.nombre'); print(cur.fetchall())"
venv/bin/python3 -c "import psycopg2; conn=psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur=conn.cursor(); cur.execute('SELECT COUNT(t.*) as num_ejercicios, t.nombre FROM topics t RIGHT JOIN ejercicios e on t.id = e.topic_id GROUP BY t.nombre'); print(cur.fetchall())"
git log -n 5
ps aux | grep app.py
curl -i -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" http://localhost:5001/topics/stats
python3 -c "print(0.28 * 100)"
node -e "console.log(0.28 * 100)"
lua5.4 -e "print(0.28 * 100)" || lua -e "print(0.28 * 100)"
ps aux | grep python
/home/deepcode/venv/bin/python /home/deepcode/scratch/test_execute_api.py
curl -X POST -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" -F "file=@/home/deepcode/test.py" -F "input=$'1\r\n\r\n2 3 2\r\n2\r\n'" http://localhost:5001/execute
/home/deepcode/venv/bin/python /home/deepcode/scratch/test_execute_api.py
/home/deepcode/venv/bin/python /home/deepcode/scratch/test_execute_api.py
cd DeepTutor/
npm run build
cd client/
npm run build
npm run deb
npm run dev
npm run dev --host
npm run dev --host 5173
npm run dev
pg_lsclusters
sudo tail -n 50 /var/log/postgresql/postgresql-16-main.log
sudo systemctl status api-postgres
sudo ufw allow 5173
ps aux | grep postgres
sudo kill -9 24181
sudo systemctl status postgresql@16-main
journalctl -u api-postgres -n 30
curl -X OPTIONS -H "Origin: http://localhost:5173" -H "Access-Control-Request-Method: GET" -H "Access-Control-Request-Headers: X-API-Key" -I http://localhost:5001/ejercicios
python3 -c "import psycopg2, os; conn = psycopg2.connect(host=os.getenv('DB_HOST', 'localhost'), database=os.getenv('DB_NAME', 'app_db'), user=os.getenv('DB_USER', 'postgresql'), password=os.getenv('DB_PASS', '123456'), port=int(os.getenv('DB_PORT', 5432))); cur = conn.cursor(); cur.execute('SELECT id, nombre FROM topics ORDER BY id;'); [print(f'{r[0]} – {r[1]}') for r in cur.fetchall()]; cur.close(); conn.close()"
/home/deepcode/venv/bin/python -c "import psycopg2, os; conn = psycopg2.connect(host=os.getenv('DB_HOST', 'localhost'), database=os.getenv('DB_NAME', 'app_db'), user=os.getenv('DB_USER', 'postgresql'), password=os.getenv('DB_PASS', '123456'), port=int(os.getenv('DB_PORT', 5432))); cur = conn.cursor(); cur.execute('SELECT id, nombre FROM topics ORDER BY id;'); [print(f'{r[0]} – {r[1]}') for r in cur.fetchall()]; cur.close(); conn.close()"
curl -i -X OPTIONS http://localhost:5001/ejercicios
curl -i -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" http://localhost:5001/ejercicios
sudo systemctl status postgresql
ps aux | grep postgres
pstree -ap postgres
sudo ls -l /proc/2766/exe /proc/2679/exe /proc/25978/exe
sudo rm -rf /tmp/init /tmp/mysql && sudo kill -9 2679 2766 25978 && sudo crontab -u postgres -l
ps aux | grep postgres
python3 -c "import psycopg2; conn = psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur = conn.cursor(); cur.execute('SELECT * FROM ejercicios LIMIT 1;'); row = cur.fetchone(); print('Columns:', [desc[0] for desc in cur.description]); print('Row:', row)"
venv/bin/python -c "import psycopg2; conn = psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur = conn.cursor(); cur.execute('SELECT * FROM ejercicios LIMIT 1;'); row = cur.fetchone(); print('Columns:', [desc[0] for desc in cur.description]); print('Row:', row)"
venv/bin/python -c "import psycopg2; conn = psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur = conn.cursor(); cur.execute('SELECT * FROM casos_prueba LIMIT 5;'); rows = cur.fetchall(); print('Rows in casos_prueba table:', len(rows)); [print(row) for row in rows]"
venv/bin/python -c "import psycopg2; conn = psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur = conn.cursor(); cur.execute('SELECT COUNT(*), COUNT(casos_prueba) FROM ejercicios;'); print(cur.fetchone())"
ps aux | grep python
curl -s -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" http://localhost:5001/health
venv/bin/python -c "import psycopg2; conn = psycopg2.connect('host=localhost dbname=app_db user=postgresql password=123456 port=5432'); cur = conn.cursor(); cur.execute('SELECT id, nombre FROM topics LIMIT 10;'); [print(row) for row in cur.fetchall()]"
ps aux | grep node
pm2 list
ss -lnt
curl -I http://localhost
ls -la /etc/apache2/sites-enabled/
cat /etc/apache2/sites-available/000-default.conf
ls -la /var/www/html
ls -la /etc/systemd/system | grep -i tutor
ls -la /etc/systemd/system
cat /etc/systemd/system/api-postgres.service
head -n 50 /var/www/html/index.html
sudo systemctl restart api-postgres
curl -X OPTIONS -H "Origin: http://localhost:5173" -H "Access-Control-Request-Method: GET" -H "Access-Control-Request-Headers: X-API-Key" -I http://localhost:5001/ejercicios
sudo systemctl status api-postgres
sudo systemctl status postgresql@16-main
pg_lsclusters
sudo pg_ctlcluster 16 main start
pg_lsclusters
curl -i -H "X-API-Key: 806bfc1ea9173997e05e9d23263556b3" http://localhost:5001/ejercicios
PGPASSWORD=123456 psql -h localhost -U postgresql -d app_db -c "\d ejercicios"
sudo systemctl restart api-postgres
cd DeepTutor/
cd client/
npm run dev
cd client/
cd DeepTutor/
cd client/
npm run dev
ll
npm run dev
cd web
mkdir web
cd web
git clone https://github.com/MarcRoviraP/deeptutor
pnpm install
sudo apt install pnpm
npm --version
sudo apt install pnpm
sudo apt --fix-broken install
sudo dpkg --configure -a
sudo apt install pnpm
npm install -g pnpm
pnpm install
cd deeptutor/
pnpm install
pnpm run dev
ip a
cd /home/deepcode/web/deeptutor
pnpm approve-builds
git diff package.json
git diff
pnpm install
pnpm run dev
lsof -i :5173 || true; lsof -i :5002 || true
pnpm run dev
lsof -i :5000
ps aux | grep gunicorn
ls -la /home/deepcode/web/deeptutor
systemctl list-units --type=service | grep -E -i "gunicorn|piper|tutor|app"
systemctl cat piper-tts.service
find . -maxdepth 3 -name ".env*"
lsof -i :5001
ps aux | grep 5001
ps aux | grep python
env | grep -E "GEMINI|GROQ"
pnpm run dev
lsof -i :5173
ps aux | grep -E "node|vite"
pnpm run dev
pnpm run build
pnpm run build:client
pnpm run start
cd ~
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
caddy --versiob
caddy --version
cd  web
cd  deeptutor/
ll
pwd
sudo nano /etc/caddy/Caddyfile
sudo systemctl restart caddy
sudo systemctl status caddy
sudo systemctl stop apache2.service 
sudo systemctl disabled apache2.service 
sudo systemctl disable apache2.service 
sudo systemctl restart caddy
sudo systemctl status caddy
sudo nano /etc/caddy/Caddyfile
sudo systemctl restart caddy
sudo systemctl status caddy
pnpm run start
ss -tulpn | grep 5173
ss -tulpn | grep 5002
pnpm run start
pnpm install
pnpm build
pnpm start
pnpm build:client
pnpm start
curl ifconfig.me
ping deeptutor.duckdns.org
ping http://deeptutor.duckdns.org
curl http://localhost:3000
curl http://localhost:5002
curl http://localhost:5173
sudo ss -tulpn | grep 5002
sudo systemctl status caddy
sudo cat /etc/caddy/Caddyfile
sudo caddy validate --config /etc/caddy/Caddyfile
sudo systemctl restart caddy
journalctl -u caddy --no-pager | tail -50
sudo cat /etc/caddy/Caddyfile
sudo nano /etc/caddy/Caddyfile
sudo systemctl restart caddy
sudo systemctl restart caddy
sudo systemctl status caddy
sudo systemctl status caddy
curl -I http://localhost:5173/dashboard/src/ui.js
curl -I http://localhost:5002/dashboard/src/ui.js
pnpm --filter deep-tutor-web add -D tailwindcss @tailwindcss/postcss postcss
pnpm --filter deep-tutor-web add -D @tailwindcss/vite
curl -s http://localhost:5173/dashboard/style.css | head -n 30
ps aux | grep node
sudo -n ss -tulpn
journalctl -u caddy -n 50 --no-pager
kill 62294
ps aux | grep node
kill -9 62313 59729 62418 62430 59873
curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: deeptutor.duckdns.org" -H "Origin: https://deeptutor.duckdns.org" -H "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" -H "Sec-WebSocket-Version: 13" http://127.0.0.1:5002/dashboard/
journalctl -u caddy -n 20 --no-pager
curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: deeptutor.duckdns.org" -H "Origin: https://deeptutor.duckdns.org" -H "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" -H "Sec-WebSocket-Version: 13" https://deeptutor.duckdns.org/dashboard/
curl --http1.1 -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: deeptutor.duckdns.org" -H "Origin: https://deeptutor.duckdns.org" -H "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" -H "Sec-WebSocket-Version: 13" https://deeptutor.duckdns.org/dashboard/
sudo systemctl status caddy
sudo ss -tulpn | grep :80
curl -I http://127.0.0.1
sudo -n lsof -i :80
ps aux | grep caddy
sudo -n ss -tulpn
sudo systemctl status caddy
sudo journalctl -u caddy --no-pager | tail -25
ps aux | grep node
sudo -n ss -tulpn
curl -I http://localhost:5002
curl -I http://localhost:5002/dashboard/
curl -I -H "Host: deeptutor.duckdns.org" http://localhost:5002/dashboard/
pnpm run dev
pnpm run dev
sudo -n ss -tulpn | grep -E '5173|5002'
pnpm run dev
curl --http2 -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: deeptutor.duckdns.org" -H "Origin: https://deeptutor.duckdns.org" -H "Sec-WebSocket-Key: SGVsbG8sIHdvcmxkIQ==" -H "Sec-WebSocket-Version: 13" https://deeptutor.duckdns.org/dashboard/
ls -l /etc/caddy/Caddyfile
sudo cp /home/deepcode/web/deeptutor/Caddyfile.tmp /etc/caddy/Caddyfile && sudo systemctl reload caddy
rm Caddyfile.tmp
journalctl -u caddy -n 20 --no-pager
journalctl -u caddy -n 30 --no-pager
pnpm run dev
pnpm install -D tailwindcss @tailwindcss/postcss postcss
npm install -D tailwindcss @tailwindcss/postcss postcss
pnpm run dev
sudo ss -tulpn | grep 5002
kill -9 49239
pnpm run dev
kill -9 49239
sudo ss -tulpn | grep 5002
sudo ss -tulpn | grep 5173
kill -9 48666
pnpm run dev
sudo ss -tulpn | grep 5173
sudo ss -tulpn | grep 5002
kill -9 56383
pnpm run dev
pnpm run build:client
pnpm run dev
sudo ss -tulpn | grep 5002
kill -9 59885
sudo ss -tulpn | grep 5173
kill -9 59866
sudo ss -tulpn | grep 5173
pnpm run dev
sudo ss -tulpn | grep 5173
pnpm run dev
vite
pnpm run dev
sudo ss -tulpn | grep 5173
sudo ss -tulpn | awk '/:5173/ {match($0, /pid=([0-9]+)/, a); print a[1]}' | xargs -r sudo kill -9
sudo ss -tulpn | awk '/:5002/ {match($0, /pid=([0-9]+)/, a); print a[1]}' | xargs -r sudo kill -9
pnpm run dev
pnpm run build:client
pnpm run dev
pnpm run start
pnpm --filter deep-tutor-web build
pnpm run start
cd web/deeptutor/
pnpm run start
sudo systemctl status deeptutor.service --no-pager
sudo systemctl status deeptutor.service
sudo systemctl status deeptutor.service --no-pager
sudo systemctl restart deeptutor.service
sudo systemctl status 
sudo systemctl status deeptutor.service 
sudo tee /etc/systemd/system/deeptutor.service > /dev/null <<'EOF'
[Unit]

Description=DeepTutor Frontend Service

After=network.target



[Service]

Type=simple

User=deepcode

WorkingDirectory=/home/deepcode/web/deeptutor

ExecStart=/usr/bin/pnpm run start

Restart=always

RestartSec=5



[Install]

WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload
sudo systemctl enable --now deeptutor.service
sudo systemctl status deeptutor.service --no-pager
sudo tee /etc/systemd/system/deeptutor.service > /dev/null <<'EOF'
[Unit]

Description=DeepTutor Frontend Service

After=network.target



[Service]

Type=simple

User=deepcode

WorkingDirectory=/home/deepcode/web/deeptutor

ExecStart=/usr/bin/env bash -c 'pnpm run start'

Restart=always

RestartSec=5



[Install]

WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload
sudo systemctl restart deeptutor.service
which pnpm
sudo systemctl status deeptutor.service --no-pager
sudo tee /etc/systemd/system/deeptutor.service > /dev/null <<'EOF'
[Unit]

Description=DeepTutor Frontend Service

After=network.target



[Service]

Type=simple

User=deepcode

WorkingDirectory=/home/deepcode/web/deeptutor

ExecStart=/usr/bin/env bash -c "pnpm run start"

Restart=always

RestartSec=5



[Install]

WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload
sudo tee /etc/systemd/system/deeptutor.service > /dev/null <<'EOF'
[Unit]

Description=DeepTutor Frontend Service

After=network.target



[Service]

Type=simple

User=deepcode

WorkingDirectory=/home/deepcode/web/deeptutor

ExecStart=/home/deepcode/.nvm/versions/node/v24.15.0/bin/pnpm run start

Restart=always

RestartSec=5



[Install]

WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload
sudo systemctl restart deeptutor.service
sudo systemctl status deeptutor.service --no-pager
sudo tee /etc/systemd/system/deeptutor.service > /dev/null <<'EOF'
[Unit]

Description=DeepTutor Frontend Service

After=network.target



[Service]

Type=simple

User=deepcode

WorkingDirectory=/home/deepcode/web/deeptutor

ExecStart=/bin/bash -lc 'pnpm run start'

Restart=always

RestartSec=5



[Install]

WantedBy=multi-user.target

EOF

sudo systemctl daemon-reload
sudo systemctl restart deeptutor.service
sudo systemctl status deeptutor.service --no-pager
cls
clear
systemctl status deeptutor.service 
nano /etc/systemd/system
nano /etc/systemd/system/deeptutor.service 
ls
ls scripts/
ls web/
ls web/deeptutor/
nano .bashrc
clear
sudo systemctl status deeptutor.service 
ls scripts/
sudo su -
ll
sudo nano /etc/systemd/system/deeptutor.service 
systemctl status deeptutor.service 
clear
nano scripts/deeptutor_run.sh 
which bash
clear
ls
nano /etc/systemd/system/deeptutor.service 
systemctl status deeptutor.service 
nano /etc/systemd/system/deeptutor.service 
sudo nano /etc/systemd/system/deeptutor.service 
systemctl restart deeptutor.service 
systemctl status deeptutor.service 
systemctl restart deeptutor.service 
systemctl status deeptutor.service 
sudo nano /etc/systemd/system/deeptutor.service 
systemctl status deeptutor.service 
systemctl daemon-reload 
systemctl status deeptutor.service 
nano ~/scripts/deeptutor_run.sh
mkdir -p ~/scripts
nano ~/scripts/deeptutor_run.sh
chmod +x ~/scripts/deeptutor_run.sh
nano ~/scripts/deeptutor_run.sh
sudo nano /etc/systemd/system/deeptutor.service 
pwd ~/scripts/deeptutor_run.sh
sudo nano /etc/systemd/system/deeptutor.service 
systemctl daemon-reload 
systemctl restart deeptutor.service 
systemctl status deeptutor.service 
/bin/bash /home/deepcode/scripts/deeptutor_run.sh
su -
sudo root
su root
sudo su
whereis pnpm
sudo nano /etc/systemd/system/deeptutor.service 
nano ~/scripts/deeptutor_run.sh 
systemctl daemon-reload 
systemctl status deeptutor.service 
systemctl restart deeptutor.service 
systemctl status deeptutor.service 
sudo su
whereis pnpm
sudo nano /etc/systemd/system/deeptutor.service 
systemctl restart deeptutor.service 
systemctl daemon-reload 
systemctl status deeptutor.service 
systemctl status deeptutor.service  --verbose
cd /
/bin/bash /home/deepcode/scripts/deeptutor_run.sh
systemctl status deeptutor.service 
systemctl stop deeptutor.service 
systemctl start deeptutor.service 
systemctl status deeptutor.service 
cp /home/deepcode/ico.svg /home/deepcode/web/deeptutor/client/public/favicon.svg
systemctl restart deeptutor.service 

systemctl restart deeptutor.service 
rm /home/deepcode/ico.png 
cp -f /home/deepcode/ico.png /home/deepcode/web/deeptutor/client/public/favicon.png
sudo su
cd /home/deepcode/web/
pnpm build:client
cd deeptutor/
pnpm build:client
sudo su
pnpm --filter deep-tutor-web build
sudo su
journalctl -u deeptutor.service -n 50 --no-pager
cat /etc/systemd/system/deeptutor.service
/home/deepcode/.nvm/versions/node/v24.15.0/bin/node -v
systemctl restart deeptutor.service
systemctl status deeptutor.service
find . -maxdepth 3 -name "*.html" -not -path "*/node_modules/*" -not -path "*/dist/*"
git status
git diff --stat
find client/public public -maxdepth 2 -type f 2>/dev/null || true
journalctl -u deeptutor.service -n 50 --no-pager
systemctl status deeptutor.service
find . -maxdepth 2 -not -path '*/.*' -not -path './node_modules*' -not -path './client/node_modules*'
find client/dist -maxdepth 2 -type f 2>/dev/null || true
find . -name "favicon.png" -o -name "favicon.svg" -not -path "*/node_modules/*"
find deep-tutor-web/dist -maxdepth 2 -type f 2>/dev/null || true
cp client/public/favicon.png public/favicon.png
systemctl cat deeptutor.service
ss -tulpn | grep -E "5000|5002|5173" || true
find . -name "*.env" -o -name ".env*" -not -path "*/node_modules/*"
curl -I http://localhost:5002/favicon.png
curl -I http://localhost:5002/dashboard/favicon.png
git status
cd /home/deepcode/web/deeptutor
systemctl status deeptutor || systemctl list-units | grep deeptutor
journalctl -u deeptutor -n 50 --no-pager
journalctl -u deeptutor -n 25 --no-pager
ss -tuln
pnpm --filter deep-tutor-web dev
find . -name "rules.md" -o -name "skills.md"
git status
git diff HEAD -- deep-tutor-web/src/views/chat.js
git log --follow --name-status -n 5 -- deep-tutor-web/assets/mentor/rules.md
git log -p -n 5 -- deep-tutor-web/vite.config.js
git log -S "rules.md" -p -- deep-tutor-web/src/views/chat.js
git status
mkdir -p deep-tutor-web/public/assets && mv deep-tutor-web/assets/mentor deep-tutor-web/public/assets/
git status
find . -name "*.py"
find /home/deepcode -maxdepth 3 -name "*.py" -not -path "*/node_modules/*" -not -path "*/.git/*" -not -path "*/.gemini/*"
sudo systemctl restart deeptutor
systemctl status deeptutor
sleep 3 && systemctl status deeptutor
pwsd
pwd
sudo su
cd /home/deepcode/web/
cd deeptutor/
pnpm --filter deep-tutor-web build
pnpm run test:validation
pnpm --filter deep-tutor-web build
pnpm build server
pnpm build:server
pnpm run start
pnpm --filter deep-tutor-web build
pnpm build:server
pnpm dev
pnpm install
pnpm dev
sudo su
curl -i http://68.221.175.191:5001/health
curl -i http://localhost:5002/health
find . -name "*.py"
curl -i http://localhost:5002/health
ps aux | grep node
systemctl status deeptutor.service
sudo systemctl restart deeptutor.service
curl -i http://localhost:5002/health
journalctl -u deeptutor.service -n 50
curl -i http://localhost:5002/health
pnpm run test:validation
pnpm run test:validation
pnpm run test:validation
pnpm run test:validation
pnpm run test:validation
sudo systemctl restart deeptutor.service
sleep 4 && cat /home/deepcode/web/deeptutor/deep-tutor-web/dist/assets/mentor/rules.md
journalctl -u deeptutor.service -n 50
pnpm --filter deep-tutor-web build
cat /home/deepcode/web/deeptutor/deep-tutor-web/dist/assets/mentor/rules.md
pnpm run test:validation
sudo -u sandbox_user cat /home/deepcode/web/deeptutor/server/.env
sudo -u sandbox_user ls -la /home/deepcode/web/deeptutor/server
ls -la /home/deepcode
sudo -u sandbox_user curl -I http://localhost:5002/health
which bwrap
sudo unshare --net sudo -u sandbox_user curl -I http://localhost:5002/health
sudo -u sandbox_user unshare --net curl -I http://localhost:5002/health
ps aux | grep app.py
sudo -l
sudo unshare --net runuser -u sandbox_user -- curl -I http://localhost:5002/health
sudo unshare --net runuser -u sandbox_user -- python3 -c "import urllib.request; urllib.request.urlopen('http://localhost:5002/health')"
sudo unshare --net --pid --fork --mount-proc runuser -u sandbox_user -- ps aux
sudo unshare --net --pid --fork --mount-proc runuser -u sandbox_user -- ls -la /home/deepcode
sudo -n unshare --net --pid --fork --mount-proc runuser -u sandbox_user -- ls
sudo -n unshare --net --pid --fork --mount-proc runuser -u sandbox_user -- python3 -c "print('hello from sandbox')"
sudo -n unshare --net --pid --fork --mount-proc runuser -u sandbox_user -- ls -la /tmp
sudo -n unshare --net --pid --fork --ipc --mount-proc runuser -u sandbox_user -- python3 -c "print('hello from sandbox')"
echo "public class Hello { public static void main(String[] args) { System.out.println(\"Hello Java\"); } }" > /tmp/Hello.java && javac /tmp/Hello.java && sudo -n unshare --net --pid --fork --ipc --mount-proc runuser -u sandbox_user -- java -cp /tmp Hello
echo "print('Hello Lua')" > /tmp/hello.lua && sudo -n unshare --net --pid --fork --ipc --mount-proc runuser -u sandbox_user -- lua /tmp/hello.lua
systemctl list-units --type=service | grep -E -i "app|flask|db|tutor"
pm2 list || supervisorctl status
ps -ef | grep app.py
systemctl status 818
sudo systemctl restart api-postgres.service
pnpm run test:validation
systemctl status api-postgres.service
sleep 5 && pnpm run test:validation
sudo ss -tulpn | grep -E "5001|5002|5173"
ps -fp 139568
systemctl status deeptutor.service
curl -I http://localhost:5002 && curl -I http://localhost:5002/dashboard/
systemctl list-units --type=service | grep -E -i "nginx|caddy|apache"
cat /etc/caddy/Caddyfile
systemctl status caddy
curl -Iv https://deeptutor.duckdns.org/
host deeptutor.duckdns.org || nslookup deeptutor.duckdns.org
sudo systemctl stop deeptutor.service
sudo ss -tulpn | grep 5002
ps aux | grep node
sudo systemctl start deeptutor.service
sleep 3 && sudo ss -tulpn | grep 5002
systemctl status deeptutor.service
sudo ss -tulpn | grep 5002
grep -rn "duckdns" /etc/ 2>/dev/null
nslookup deeptutor.duckdns.org dns.duckdns.org
ip route
ping -c 1 8.8.8.8
nslookup google.com
nslookup duckdns.org
nslookup duckdns.org 8.8.8.8
nslookup deeptutor.duckdns.org 8.8.8.8
sudo ufw status
crontab -l
sudo crontab -l
ls -la /etc/cron.d /etc/cron.daily /etc/cron.hourly /etc/cron.weekly /etc/cron.monthly
systemctl list-units --all | grep -i duck
nslookup test.duckdns.org 8.8.8.8
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount -t tmpfs none /tmp && mkdir -p /tmp/run && touch /tmp/run/Hello.java && mount --bind /tmp/Hello.java /tmp/run/Hello.java && runuser -u sandbox_user -- ls -la /tmp/run"
mkdir -p /tmp/test_dir && touch /tmp/test_dir/a.txt && sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- ls -la /tmp/run"
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- ls -la /tmp"
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- python3 -c \"import os; print(os.listdir('/home'))\""
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- python3 -c \"import os; print(os.listdir('/home/deepcode'))\""
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- '/usr/bin/python3' '-c' 'import os; print(os.listdir(\"/tmp/run\"))'"
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- '/usr/bin/python3' '-c' 'import os; print(os.listdir(\"/tmp\"))'"
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- '/usr/bin/python3' '-c' 'import os; print(os.listdir(\"/\"))'"
sudo unshare --net --pid --fork --ipc --mount --mount-proc bash -c "mount --bind /tmp/test_dir /mnt && mount -t tmpfs none /tmp && mkdir -p /tmp/run && mount --move /mnt /tmp/run && runuser -u sandbox_user -- ls -la /var/log"
sudo systemctl restart api-postgres.service
pnpm run test:validation
sleep 5 && pnpm run test:validation
journalctl -u api-postgres.service -n 50 --no-pager
sleep 5 && pnpm run test:validation
cat /etc/caddy/Caddyfile
systemctl status systemd-resolved
nslookup deeptutor.duckdns.org 1.1.1.1 || nslookup deeptutor.duckdns.org 8.8.8.8
ls ~/
ls ~/2026-05-27_public.docx 
ls ~
ls ~/DeepTutor/
clear
systemctl status deeptutor.service 
journalctl -u deeptutor.service 
systemctl status deeptutor.service 
sudo systemctl stop deeptutor.service 
systemctl status deeptutor.service 
systemctl start deeptutor.service 
sudo systemctl start deeptutor.service 
systemctl start deeptutor.service 
systemctl status deeptutor.service 
watch -n 1 systemctl status deeptutor.service 
cls
clear
sudo -l
sudo su sandbox_user 
watch -n 1 systemctl status deeptutor.service 
man sudo
sudo nano /etc/sudoers
fetch
neofetch
sudo apt install neofetch
neofetch
la
less .env
la DeepTutor/
less .env.example 
watch -n 1 systemctl status deeptutor.service 
systemctl status deeptutor.service 
nano /etc/systemd/system/deeptutor.service 
nano /home/deepcode/scripts/deeptutor_run.sh
ls
ls server/
python --version
python3 --version
ls
ls web
ls web/deeptutor/
clear
pg_dump -U postgresql -W -d app_db -f sql/dump.sql
psql -U postgresql -W
nano .env
sudo -u postgres psql
sudo -u postgresql psql
sudo psql -U postgresql
sudo psql -U wog
sudo psql -U postgres
sudo ls /var/lib/postgresql/
sudo ls -a /var/lib/postgresql/16/
psql -U postgres -W
sudo -u postgres psql
psql -U postgresql -h localhost
psql -U postgresql -h localhost -d app_db
pg_dump -U postgresql -h localhost -d app_db -s
clear
pg_dump -U postgresql -h localhost -d app_db -s > sql/dump.sql
head sql/dump.sql 
tail sql/dump.sql 
clear
psql -U postgresql -h localhost -d app_db
pg_dump -U postgresql -h localhost -d app_db -a -t documents -t knowledge_chunks
clear
pg_dump -U postgresql -h localhost -d app_db -a -t documents -t knowledge_chunks >> sql/dump.sql
nano sql/dump.sql 
ll
clear
ll -hs sql/
