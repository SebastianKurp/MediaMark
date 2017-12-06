from flask_wtf import Form
from wtforms import StringField, BooleanField, IntegerField
from wtforms.validators import DataRequired

class CommentForm(Form):
    start_time = StringField('start_time', validators=[DataRequired()])
    end_time = StringField('end_time')
    title = StringField('title', validators=[DataRequired()])
    author = StringField('author', validators=[DataRequired()])
    mentions = StringField('mentions')
    note = StringField('note')
    quote = StringField('quote')