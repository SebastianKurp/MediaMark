from flask_wtf import Form
from wtforms import StringField, BooleanField
from wtforms.validators import DataRequired

class CommentForm(Form):
    title = StringField('title', validators=[DataRequired()])
    author = StringField('author', validators=[DataRequired()])
    mentions = StringField('mentions')
    note = StringField('note')
    quote = StringField('quote')