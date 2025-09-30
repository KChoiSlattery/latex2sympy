FROM python:3.11-alpine

# Customize the shell prompt.
ARG USER_COLOR="\e[94m"
ARG PWD_COLOR="\e[92m\e[1m"
ARG PROMPT_CHAR_COLOR="\e[95m"
# Sometimes the "\$" escape sequence doesn't reflect whether the user is actually root. The next line fixes that.
ENV PROMPT_CHAR='$( [ "$(id -u)" -eq 0 ] && echo "#" || echo "$" )'
RUN echo "export PS1='${USER_COLOR}\u:\033[0m${PWD_COLOR}\w\033[0m ${PROMPT_CHAR_COLOR}${PROMPT_CHAR}\033[0m '" > /usr/profile
ENV ENV=/usr/profile

RUN apk update && apk add \
    git \
    python3 \
    cmake \
    make \
    g++ \
    openjdk21

WORKDIR /app

# RUN python3 -m venv venv
# RUN sh /venv/scripts/activate
# RUN pip install -r dev-requirements.txt
# RUN sh scripts/setup.sh

# After activating the venv:
# pip install conan
# conan profile detect --force