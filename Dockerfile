FROM python:3

COPY website /website

EXPOSE 8000

ENTRYPOINT cd /website && python3 -m http.server
