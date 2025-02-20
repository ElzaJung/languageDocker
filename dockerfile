FROM libretranslate/libretranslate:latest
EXPOSE 5000
ENTRYPOINT []  # Clear the base image's entrypoint
CMD ["libretranslate", "--host", "0.0.0.0", "--port", "5000"]
