# Octoprint with mjpg_streamer yu12 support
Wanted to use Octoprint in docker with mjpg_streamer with the yu12 patches for some old janky cameras.

So I made that.

For example, this is a chunk from my `docker-compose.yml`
```yaml
version: '2.4'
services:
  monoprice-mini-maker-select:
    image: matthewbaggett/octoprint-mjpg-streamer-yu12:latest
    restart: unless-stopped
    ports:
      - 80:80
      - 8080:8080
    devices:
     # The printer by its by-id path, so we can have multiple printers attached
     - /dev/serial/by-id/usb-Malyan_System_Malyan_3D_Printer_207D36504652-if00:/dev/ttyACM0
     # The video device by its by-id path, so we can have multiple cameras attached
     - /dev/v4l/by-id/usb-046d_08b2-video-index0:/dev/video0
    volumes:
     - /home/geusebio/octoprint/monoprice-mini-maker-select:/octoprint
    environment:
      - ENABLE_MJPG_STREAMER=true
      - MJPG_STREAMER_INPUT=-y -n -r 640x480
```