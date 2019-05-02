from flask import Flask, request

from twilio.rest import Client

app = Flask(__name__)
 
# put your own credentials here 
ACCOUNT_SID = '' 
AUTH_TOKEN = '' 
 
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