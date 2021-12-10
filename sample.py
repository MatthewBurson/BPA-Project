import cgi,os

print('content-type:text/html\r\n\r\n')

form=cgi.FieldStorage()
pn=str(form.getvalue("pname"))
des=str(form.getvalue("des"))
fle=form['filename']

fn=os.path.basename(fle.filename)
open("C:/users")