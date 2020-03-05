# Lab 3 - Deploying a Springboot pipeline

### Install tkn cli

Download the latest binary executable for your operating system:

* Mac OS X

  - `tektoncd-cli` can be installed as a [brew tap](https://brew.sh):

  ```shell
  brew tap tektoncd/tools
  brew install tektoncd/tools/tektoncd-cli
  ```

  - Or by the [released tarball](https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Darwin_x86_64.tar.gz):

  ```shell
  # Get the tar.xz
  curl -LO https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Darwin_x86_64.tar.gz
  # Extract tkn to your PATH (e.g. /usr/local/bin)
  sudo tar xvzf tkn_0.8.0_Darwin_x86_64.tar.gz -C /usr/local/bin tkn
  ```

* Windows

  - `tektoncd-cli` can be installed as a [Chocolatey package](https://chocolatey.org/packages/tektoncd-cli/):

  ```shell
  choco install tektoncd-cli --confirm
  ```

  - Or by the released zip file in the instructions below:

  - Uncompress the [zip file](https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Windows_x86_64.zip)
  - Add the location of where the executable is to your `Path` by opening `Control Panel>System and Security>System>Advanced System Settings`
  - Click on `Environment Variables`, select the `Path` variable, and click `Edit`
  - Click `New` and add the location of the uncompressed zip to the `Path`
  - Finish by clicking `Ok`

#### Linux tarballs

* [Linux AMD 64](https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Linux_x86_64.tar.gz)

  ```shell
  # Get the tar.xz
  curl -LO https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Linux_x86_64.tar.gz
  # Extract tkn to your PATH (e.g. /usr/local/bin)
  sudo tar xvzf tkn_0.8.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn
  ```
