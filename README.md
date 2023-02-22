# Charts
Repository with a set of Helm charts with my favourite applications to be deployed on Kubernetes.

## What this is for
Continuing with my learning path, I decided to create this repository as a place to store a set of Helm charts for the applications I use at home.
With this, I will learn about Kubernetes and Helm, which are things present on my daily basis and what I would like to improve my knowledge about.

## Pre-requisites
- [Kubernetes](https://kubernetes.io) environment on-premise or [Micro-k8s](https://microk8s.io/). Of course a Kubernetes cluster on the cloud is also suitable in case you can afford it :).
- [Helm](https://helm.sh/) installed on the server and locally in case you want to develop your own charts.

## Applications
### JDownloader
[JDownloader](https://jdownloader.org/) is a popular and open-code Java application to download content from Internet such as games, applications and multimedia.
It must not be used to take copyright-protected files.

The chart set here is prepared to store the configuration and content on the host's disk.

Example of installation by providing custom values for persistent configuration and downloads.
```bash
helm install jdownloader /mnt/helms/jdownloader-1.0.0.tgz --namespace=default --set spec.volumes.configPath=/mnt/config/ --set spec.volumes.downloadsPath=/mnt/downloads/
```

### Plex
[Plex](https://www.plex.tv/) gives you one place to find and access all the media that matters to you.
From personal media on your own server, to free and on-demand Movies & Shows, live TV, podcasts, and web shows, to streaming music, you can enjoy it all in one app, on any device.

The chart set here is prepared to store the configuration and content on the host's disk.

Example of installation by providing custom values for persistent configuration and media content.
```bash
helm install plex /mnt/helms/plex-1.0.0.tgz --namespace=default --set spec.volumes.configPath=/mnt/config/ --set spec.volumes.transcodingPath=/mnt/transcode/ --set spec.volumes.libraryPath=/mnt/library/ --set spec.timeZone=Europe/Madrid
```

### Jenkins
The leading open source automation server, [Jenkins](https://www.jenkins.io/) provides hundreds of plugins to support building, deploying and automating any project.

The chart set here is prepared to store the configuration on the host's disk.

Example of installation by providing custom values for persistent configuration.
```bash
helm install jenkins /mnt/helms/jenkins-1.0.0.tgz --namespace=default --set spec.volumes.homePath=/mnt/jenkins/
```

### Jenkins slaves and Sonarqube
Following the project [environment-test](https://github.com/davidleonm/environment-test), I added nodes attending my needs for the personal projects I work on. Use the ones you wish! Here further information.
* **jenkins-helm-slave:** Jenkins node to execute the build related to this project, generate Helm chart packages and move them to a server.
* **jenkins-netcore-slave:** Jenkins node to build .NET Core projects.
* **jenkins-python-slave:** Jenkins node to build Python projects.
* **docker-registry:** Docker registry for staging Docker images. Currently used in the [Weather Station Dashboard](https://github.com/weather-station-project/dashboard) project. More [info](https://hub.docker.com/_/registry).
* **sonarqube:** [SonarQube](https://hub.docker.com/_/sonarqube) is the leading tool for continuously inspecting the Code Quality and Security of your codebases, and guiding development teams during Code Reviews.

Example of installations by providing custom values for persistent configuration.
```bash
helm install jenkins-helm-slave /mnt/helms/jenkins-helm-slave-1.0.0.tgz --namespace default --set spec.volumes.sshdConfigPath=/mnt/jenkins-slaves/sshd_config --set spec.volumes.authorizedKeysPath=/mnt/jenkins-slaves/jenkins_key.pub --set spec.volumes.helmsPath=/mnt/helms/
helm install jenkins-netcore-slave /mnt/helms/jenkins-netcore-slave-1.0.0.tgz --namespace default --set spec.volumes.sshdConfigPath=/mnt/jenkins-slaves/sshd_config --set spec.volumes.authorizedKeysPath=/mnt/jenkins-slaves/jenkins_key.pub --set spec.volumes.dockerSockPath=/var/run/docker.sock
helm install jenkins-python-slave /mnt/helms/jenkins-python-slave-1.0.0.tgz --namespace default --set spec.volumes.sshdConfigPath=/mnt/jenkins-slaves/sshd_config --set spec.volumes.authorizedKeysPath=/mnt/jenkins-slaves/jenkins_key.pub --set spec.volumes.dockerSockPath=/var/run/docker.sock --set spec.volumes.qemuPath=/mnt/jenkins-slaves/qemu-arm-static
helm install docker-registry /mnt/helms/docker-registry-1.0.0.tgz --namespace default --set spec.volumes.registryPath=/mnt/docker-registry/
helm install sonarqube /mnt/helms/helms/sonarqube-1.0.0.tgz --namespace default --set spec.volumes.dataPath=/mnt/sonarqube/data/ --set spec.volumes.logsPath=/mnt/sonarqube/logs/ --set spec.volumes.extensionsPath=/mnt/sonarqube/extensions/
```


## Change-log
I will not use branching for this project so I will just create tags when I consider a chart is finished. The code will change without further notice so fork or copy it when you need it.

* **v1.4.0** - Added slaves and other nodes for the Jenkins environment.
* **v1.3.0** - Added [Jenkins](https://www.jenkins.io/). Updated Plex deployment to mount library as readonly.
* **v1.2.0** - Added [Plex](https://www.plex.tv/).
* **v1.1.1** - Changed JDownloader values to help to override some paths by helm commands. Provided example of installation command.
* **v1.1.0** - Added jenkins file to package charts and copy them remotely. It uses the helm Jenkins node present [here](https://github.com/davidleonm/environment-test).
* **v1.0.0** - First version with [JDownloader](https://jdownloader.org/).

## License
Use this code as you wish! Totally free to be copied/pasted.
## Donation
If you liked the project, you found it useful and you are willing to contribute, don't hesitate! I will be very grateful! :-)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=4TFR2PQ2J3KLA&item_name=If+you+liked+the+project+and+you+are+willing+to+contribute%2C+don%27t+hesitate%21+I+will+be+very+grateful%21+%3A-%29&currency_code=EUR)