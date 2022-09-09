.PHONY: splash
splash:
	convert $(IMAGE) -background '#000000' -gravity center -extent 1280x720 splash/splash-720.png
	convert $(IMAGE) -background '#000000' -gravity center -extent 1024x768 splash/splash-768.png
	convert $(IMAGE) -background '#000000' -gravity center -extent 1920x1080 splash/splash-1080.png
	convert $(IMAGE) -background '#000000' -gravity center -extent 1920x1200 splash/splash-1200.png
	convert $(IMAGE) -background '#000000' -gravity center -extent 3840x2160 splash/splash-2160.png
	convert splash/splash-720.png splash/boot-logo.bmp
	gzip -f -9 splash/boot-logo.bmp
