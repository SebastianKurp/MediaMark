from flask_wtf import Form
from wtforms import StringField, BooleanField, IntegerField
from wtforms.validators import DataRequired

class CommentForm(Form):
    time = StringField('time', validators=[DataRequired()])
    title = StringField('title', validators=[DataRequired()])
    author = StringField('author', validators=[DataRequired()])
    mentions = StringField('mentions')
    note = StringField('note')
    quote = StringField('quote')