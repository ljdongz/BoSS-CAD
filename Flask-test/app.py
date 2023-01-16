from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/hello/')
def hello_world():
    name = request.args.get('name')
    return {"message" : name + "님, 환영합니다."}
        
if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)
