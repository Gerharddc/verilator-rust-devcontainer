FROM ghcr.io/gerharddc/verilator-devcontainer:v5.028

# Install rust and project dependencies
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN apt-get install -y pkg-config libssl-dev libclang-dev

# It is easier to get XML formatted test results with cargo-nextest
RUN curl -LsSf https://get.nexte.st/latest/linux | tar zxf - -C ${CARGO_HOME:-~/.cargo}/bin

# Using trunk.io can simplify automated testing
RUN curl https://get.trunk.io -fsSL | bash
