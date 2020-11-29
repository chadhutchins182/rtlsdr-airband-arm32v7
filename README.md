# RTLSDR-Airband for arm32v7 Raspberry Pi 4

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
![ci](https://github.com/chadhutchins182/rtlsdr-airband-arm32v7/workflows/ci/badge.svg?branch=main)
[![GitHub Issues](https://img.shields.io/github/issues/chadhutchins182/rtlsdr-airband-arm32v7.svg)](https://github.com/chadhutchins182/rtlsdr-airband-arm32v7/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/chadhutchins182/rtlsdr-airband-arm32v7.svg)](https://github.com/chadhutchins182/rtlsdr-airband-arm32v7/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>

This is a Raspberry Pi 4 (arm32v7) Docker container for [szpajder/RTLSDR-Airband](https://github.com/szpajder/RTLSDR-Airband) software.

## Getting Started <a name = "getting_started"></a>

1. Pull Docker image 

```bash
docker pull chadhutchins182/rtlsdr-airband-arm32v7:latest
```

2. Setup __rtl_airband.conf__ file. See: [General Configuration File Structure](https://github.com/szpajder/RTLSDR-Airband/wiki/General-configuration-file-structure)
 
3. Run container
    * Provide device mount for the USB dongle
    * Provide volume mount for .conf file 

### Example docker-compose.yml

```yaml
version: "3.8"
networks:
  - rtlsdrnet
services:
  airband:
    image: chadhutchins182/rtlsdr-airband-arm32v7:latest
    container_name: airband
    restart: always
    tty: true
    privileged: true
    devices:
      - /dev/bus/usb/001/003:/dev/bus/usb/001/001
    volumes:
      - /home/pi/CODE/docker/airband/rtl_airband.conf:/rtl_airband.conf
      - /home/pi/CODE/airband/atc-archives:/archives
    networks:
      - rtlsdrnet
```
