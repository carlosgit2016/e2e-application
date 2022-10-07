FROM e2e-project/base-image

COPY . ./

RUN pipenv --python /usr/bin/python3 install -d

ENTRYPOINT ["pipenv", "run"]
CMD ["boom"]
