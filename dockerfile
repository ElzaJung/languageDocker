FROM libretranslate/libretranslate

ARG PORT=5000
ENV PORT=${PORT}

EXPOSE ${PORT}

CMD ["sh", "-c", "./venv/bin/libretranslate --port $$PORT"]
