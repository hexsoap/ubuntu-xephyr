FROM hexsoap/ubuntu-base:v1.0
RUN apt-get update && apt-get install -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"\
	zsh \
	fontconfig \
	python-pip \
  tmux \
  i3 \
  i3blocks \
  locales \
  xserver-xephyr \
	&& rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/archives && locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
COPY .oh-my-zsh /root/.oh-my-zsh
COPY .zsh* /root/
COPY .tmux.conf /root/
RUN mkdir /root/.fonts
RUN pip install powerline-status
COPY PowerlineSymbols.otf /root/.fonts
COPY 10-powerline-symbols.conf /etc/fonts/conf.d/
RUN fc-cache -vf /etc/fonts/conf.d/
RUN chsh -s /bin/zsh 
