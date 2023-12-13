# Systemd

[Unit]
Description=Appname
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/Downloads/fastapi_robust_improvements
LimitNOFILE=4096
ExecStart=/usr/local/bin/poetry run gunicorn main:app --workers 2 -k uvicorn.workers.UvicornWorker --bind unix:appname.sock --error-logfile /root/appname/error_log.txt
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target