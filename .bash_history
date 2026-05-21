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
