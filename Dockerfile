FROM node:latest

# Install gh CLI tool, so we can use this container to make pull requests
RUN wget https://github.com/cli/cli/releases/download/v2.22.1/gh_2.22.1_linux_amd64.deb
RUN dpkg -i gh_2.22.1_linux_amd64.deb
RUN rm gh_2.22.1_linux_amd64.deb


# Install oh-my-zsh, a shiny terminal with autocomplete
RUN apt-get install zsh -y
ENV SHELL=/bin/zsh
RUN chsh -s $(which zsh)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Node stuff
RUN apt-get update
RUN npm update
RUN npm install -g npm
RUN npm install
RUN npx playwright install
RUN npx playwright install-deps

# Copy in the repository we're working on
WORKDIR /usr/local/hamsoft-svelte
COPY . .

CMD ["zsh"]