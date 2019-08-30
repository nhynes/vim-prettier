FROM testbed/vim:latest

# install pip
ENV PACKAGES="\
    bash \
    git \
    python \
    py-pip \
    nodejs \
    npm \
"
RUN apk --update add $PACKAGES && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

#  install supported vim8 and neovim 
RUN install_vim -tag v7.4.052 -name vim7 -build \ 
                -tag v8.1.0519 -name vim -build \
                -tag neovim:v0.3.5 -name neovim -build 
# upgrade node and yarn
RUN npm install -g npm yarn

# install vint
RUN pip install typing>=3.6.2 pathlib==1.0.1 enum34>=1.0.4 vim-vint==0.3.19
