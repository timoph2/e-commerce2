
from flask import Flask, render_template, request
# pip install 
import os 

app = Flask(__name__)
app.config.from_object('config')
#db = SQLAlchemy(app) 


@app.route('/')
def home():
    return render_template('pages/placeholder.home.html')

 

@app.route('/forgot')
def forgot():
    form = ForgotForm(request.form)
    return render_template('forms/forgot.html', form=form)

# Error handlers.


# Default port:
if __name__ == '__main__':
    app.run()

# Or specify port manually:
'''
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
'''