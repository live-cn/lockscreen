FROM gitpod/workspace-full

USER gitpod

# Install Android SDK
RUN mkdir -p /home/gitpod/android-sdk && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip && \
    unzip commandlinetools-linux-6609375_latest.zip -d /home/gitpod/android-sdk/cmdline-tools && \
    rm commandlinetools-linux-6609375_latest.zip && \
    echo "export ANDROID_HOME=/home/gitpod/android-sdk" >> /home/gitpod/.bashrc && \
    echo "export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/tools/bin" >> /home/gitpod/.bashrc && \
    source /home/gitpod/.bashrc && \
    yes | sdkmanager --licenses && \
    sdkmanager "platforms;android-29" "build-tools;29.0.3"

# Setup environment variables
ENV ANDROID_HOME=/home/gitpod/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin
