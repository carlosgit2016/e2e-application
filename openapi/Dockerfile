FROM e2e-project/base-image

COPY . ./

RUN pipenv --python /usr/bin/python3 install -d

# Testing
RUN pipenv run tests

ENTRYPOINT ["pipenv", "run"]
CMD ["prod"]
