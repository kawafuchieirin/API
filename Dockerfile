FROM public.ecr.aws/lambda/python:3.11

COPY app /var/task

RUN pip install fastapi mangum uvicorn

CMD ["main.app"]
