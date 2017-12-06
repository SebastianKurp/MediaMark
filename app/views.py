import os
from flask import render_template, send_from_directory, flash, redirect
from app import app
import xml.etree.ElementTree as ET
from .forms import CommentForm
from xml.dom import minidom

tree = ET.parse(os.path.join('app','static','schema.xml'))
root = tree.getroot()
# comments = root.find('file/comments')
comments = root.find('comments')

@app.route('/', methods=['GET', 'POST'])
@app.route('/index', methods=['GET', 'POST'])
def index():
    new_comment = CommentForm()
    if new_comment.validate_on_submit():
        flash('New comment created by %s' % new_comment.author.data)
        saveComment(new_comment)
        xmlstr = minidom.parseString(ET.tostring(root)).toprettyxml(indent="\t")
        with open(os.path.join('app','static', root.attrib['name'] + '.xml'), "w") as f:
            f.write(xmlstr)
        print(os.path.join('app', 'static', root.attrib['name'] + '.xml'))
        tree = ET.parse(os.path.join('app', 'static', root.attrib['name'] + '.xml'))
        #return redirect('/index')
    return render_template('index.html',
                            title='Home',
                            comments=comments,
                            name=root.attrib['name'],
                            form=new_comment,
                            downloadPath=os.path.join('download', root.attrib['name'] + '.xml'))

@app.route('/file')
def files():
    tree = ET.parse(os.path.join('app', 'static', 'schema.xml'))
    return redirect('/index')

@app.route('/download/<path:filename>')
def downloadFile(filename):
    return send_from_directory('static', filename)

@app.route('/new-comment', methods=['GET', 'POST'])
def newComment():
    new_comment = CommentForm()
    if new_comment.validate_on_submit():
        flash('New comment created by %s' % new_comment.author.data)
        saveComment(new_comment)
        xmlstr = minidom.parseString(ET.tostring(root)).toprettyxml(indent="\t")
        with open(os.path.join('app','static', root.attrib['name'] + '.xml'), "w") as f:
            f.write(xmlstr)
        #print os.path.join('app', 'static', root.attrib['name'] + '.xml')
        tree = ET.parse(os.path.join('app', 'static', root.attrib['name'] + '.xml'))
        return redirect('/index')
    return render_template('comment.html',
                            form=new_comment)

def saveComment(new_comment):
    comment = ET.SubElement(comments, "comment")
    comment.set("start_time", new_comment.time.data)
    title = ET.SubElement(comment, "title")
    title.text = new_comment.title.data
    author = ET.SubElement(comment, "author")
    author.text = new_comment.author.data
    mentions = ET.SubElement(comment, "mentions")
    mentions.text = new_comment.mentions.data
    quote = ET.SubElement(comment, "quote")
    quote.text = new_comment.quote.data
    note = ET.SubElement(comment, "note")
    note.text = new_comment.note.data
    tree = ET.ElementTree(root)
    return