FROM alpine:3

ENV TZ=America/Montreal
ENV RCLONE_CONFIG=/dev/null
ENV RCLONE_CONFIG_GDRIVE_TYPE=drive
ENV RCLONE_CONFIG_GDRIVE_SCOPE=drive

RUN  apk add --no-cache rclone tzdata

WORKDIR /app

RUN mkdir mirror

COPY entrypoint.sh rclone.sh cron.conf  ./

RUN chmod +x entrypoint.sh rclone.sh

RUN crontab cron.conf

CMD ["/app/entrypoint.sh"]
