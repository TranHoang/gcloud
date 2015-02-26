import datetime
from google.appengine.ext import db
from google.appengine.api import users


class Employee(db.Model):
  name = db.StringProperty(required=True)
  role = db.StringProperty(required=True,
                           choices=set(["executive", "manager", "producer"]))
  hire_date = db.DateProperty()
  new_hire_training_completed = db.BooleanProperty(indexed=False)
  email = db.StringProperty()


e = Employee(name="John",
             role="manager",
             email=users.get_current_user().email())
e.hire_date = datetime.datetime.now().date()
e.put()