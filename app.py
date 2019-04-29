from flask import Flask, request

from twilio.rest import Client

app = Flask(__name__)
 
# put your own credentials here 
ACCOUNT_SID = 'AC8043b5b9422972e94a4241cff4656189' 
AUTH_TOKEN = 'e564a4605be8fcd543b03f1de4952a29' 
 
client = Client(ACCOUNT_SID, AUTH_TOKEN)
 
@app.route('/sms', methods=['POST'])
def send_sms():
    message = client.messages.create(
        to=request.form['To'], 
        from_='+17027100845', 
        body=request.form['Body'],
    )

    return message.sid

if __name__ == '__main__':
        app.run()