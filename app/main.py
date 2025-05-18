from fastapi import FastAPI, Request

app = FastAPI()

@app.get("/")
async def read_root():
    return {"message": "GET request successful"}

@app.post("/")
async def post_root(request: Request):
    data = await request.json()
    return {"message": "POST request successful", "data": data}
