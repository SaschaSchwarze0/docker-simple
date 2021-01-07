ARG FILE_NAME=myFile

FROM saschaschwarze/busybox:latest AS builder
ARG FILE_NAME

RUN echo $FILE_NAME && touch /$FILE_NAME.txt && stat /$FILE_NAME.txt;

FROM saschaschwarze/busybox:latest
ARG FILE_NAME

RUN echo $FILE_NAME && touch /$FILE_NAME.txt && stat /$FILE_NAME.txt;
COPY --from=builder /$FILE_NAME.txt /